# Generated by Django 5.1.4 on 2025-01-07 17:01

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("venta", "0002_alter_domicilio_cp_alter_domicilio_ne"),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Caja",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("clave", models.CharField(max_length=50)),
                ("nombre", models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name="Departamento",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name="Marca",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name="Medida",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name="Cliente",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombres", models.CharField(max_length=100, verbose_name="Nombre(s)")),
                ("apellidos", models.CharField(max_length=100)),
                (
                    "contacto",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.contacto",
                    ),
                ),
                (
                    "fiscal",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.fiscal",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Producto",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombre", models.CharField(max_length=100)),
                ("descripcion", models.TextField()),
                ("existencia", models.IntegerField()),
                ("precio", models.DecimalField(decimal_places=2, max_digits=11)),
                ("em", models.IntegerField(verbose_name="Existencia minima")),
                (
                    "departamnto",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.departamento",
                    ),
                ),
                (
                    "marca",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.marca",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Usuario",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("nombres", models.CharField(max_length=100, verbose_name="Nombre(s)")),
                ("apellidos", models.CharField(max_length=100)),
                (
                    "genero",
                    models.CharField(
                        blank=True,
                        choices=[
                            ("", "Seleccione un genero"),
                            ("M", "Masculino"),
                            ("F", "Femenino"),
                        ],
                        max_length=1,
                        null=True,
                    ),
                ),
                (
                    "rol",
                    models.IntegerField(
                        blank=True,
                        choices=[
                            ("", "Seleccione un rol"),
                            (1, "Administrador"),
                            (2, "Vendedor"),
                        ],
                        null=True,
                    ),
                ),
                (
                    "contacto",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.contacto",
                    ),
                ),
                (
                    "user",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="MCaja",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("fecha", models.DateTimeField()),
                ("movimento", models.CharField(max_length=1)),
                (
                    "ma",
                    models.DecimalField(
                        decimal_places=2, max_digits=11, verbose_name="Monto abertura"
                    ),
                ),
                (
                    "mc",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        max_digits=11,
                        null=True,
                        verbose_name="Monto cierre",
                    ),
                ),
                (
                    "ganacia",
                    models.DecimalField(
                        blank=True, decimal_places=2, max_digits=11, null=True
                    ),
                ),
                (
                    "caja",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.caja",
                    ),
                ),
                (
                    "empleado",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="venta.usuario",
                    ),
                ),
            ],
        ),
    ]
