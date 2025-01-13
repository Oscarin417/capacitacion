"""punto_venta URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include
from django.conf import settings
from django.conf.urls.static import static
from venta import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.singing, name='login'),
    path('dashboard/', views.home, name='home'),
    path('negocios/', views.negocio, name='negocios'),
    path('negocios/crear/', views.negocio_store, name='negocio_crear'),
    re_path(r'negocios/editar/(?P<pk>\d+)/$', views.negocio_update, name='negocio_editar'),
    re_path(r'negocios/eliminar/(?P<pk>\d+)/$', views.negocio_destroy, name='negocio_eliminar'),
    path('marcas/', views.marca, name='marcas'),
    path('marcas/crear/', views.marca_store, name='marca_crear'),
    re_path(r'marcas/editar/(?P<pk>\d+)/$', views.marca_update, name='marca_editar'),
    re_path(r'marcas/eliminar/(?P<pk>\d+)/$', views.marca_destroy, name='marca_eliminar'),
    path('clientes/', views.cliente, name='clientes'),
    path('clientes/crear/', views.cliente_store, name='cliente_crear'),
    re_path(r'clientes/editar/(?P<pk>\d+)/$', views.cliente_update, name='cliente_editar'),
    re_path(r'clientes/eliminar/(?P<pk>\d+)/$', views.cliente_destroy, name='cliente_eliminar'),
    path('cajas/', views.caja, name='cajas'),
    path('cajas/crear/', views.caja_store, name='caja_crear'),
    re_path(r'cajas/editar/(?P<pk>\d+)/$', views.caja_update, name='caja_editar'),
    re_path(r'cajas/eliminar/(?P<pk>\d+)/$', views.caja_destroy, name='caja_eliminar'),
    re_path(r'cajas/abrir/(?P<pk>\d+)/$', views.caja_open, name='caja_abrir'),
    # re_path(r'cajas/cerrar/(?P<pk>\d+)/$', views.caja_close, name='caja_cerrar'),
    path('cajas/cerrar/', views.caja_close, name='caja_cerrar'),
    path('departamentos/', views.departamento, name='departamentos'),
    path('departamentos/crear/', views.departamento_store, name='departamento_crear'),
    re_path(r'departamentos/editar/(?P<pk>\d+)/$', views.departamento_update, name='departamento_editar'),
    re_path(r'departamentos/eliminar/(?P<pk>\d+)/$', views.departamento_destroy, name='departamento_eliminar'),
    path('medidas/', views.medida, name='medidas'),
    path('medidas/crear/', views.medida_store, name='medida_crear'),
    re_path(r'medidas/editar/(?P<pk>\d+)/$', views.medida_update, name='medida_editar'),
    re_path(r'medidas/eliminar/(?P<pk>\d+)/$', views.medida_destroy, name='medida_eliminar'),
    path('productos/', views.producto, name='productos'),
    path('productos/crear/', views.producto_store, name='producto_crear'),
    re_path(r'productos/editar/(?P<pk>\d+)/$', views.producto_update, name='producto_editar'),
    re_path(r'productos/eliminar/(?P<pk>\d+)/$', views.producto_destroy, name='producto_eliminar'),
    path('usuarios/', views.usuario, name='usuarios'),
    re_path(r'usuarios/editar/(?P<pk>\d+)/$', views.usuario_update, name='usuario_editar'),
    re_path(r'usuarios/eliminar/(?P<pk>\d+)/$', views.usuario_destroy, name='usuario_eliminar'),
    path('usuarios/crear/', views.usuario_store, name='usuario_crear'),
    path('register/', views.singup, name='register'),
    path('logout', views.signout, name='logout'),
    path('mi_perfil/', views.perfil, name='perfil'),
    path('ventas/', views.venta, name='ventas'),
    path('ventas/crear/', views.venta_store, name='venta_crear'),
    path('autocomplete_producto/', views.autocomplete_producto, name='autocomplete_producto'),
    path('autocomplete_cliente/', views.autocomplete_cliente, name='autocomplete_cliente'),
    # path('accounts/', include('django_registration.backends.activation.urls')),
    # path('accounts/', include('django.contrib.auth.urls')),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
