# Generated by Django 3.1.3 on 2020-12-12 08:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('systemadmins', '0003_tokendefinition_can_create'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tokendefinition',
            name='can_create',
            field=models.JSONField(default={'can_create': ['students']}, max_length=255),
        ),
    ]