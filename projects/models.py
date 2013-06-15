import datetime
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.backends import ModelBackend

from taggit.managers import TaggableManager

from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill

from django.core.urlresolvers import reverse


class Project(models.Model):
  class Meta:
    verbose_name = 'Projekt'
    verbose_name_plural = 'Projekte'
    db_table = 'projects'
    get_latest_by = 'modified'
    ordering = ['title']
    permissions = (
      ('can_edit', "Can edit project"),
    )

  user = models.ForeignKey(User)
  slug = models.SlugField()
  title = models.CharField(max_length=255)
  about = models.TextField(blank=True, null=True)

  photo = models.ImageField(upload_to='project', blank=True, null=True)
  
  # derived images: https://github.com/matthewwithanm/django-imagekit#readme
  photo_thumbnail = ImageSpecField(source='photo',
    processors=[ResizeToFill(100, 100)],
    format='JPEG',
    options={'quality': 60}
  )
  photo_medium = ImageSpecField(source='photo',
    processors=[ResizeToFill(200, 200)],
    format='JPEG',
    options={'quality': 60}
  )
  photo_big = ImageSpecField(source='photo',
    processors=[ResizeToFill(380, 380)],
    format='JPEG',
    options={'quality': 60}
  )

  start_date = models.DateField(blank=True, null=True)
  end_date = models.DateField(blank=True, null=True)

  tags = TaggableManager(blank=True)

  created = models.DateTimeField(auto_now_add=True)
  modified = models.DateTimeField(auto_now=True)
  
  def __unicode__(self):
    return 'Project #' + str(self.id) + ': ' + self.title
    
  def admin_thumbnail(self):
    if self.photo:
      return '<img src="%s">' % self.photo_thumbnail.url
  admin_thumbnail.allow_tags = True
  
  def get_absolute_url(self):
    return reverse('project', args=(self.id,))
  
  def save(self, *args, **kwargs):
    if not self.slug:
      pass
    
    super(Project, self).save(*args, **kwargs)


class PermBackend(ModelBackend):
  def has_perm(self, user, perm, obj=None):
    "Owner and admin can edit"

    if perm != 'can_edit' or obj is None:
      return super(PermBackend, self).has_perm(user, perm, obj)
    
    if user.is_superuser:
      return True
    
    return obj.user.id == user.id

