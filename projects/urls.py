#
# -*- coding: utf-8 -*-

from django.conf.urls import patterns, include, url
from projects.views import ProjectDetailView, ProjectAddView, ProjectEditView
from projects.models import Project

from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

import django.contrib.auth.urls

urlpatterns = patterns('projects.views',
  url(r'^$', 'index', name='project_list'),
)

urlpatterns += patterns('',
  url(r'^project/(?P<pk>\d+)/$', ProjectDetailView.as_view(), name='project'),
  url(r'^project/add/$', ProjectAddView.as_view(), name='add_project'),
  url(r'^project/edit/(?P<pk>\d+)/$', ProjectEditView.as_view(), name='edit_project'),

  url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
  url(r'^admin/', include(admin.site.urls)),

  url(r'^user/logout/$', 'django.contrib.auth.views.logout', {
    'next_page': '/' 
  }),

  url(r'^user/', include(django.contrib.auth.urls)),
)

if settings.DEBUG:
  urlpatterns += patterns('',
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', { 
      'document_root': settings.MEDIA_ROOT,
      'show_indexes': True
    }),
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve', { 
      'document_root': settings.STATIC_ROOT,
    }),
  )
  
  urlpatterns += staticfiles_urlpatterns()
