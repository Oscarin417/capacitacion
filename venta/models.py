from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Contacto(models.Model):
    telefono = models.CharField(max_length=10, null=True, blank=True)
    celular = models.CharField(max_length=10, null=False, blank=False)
    correo = models.EmailField(max_length=200, null=True, blank=True)
    url = models.URLField(null=True, blank=True)

class Domicilio(models.Model):
    pais = models.CharField(max_length=50, null=False, blank=False)
    estado = models.CharField(max_length=50, null=False, blank=False)
    municipio = models.CharField(max_length=50, null=False, blank=False)
    cp = models.CharField(max_length=5, null=False, blank=False, verbose_name='Codigo postal')
    colonia = models.CharField(max_length=50, null=False, blank=False)
    calle = models.CharField(max_length=50, null=False, blank=False)
    ne = models.CharField(max_length=50, null=False, blank=False, verbose_name='Numero exterior')
    ni = models.CharField(max_length=50, null=True, blank=True, verbose_name='Numero interior')
    referencia = models.TextField(null=True, blank=True)

class Fiscal(models.Model):
    rfc = models.CharField(max_length=10, blank=False, null=False, verbose_name='RFC')
    rs = models.CharField(max_length=200, blank=False, null=False, verbose_name='Razon social')
    domicilio = models.ForeignKey(Domicilio, null=True, on_delete=models.SET_NULL)

class Negocio(models.Model):
    nombre = models.CharField(max_length=200, null=False, blank=False)
    contacto = models.ForeignKey(Contacto, null=True, on_delete=models.SET_NULL)
    fiscal = models.ForeignKey(Fiscal, null=True, on_delete=models.SET_NULL)

    def domicilio(self):
        ne = self.fiscal.domicilio.ne
        calle = self.fiscal.domicilio.calle
        return f'{calle} {ne}'

class Usuario(models.Model):
    GENEROS = [
        ('', 'Seleccione un genero'),
        ('M', 'Masculino'),
        ('F', 'Femenino')
    ]
    ROLES = [
        ('', 'Seleccione un rol'),
        (1, 'Administrador'),
        (2, 'Vendedor'),
    ]
    nombres = models.CharField(max_length=100, null=False, blank=False, verbose_name='Nombre(s)')
    apellidos = models.CharField(max_length=100, null=False, blank=False)
    genero = models.CharField(max_length=1, choices=GENEROS, blank=True, null=True)
    rol = models.IntegerField(choices=ROLES, blank=True, null=True)
    contacto = models.ForeignKey(Contacto, null=True, on_delete=models.SET_NULL)
    user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    imagen = models.ImageField(upload_to='users', null=True, blank=True)

    def __str__(self):
        return self.nombres

    def generos(self):
        g = self.genero
        gc = ''
        if g == 'M':
            gc = 'Masculino'
        else:
            gc = 'Femenino'
        return gc

    def roles(self):
        r = self.rol
        rc = ''
        if r == 1:
            rc = 'Administrador'
        else:
            rc = 'Vendedor'
        return rc

class Marca(models.Model):
    nombre = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return self.nombre

class Cliente(models.Model):
    nombres = models.CharField(max_length=100, null=False, blank=False, verbose_name='Nombre(s)')
    apellidos = models.CharField(max_length=100, null=False, blank=False)
    contacto = models.ForeignKey(Contacto, null=True, on_delete=models.SET_NULL)
    fiscal = models.ForeignKey(Fiscal, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.nombres

    def domicilio(self):
        ne = self.fiscal.domicilio.ne
        calle = self.fiscal.domicilio.calle
        return f'{calle} {ne}'

class Caja(models.Model):
    clave = models.CharField(max_length=50, null=False, blank=False)
    nombre = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return self.nombre
    
class Departamento(models.Model):
    nombre = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return self.nombre

class Medida(models.Model):
    nombre = models.CharField(max_length=100, null=False, blank=False)

class Producto(models.Model):
    nombre = models.CharField(max_length=100, null=False, blank=False)
    descripcion = models.TextField()
    marca = models.ForeignKey(Marca, null=True, on_delete=models.SET_NULL)
    existencia = models.IntegerField(null=False, blank=False)
    departamento = models.ForeignKey(Departamento, null=True, on_delete=models.SET_NULL)
    precio = models.DecimalField(max_digits=11, decimal_places=2, null=False, blank=False)
    em = models.IntegerField(null=False, blank=False, verbose_name='Existencia minima')

class MCaja(models.Model):
    fecha = models.DateTimeField()
    movimento = models.CharField(max_length=1, null=False, blank=False)
    caja = models.ForeignKey(Caja, null=True, on_delete=models.SET_NULL)
    empleado = models.ForeignKey(Usuario, null=True, on_delete=models.SET_NULL)
    ma = models.DecimalField(max_digits=11, decimal_places=2, null=False, blank=False, verbose_name='Monto abertura')
    mc = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True, verbose_name='Monto cierre')
    ganacia = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True)

class Venta(models.Model):
    METODOPAGO = [
        ('', 'Seleccione un metodo de pago'),
        ('E', 'Efectivo'),
        ('T', 'Transferencia'),
        ('C', 'Tarjeta de credito'),
        ('D', 'Tarjeta de debito')
    ]

    fecha = models.DateTimeField()
    caja = models.ForeignKey(Caja, null=True, on_delete=models.SET_NULL)
    empleado = models.ForeignKey(Usuario, null=True, on_delete=models.SET_NULL)
    cliente = models.ForeignKey(Cliente, null=True, on_delete=models.SET_NULL)
    total = models.DecimalField(max_digits=11, decimal_places=2, null=False, blank=False)
    total_descuento = models.DecimalField(max_digits=11, decimal_places=2, null=False, blank=False)
    importe = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True)
    cambio = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True)
    mp = models.CharField(max_length=1, null=True, blank=True, choices=METODOPAGO, verbose_name='Metodo de pago')

    def metodo(self):
        mp = self.mp
        pago=''

        if mp=='E':
            pago='Efectivo'
        elif mp=='T':
            pago='Transferencia'
        elif mp=='C':
            pago='Tarjeta de credito'
        elif mp=='D':
            pago=='Tarjeta de debito'

        return pago

class DetalleVenta(models.Model):
    venta = models.ForeignKey(Venta, null=True, on_delete=models.SET_NULL)
    producto = models.ForeignKey(Producto, null=True, on_delete=models.SET_NULL)
    cantidad = models.IntegerField(null=False, blank=False)
    importe = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True)
    descuento = models.DecimalField(max_digits=11, decimal_places=2, null=True, blank=True)
    total = models.DecimalField(max_digits=11, decimal_places=2, null=False, blank=False)