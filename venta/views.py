from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import *
from .models import *
from datetime import datetime

# Create your views here.
@login_required
def home(request):
    return render(request, 'index.html')

@login_required
def negocio(request):
    negocios = Negocio.objects.all()
    context = {'negocios': negocios}
    return render(request, 'negocio/list.html', context)

@login_required
def negocio_store(request):
    nf = NegocioForm(request.POST or None)
    cf = ContactoForm(request.POST or None)
    ff = FiscalForm(request.POST or None)
    df = DomicilioForm(request.POST or None)
    context = {
        'nf': nf,
        'cf': cf,
        'ff': ff,
        'df': df
    }

    if request.method == 'POST':
        try:
            if nf.is_valid() and cf.is_valid() and ff.is_valid() and df.is_valid():
                n = nf.save(commit=False)
                f = ff.save(commit=False)
                d = df.save()
                c = cf.save()
                f.domicilio = d
                f.save()
                n.contacto = c
                n.fiscal = f
                n.save()

                return redirect('negocios')
            else:
                print(nf.errors)
                print(cf.errors)
                print(ff.errors)
                print(df.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'negocio/crear.html', context)

@login_required
def negocio_update(request, pk):
    negocio = Negocio.objects.get(pk=pk)
    contacto = negocio.contacto
    fiscal = negocio.fiscal
    domicilio = fiscal.domicilio
    nf = NegocioForm(request.POST or None, instance=negocio)
    cf = ContactoForm(request.POST or None, instance=contacto)
    ff = FiscalForm(request.POST or None, instance=fiscal)
    df = DomicilioForm(request.POST or None, instance=domicilio)
    context = {
        'nf': nf,
        'cf': cf,
        'ff': ff,
        'df': df
    }

    if request.method == 'POST':
        try:
            if nf.is_valid() and cf.is_valid() and ff.is_valid() and df.is_valid():
                df.save()
                ff.save()
                cf.save()
                nf.save()

                return redirect('negocios')
            else:
                print(nf.errors)
                print(cf.errors)
                print(ff.errors)
                print(df.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'negocio/editar.html', context)

@login_required
def negocio_destroy(request, pk):
    negocio = Negocio.objects.get(pk=pk)
    contacto = negocio.contacto
    fiscal = negocio.fiscal
    domicilio = fiscal.domicilio

    if request.method == 'POST':
        domicilio.delete()
        fiscal.delete()
        contacto.delete()
        negocio.delete()

        return redirect('negocios')

@login_required
def marca(request):
    marcas = Marca.objects.all()
    context = {'marcas': marcas}
    return render(request, 'marca/list.html', context)

def marca_store(request):
    form = MarcaForm(request.POST or None)
    context = {'form': form}
    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('marcas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'marca/crear.html', context)

@login_required
def marca_update(request, pk):
    marca = Marca.objects.get(pk=pk)
    form = MarcaForm(request.POST or None, instance=marca)
    context = {'form': form}
    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('marcas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'marca/editar.html', context)

@login_required
def marca_destroy(request, pk):
    marca = Marca.objects.get(pk=pk)

    if request.method == 'POST':
        marca.delete()
        return redirect('marcas')

@login_required
def cliente(request):
    clientes = Cliente.objects.all()
    context = {'clientes': clientes}

    return render(request, 'cliente/list.html', context)

@login_required
def cliente_store(request):
    clif = ClienteForm(request.POST or None)
    cf = ContactoForm(request.POST or None)
    ff = FiscalForm(request.POST or None)
    df = DomicilioForm(request.POST or None)
    context = {
        'clif': clif,
        'cf': cf,
        'ff': ff,
        'df': df
    }

    if request.method == 'POST':
        try:
            if clif.is_valid() and cf.is_valid() and ff.is_valid() and df.is_valid():
                cl = clif.save(commit=False)
                f = ff.save(commit=False)
                d = df.save()
                c = cf.save()
                f.domicilio = d
                f.save()
                cl.contacto = c
                cl.fiscal = f
                cl.save()

                return redirect('clientes')
            else:
                print(clif.errors)
                print(cf.errors)
                print(ff.errors)
                print(df.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'cliente/crear.html', context)

@login_required
def cliente_update(request, pk):
    cliente = Cliente.objects.get(pk=pk)
    contacto = cliente.contacto
    fiscal = cliente.fiscal
    domicilio = fiscal.domicilio
    clif = ClienteForm(request.POST or None, instance=cliente)
    cf = ContactoForm(request.POST or None, instance=contacto)
    ff = FiscalForm(request.POST or None, instance=fiscal)
    df = DomicilioForm(request.POST or None, instance=domicilio)
    context = {
        'clif': clif,
        'cf': cf,
        'ff': ff,
        'df': df
    }

    if request.method == 'POST':
        try:
            if clif.is_valid() and cf.is_valid() and ff.is_valid() and df.is_valid():
                df.save()
                ff.save()
                cf.save()
                clif.save()

                return redirect('clientes')
            else:
                print(clif.errors)
                print(cf.errors)
                print(ff.errors)
                print(df.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'cliente/editar.html', context)

@login_required
def cliente_destroy(request, pk):
    cliente = Cliente.objects.get(pk=pk)
    contacto = cliente.contacto
    fiscal = cliente.fiscal
    domicilio = fiscal.domicilio

    if request.method == 'POST':
        domicilio.delete()
        fiscal.delete()
        contacto.delete()
        cliente.delete()

        return redirect('clientes')

@login_required
def caja(request):
    cajas = Caja.objects.all()
    usuario = Usuario.objects.get(user=request.user)
    context = {
        'cajas': cajas,
        'usuario': usuario,
    }

    return render(request, 'caja/list.html', context)

@login_required
def caja_store(request):
    form = CajaForm(request.POST or None)
    context = {'form':form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('cajas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'caja/crear.html', context)

@login_required
def caja_update(request, pk):
    caja = Caja.objects.get(pk=pk)
    form = CajaForm(request.POST or None, instance=caja)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('cajas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'caja/editar.html', context)

@login_required
def caja_destroy(request, pk):
    caja = Caja.objects.get(pk=pk)

    if request.method == 'POST':
        caja.delete()
        return redirect('cajas')

@login_required
def departamento(request):
    departamentos = Departamento.objects.all()
    context = {'departamentos': departamentos}

    return render(request, 'departamento/list.html', context)

@login_required
def departamento_store(request):
    form = DepartamentoForm(request.POST or None)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('departamentos')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'departamento/crear.html', context)

@login_required
def departamento_update(request, pk):
    departamento = Departamento.objects.get(pk=pk)
    form = DepartamentoForm(request.POST or None, instance=departamento)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('departamentos')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'departamento/editar.html', context)

@login_required
def departamento_destroy(request, pk):
    departamento = Departamento.objects.get(pk=pk)

    if request.method == 'POST':
        departamento.delete()

        return redirect('departamentos')

@login_required
def medida(request):
    medidas = Medida.objects.all()
    context = {'medidas': medidas}

    return render(request, 'medida/list.html', context)

@login_required
def medida_store(request):
    form = MedidaForm(request.POST or None)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('medidas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'medida/crear.html', context)

@login_required
def medida_update(request, pk):
    medida = Medida.objects.get(pk=pk)
    form = MedidaForm(request.POST or None, instance=medida)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('medidas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'medida/editar.html', context)

@login_required
def medida_destroy(request, pk):
    medida = Medida.objects.get(pk=pk)

    if request.method == 'POST':
        medida.delete()
        return redirect('medidas')

@login_required
def producto(request):
    productos = Producto.objects.all()
    context = {'productos': productos}

    return render(request, 'producto/list.html', context)

@login_required
def producto_store(request):
    form = ProductoForm(request.POST or None)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('productos')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'producto/crear.html', context)

@login_required
def producto_update(request, pk):
    producto = Producto.objects.get(pk=pk)
    form = ProductoForm(request.POST or None, instance=producto)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                form.save()
                return redirect('productos')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'producto/editar.html', context)

@login_required
def producto_destroy(request, pk):
    producto = Producto.objects.get(pk=pk)

    if request.method == 'POST':
        producto.delete()
        return redirect('productos')

@login_required
def usuario(request):
    usuarios = Usuario.objects.all()
    context = {'usuarios': usuarios}

    return render(request, 'usuario/list.html', context)

@login_required
def usuario_store(request):
    ef = EmpleadoForm(request.POST or None, request.FILES or None)
    uf = UserForm(request.POST or None)
    cf = ContactoForm(request.POST or None)
    context = {
        'ef': ef,
        'uf': uf,
        'cf': cf
    }

    if request.method == 'POST':
        try:
            if ef.is_valid() and uf.is_valid() and cf.is_valid():
                e = ef.save(commit=False)
                u = uf.save()
                c = cf.save()
                e.user = u
                e.contacto = c
                e.save()
                return redirect('usuarios')
            else:
                print(ef.errors)
                print(uf.errors)
                print(cf.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'usuario/crear.html', context)

@login_required
def usuario_update(request, pk):
    usuario = Usuario.objects.get(pk=pk)
    user = usuario.user
    contacto = usuario.contacto
    ef = EmpleadoForm(request.POST or None, request.FILES or None, instance=usuario)
    uf = UserForm(request.POST or None, instance=user)
    cf = ContactoForm(request.POST or None, instance=contacto)
    context = {
        'ef': ef,
        'uf': uf,
        'cf': cf
    }

    if request.method == 'POST':
        try:
            if ef.is_valid() and uf.is_valid() and cf.is_valid():
                ef.save(commit=False)
                uf.save()
                cf.save()
                return redirect('usuarios')
            else:
                print(ef.errors)
                print(uf.errors)
                print(cf.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'usuario/editar.html', context)

@login_required
def usuario_destroy(request, pk):
    usuario = Usuario.objects.get(pk=pk)
    user = usuario.user
    contacto = usuario.contacto

    if request.method == 'POST':
        user.delete()
        contacto.delete()
        usuario.delete()

        return redirect('usuarios')

def singing(request):
    if request.method == 'POST':
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        login(request, user)
        return redirect('home')

    return render(request, 'login.html')

@login_required
def signout(request):
    logout(request)
    return redirect('login')

def singup(request):
    uf = UserForm(request.POST or None)
    rf = RegistroForm(request.POST or None)
    context = {
        'uf': uf,
        'rf': rf
    }

    if request.method == 'POST':
        try:
            if uf.is_valid() and rf.is_valid():
                r = rf.save(commit=False)
                u = uf.save()
                c = Contacto.objects.create()
                r.user = u
                r.contacto = c
                r.rol = 2
                r.save()
                login(request, u)
                return redirect('home')
            else:
                print(uf.errors)
                print(rf.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'register.html', context)

@login_required
def perfil(request):
    usuario = Usuario.objects.get(user=request.user)
    user = usuario.user
    contacto = usuario.contacto
    ef = PerfilForm(request.POST or None, request.FILES or None, instance=usuario)
    uf = UserForm(request.POST or None, instance=user)
    cf = ContactoForm(request.POST or None, instance=contacto)
    context = {
        'ef': ef,
        'uf': uf,
        'cf': cf
    }

    if request.method == 'POST':
        try:
            if ef.is_valid() and uf.is_valid() and cf.is_valid():
                ef.save(commit=False)
                uf.save()
                cf.save()
                return redirect('usuarios')
            else:
                print(ef.errors)
                print(uf.errors)
                print(cf.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'perfil.html', context)

@login_required
def caja_open(request, pk):
    caja = Caja.objects.get(pk=pk)
    usuario = Usuario.objects.get(user=request.user)
    form = AbrirCajaForm(request.POST or None)
    context = {'form': form}
    request.session['caja_abierta'] = 0

    if request.method == 'POST':
        try:
            if form.is_valid():
                f = form.save(commit=False)
                f.caja = caja
                f.movimento = 'A'
                f.empleado = usuario
                f.fecha = datetime.now()
                request.session['caja_abierta'] = caja.id
                f.save()
                return redirect('cajas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'caja/abrir.html', context)

@login_required
def caja_close(request):
    caja = Caja.objects.get(pk=request.session['caja_abierta'])
    caja_abierta = MCaja.objects.get(caja=caja, movimento='A')
    empleado = Usuario.objects.get(user=request.user)
    form = CerrarCajaForm(request.POST or None)
    context = {'form': form}

    if request.method == 'POST':
        try:
            if form.is_valid():
                f = form.save(commit=False)
                f.caja = caja
                f.empleado = empleado
                f.fecha = datetime.now()
                f.movimento = 'C'
                f.ma= caja_abierta.ma
                f.ganacia = f.mc - f.ma
                request.session['caja_abierta'] = 0
                f.save()
                return redirect('cajas')
            else:
                print(form.errors)
        except Exception as e:
            print(f'error: {e}')

    return render(request, 'caja/cerrar.html', context)

def venta(request):
    ventas = Venta.objects.all()
    context = {'ventas': ventas}

    return render(request, 'venta/list.html', context)

def venta_store(request):
    return render(request, 'venta/crear.html')

def autocomplete_producto(request):
    if 'term' in request.GET:
        qs = Producto.objects.filter(nombre__icontains=request.GET.get("term"))
        titles = list()
        for producto in qs:
            datos = {
                'id': producto.id,
                'label': producto.nombre,
                'precio': producto.precio,
                'existencia': producto.existencia
            }
            titles.append(datos)
        return JsonResponse(titles, safe=False)

def autocomplete_cliente(request):
    if 'term' in request.GET:
        qs = Cliente.objects.filter(nombres__icontains=request.GET.get("ter"))
        titles = list()
        for cliente in qs:
            datos = {
            'id': cliente.id,
            'label': cliente.nombres
            }
            titles.append(datos)
        return JsonResponse(titles, safe=False)