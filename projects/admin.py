from projects.models import Project 
from django.contrib import admin

class ProjectAdmin(admin.ModelAdmin):
  #date_hierarchy = 'start_date'
  list_display = ('title', 'start_date', 'end_date', 'admin_thumbnail')
  list_editable = ('start_date', 'end_date')
  prepopulated_fields = {'slug': ('title',)}
  
  #exclude = ('photo',)
  fieldsets = (
    (None, {
      'fields': (
        'slug', 
        'title', 
        'photo',
        'about', 
        'start_date', 
        'end_date',
        'tags',
      ),
    }),
  )

admin.site.register(Project, ProjectAdmin)
