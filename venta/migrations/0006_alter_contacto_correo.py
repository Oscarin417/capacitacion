# Generated by Django 5.1.4 on 2025-01-10 18:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("venta", "0005_rename_departamnto_producto_departamento_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="contacto",
            name="correo",
            field=models.EmailField(blank=True, max_length=200, null=True, unique=True),
        ),
    ]
