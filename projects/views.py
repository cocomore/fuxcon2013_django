#
from projects.models import Project
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, render_to_response
from django.http import HttpResponseRedirect 
from django.core.urlresolvers import reverse

from django.views.generic import DetailView
from django.views.generic.edit import CreateView, UpdateView, ModelFormMixin

from django.forms import ModelForm

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from django.contrib import messages

GRID_COL = 12
NO_COL = 3
PER_PAGE = 5

def index(request):
  project_list = Project.objects.all()
  paginator = Paginator(project_list, PER_PAGE)

  page = request.GET.get('page')

  try:
    projects = paginator.page(page)

  except PageNotAnInteger:
    # If page is not an integer, deliver first page.
    projects = paginator.page(1)

  except EmptyPage:
    # If page is out of range (e.g. 9999), deliver last page of results.
    projects = paginator.page(paginator.num_pages)

  columns = [[] for x in range(0, NO_COL)]
  for i, project in enumerate(projects):
    col = i % NO_COL;
    columns[col].append(project);

  tags = Project.tags.most_common()

  return render(request, 'projects/index.html', {
    'body_class': 'projects-index',
    'columns': columns,
    'projects': projects,
    'tags': tags,
    'width': GRID_COL / NO_COL,
  })


class ProjectDetailView(DetailView):
  "Add a proprocessed date entry to the context"
  model=Project
  template_name='projects/detail.html'

  def get_context_data(self, **kwargs):
    context = super(ProjectDetailView, self).get_context_data(**kwargs)
    
    project = self.get_object()
    
    context['dates'] = ''
    if project.start_date != None and project.start_date != '0000-00-00':
      context['dates'] += project.start_date.strftime('%m/%Y')
    if project.end_date != None and project.end_date != '0000-00-00':
      context['dates'] += ' until ' + project.end_date.strftime('%m/%Y')
    elif context['dates'] != '':
      context['dates'] = 'since ' + context['dates']
    
    context['tags'] = project.tags.all()
    context['body_class'] = 'projects-view'
    
    context['can_edit'] = self.request.user.has_perm('can_edit', project)
    
    return context


class ProjectForm(ModelForm):
  class Meta:
    model = Project
    fields = ('title', 'about', 'photo', 'start_date', 'end_date', 'tags')


class LoginRequiredMixin(object):
  @method_decorator(login_required)
  def dispatch(self, *args, **kwargs):
    return super(LoginRequiredMixin, self).dispatch(*args, **kwargs)


class ProjectMixin(LoginRequiredMixin):
  """
  Common properties for all forms
  Taken from http://blog.headspin.com/?p=541
  """
  model = Project
  form_class = ProjectForm
  
  def form_valid(self, form):
    self.object = form.save(commit=False)
    self.object.user = self.request.user
    self.object.save()
    
    # save tags, cf. https://github.com/alex/django-taggit/blob/develop/docs/forms.txt
    form.save_m2m()
    
    return super(ModelFormMixin, self).form_valid(form)


class ProjectAddView(ProjectMixin, CreateView):
  pass

class ProjectEditView(ProjectMixin, UpdateView):

  def dispatch(self, request, *args, **kwargs):
    project = self.get_object()

    if not request.user.has_perm('can_edit', project):
      messages.error(request,
        'You are not allowed to edit project #' + str(project.id)
      )
      return HttpResponseRedirect(reverse('project', args=(project.id,)))
    
    return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)
    
    



