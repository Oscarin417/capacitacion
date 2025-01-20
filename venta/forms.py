from django import forms
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password

class ContactoForm(forms.ModelForm):
    class Meta:
        model = Contacto
        fields = [
            'telefono',
            'celular',
            'correo',
            'url'
        ]
        widgets = {
            'correo': forms.EmailInput(),
            'url': forms.URLInput()
        }

class DomicilioForm(forms.ModelForm):
    class Meta:
        model = Domicilio
        fields = [
            'pais',
            'estado',
            'municipio',
            'cp',
            'colonia',
            'calle',
            'ne',
            'ni',
            'referencia'
        ]
        widgets = {
            'cp': forms.NumberInput(),
            'ne': forms.NumberInput(),
            'referencia': forms.Textarea()
        }

class FiscalForm(forms.ModelForm):
    class Meta:
        model = Fiscal
        fields = ['rfc', 'rs']
        widgets = {'__all__'}

class NegocioForm(forms.ModelForm):
    class Meta:
        model = Negocio
        fields = ['nombre']
        widgets = {'__all__'}

class MarcaForm(forms.ModelForm):
    class Meta:
        model = Marca
        fields = ['nombre']
        widgets = {'__all__'}

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ['nombres', 'apellidos']
        widgets = {'__all__'}

class CajaForm(forms.ModelForm):
    class Meta:
        model = Caja
        fields = ['clave', 'nombre']
        widgets = {'__all__'}

class DepartamentoForm(forms.ModelForm):
    class Meta:
        model = Departamento
        fields = ['nombre']
        widgets = {'__all__'}

class MedidaForm(forms.ModelForm):
    class Meta:
        model = Medida
        fields = ['nombre']
        widgets = {'__all__'}

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = [
            'nombre',
            'descripcion',
            'marca',
            'existencia',
            'departamento',
            'precio',
            'em'
        ]
        widgets = {
            'descripcion': forms.Textarea(),
            'existencia': forms.NumberInput(),
            'em': forms.NumberInput(),
            'precio': forms.NumberInput(),
            'departamento': forms.Select(),
            'marca': forms.Select(),
        }

class EmpleadoForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = [
            'nombres',
            'apellidos',
            'genero',
            'rol',
            'imagen'
        ]
        widgets = {
            'genero': forms.Select(choices=Usuario.GENEROS),
            'rol': forms.Select(choices=Usuario.ROLES),
        }

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'password']
        widgets = {'password': forms.PasswordInput()}

    def save(self, commit=True):
        user = super().save(commit=False)
        user.password = make_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user

class RegistroForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['nombres', 'apellidos','genero']
        widgets = {'genero': forms.Select(choices=Usuario.GENEROS)}

class PerfilForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['nombres', 'apellidos', 'genero', 'imagen']
        widgets = {'genero': forms.Select(choices=Usuario.GENEROS)}

class AbrirCajaForm(forms.ModelForm):
    class Meta:
        model = MCaja
        fields = ['ma']
        widgets = {'ma': forms.NumberInput()}

