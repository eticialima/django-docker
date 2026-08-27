from typing import ClassVar

from django.contrib import admin
from django.db import models
from django_json_widget.widgets import JSONEditorWidget

from .models import Post


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'is_active', 'created_at', 'updated_at')
    list_filter = ('is_active', 'created_at', 'updated_at')
    search_fields = ('title', 'description')
    readonly_fields = ('created_at', 'updated_at')
    formfield_overrides: ClassVar = {
        models.JSONField: {'widget': JSONEditorWidget},
    }
