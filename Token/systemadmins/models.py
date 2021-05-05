from django.db import  models
from django.utils import timezone
import json

# Create your models here.


def get_default_can_create():
    return {'can_create': ['students']}


class TokenDefinition(models.Model):
    token_type_name = models.CharField(max_length=255, unique=True)
    structure = models.JSONField()
    can_create = models.CharField(max_length=255, default='students')


class TokenIdentification(models.Model):
    #token_id = models.IntegerField(primary_key=True)
    token_type_id = models.IntegerField()
    token_type_name = models.CharField(max_length=255)
    created_by = models.CharField(max_length=255)


class TokenProgress(models.Model):
    token_id = models.IntegerField()
    step = models.IntegerField()
    to = models.CharField(max_length=255)
    state_of_emergency = models.BooleanField(default=False)
    completed = models.BooleanField(default=False)
    completed_time = models.DateTimeField(default=timezone.now)

    def pre_save(self, model_instance, add):
        return timezone.now()

    class Meta:
        unique_together = ['token_id', 'step']

class TokenBody(models.Model):
    token_id = models.IntegerField()
    step = models.IntegerField()
    username = models.CharField(max_length=255)
    to = models.CharField(max_length=255)
    approval = models.BooleanField(default=False)
    state_of_emergency = models.BooleanField(default=False)
    body = models.JSONField()
    completed_time = models.DateTimeField(default=timezone.now)

    def pre_save(self, model_instance, add):
        return timezone.now()

    class Meta:
        unique_together = ['token_id', 'step']