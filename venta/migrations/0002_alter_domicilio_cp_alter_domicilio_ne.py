# Generated by Django 5.1.4 on 2025-01-06 17:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("venta", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="domicilio",
            name="cp",
            field=models.CharField(max_length=5, verbose_name="Codigo postal"),
        ),
        migrations.AlterField(
            model_name="domicilio",
            name="ne",
            field=models.CharField(max_length=50, verbose_name="Numero exterior"),
        ),
    ]
