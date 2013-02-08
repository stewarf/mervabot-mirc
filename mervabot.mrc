;------------------------------------------------------
;          *** MeRVa-BoT, versión 1.3 ***
;    Por stewarf (stewarf@cancunchat.com)
;                (stewarf@msn.com)
;------------------------------------------------------
menu channel,query,menubar,status,@MeRVa-BoT {
  -
  MeRVa-BoT v1.3
  .Bot de Mensajes de Usuarios
  ..Estado Actual
  ...Encendido $iif(%mensajeria.mrv == on,Ø,):set %mensajeria.mrv on | .msg $me 5,0Bot de Mensajes de Usuarios ha sido 4activado5.
  ...Apagado $iif(%mensajeria.mrv == off,Ø,):set %mensajeria.mrv off | .msg $me 5,0Bot de Mensajes de Usuarios ha sido 4desactivado5.
  ..-
  ..Buscar Mensaje:if (%mensajeria.mrv == on) { set %nickname.mrv $$?="Ingrese un nick para buscar su mensaje:" | busca %nickname.mrv } | if (%mensajeria.mrv == off) { uncomando | halt }
  ..Escribir Mensaje:if (%mensajeria.mrv == on) { set %nickname.mrv $$?="Ingrese un nick:" | set %psmensaje.mrv $$?="Ingrese su mensaje para grabarlo:" | escribe %nickname.mrv %psmensaje.mrv } | if (%mensajeria.mrv == off) { uncomando | halt }
  ..Eliminar Mensaje:if (%mensajeria.mrv == on) { set %nickname.mrv $$?="Ingrese un nick para borrar su mensaje:" | borra %nickname.mrv } | if (%mensajeria.mrv == off) { uncomando | halt }
  .Servicio de Mensajes de Bienvenida
  ..Estado Actual
  ...Encendido $iif(%greet.mrv == on,Ø,):set %greet.mrv on | .msg $me 5,0Servicio de Mensajes de Bienvenidas ha sido 4activado5.
  ...Apagado $iif(%greet.mrv == off,Ø,):set %greet.mrv off | .msg $me 5,0Servicio de Mensajes de Bienvenidas ha sido 4desactivado5.
  .Servicio de Contador Del Canal 
  ..Estado Actual
  ...Encendido $iif(%counter.mrv == on,Ø,):set %counter.mrv on | .msg $me 5,0Servicio de Contador del Canal ha sido 4activado5.
  ...Apagado $iif(%counter.mrv == off,Ø,):set %counter.mrv off | .msg $me 5,0Servicio de Contador del Canal ha sido 4desactivado5.
  ..Limpieza del Contador
  ...Canal?:if (%counter.mrv == on) { set %counterchan.mrv $$?="Ingrese un canal para limpiar el registro del contador (con #):" | /remini -n mrv\countermrv.ini %counterchan.mrv | .msg $me 5,0Registro de Contador del Canal  $+ %counterchan.mrv $+  ha sido 4limpiado5. } | else { halt }
  .-
  .Ayuda Add-On
  ..Manual de Utilización:tutorial
  .Acerca de...:dialog -m aboutmrv aboutmrv
}
menu nicklist {
.buscar foto: run http://www.genteirc.com/busquedas/busca.php?tipobusqueda=nick&nick= $+ $1
}
;========= LOS DIALOGOS, LAS VENTANAS Y SUS EVENTOS DEL ADD-ON =========
;Ventana de Dialogo "Acerca de MeRVa-BoT"
dialog aboutmrv {
  title "Acerca de MeRVa-BoT"
  size -1 -1 320 200
  box "Información general del Add-On",1, 10 10 300 150
  text "¤§ø§¤  MeRVa-BoT v1.3 para mIRC  ¤§ø§¤", 2, 20 30 280 25 ,center
  text "==============================================", 3, 20 45 280 25 ,left
  text "Este pequeño Add-On fue diseñado para tener la interacción con los usuarios en su canal favorito.", 4, 20 60 270 25 ,left
  text "¡Disfrutelo tanto como yo lo he disfrutado diseñarlo!", 5, 20 105 270 25 ,center
  text "Para actualizaciones del Add-On:", 6, 20 135 170 25 ,right
  button "&Visitar Sitio", 7, 200 130 75 22, center
  button "&Aceptar", 8, 110 165 90 25, ok
}
on *:dialog:aboutmrv:sclick:*:{
  if ($did == 7) { run "http://www.iespana.es/sharak/index.htm" } | if ($did == 8) { dialog -k aboutmrv } 
}
;Ventana de Texto del Manual de Utilización.
alias tutorial { 
  window -ablkx0 @MeRVa-BoT -1 -1
  .aline @MeRVa-BoT §ø§ MeRVa-BoT, Versión 1.3 §ø§ 
  .aline @MeRVa-BoT Por stewarf 
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT * Manual de Utilización para Administradores y Masters del Canal. *
  .aline @MeRVa-BoT ====================================================================
  .aline @MeRVa-BoT En este manual describirémos la utilización del Add-On, sus comandos para usuarios
  .aline @MeRVa-BoT finales y sus funciones para la interacción con los usuarios de su canal favorito.
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT Ahora el Add-On está en ejecución, a la espera de órdenes por medio de menúes
  .aline @MeRVa-BoT contextuales o también por medio de comandos textuales, pero esta forma de dar órdenes
  .aline @MeRVa-BoT se hace en otro cliente IRC, haciendo más flexible en el manejo del Add-On.
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT Es facil manejar el Add-On desde los menúes. Este manual está enfocado para explicar 
  .aline @MeRVa-BoT con más detalle la utilización de los comandos textuales en otro cliente IRC.
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT * Comandos Textuales para su utilización en otro cliente IRC *
  .aline @MeRVa-BoT ====================================================================
  .aline @MeRVa-BoT !mensajeria <on/off>
  .aline @MeRVa-BoT Este comando activa o desactiva el Bot de Mensajes de Usuarios. Su función principal
  .aline @MeRVa-BoT de este Bot es habilitar las funciones de escribir mensajes, hacer una busqueda
  .aline @MeRVa-BoT de los mensajes previamente guardados o borrarlos de los registros del Bot.
  .aline @MeRVa-BoT (Solo los Masters y el Administrador pueden usar este comando).
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !escribe <usuario> <mensaje>
  .aline @MeRVa-BoT Este comando realiza la función de grabar mensajes de un usuario especificado.
  .aline @MeRVa-BoT (Comando accesible para todos)
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !busca <usuario>
  .aline @MeRVa-BoT Este comando realiza la busqueda de un mensaje guardado previamente dentro de un usuario.
  .aline @MeRVa-BoT (Comando accesible para todos)
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !borra <usuario>
  .aline @MeRVa-BoT Este comando realiza la eliminación de un mensaje previamente guardado por un usuario.
  .aline @MeRVa-BoT (Comando accesible para todos)
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !bienvenida <on/off>
  .aline @MeRVa-BoT Este comando activa o desactiva el Servicio de Bienvenidas de Usuarios. Su función
  .aline @MeRVa-BoT principal es que si un usuario ha escrito un mensaje con su propio nick, al momento
  .aline @MeRVa-BoT de que el usuario ingrese de nuevo al canal, el Servicio mostrará el mensaje guardado
  .aline @MeRVa-BoT por el usuario, dando un recibimiento por parte del Bot.
  .aline @MeRVa-BoT (Solo los Masters y el Administrador pueden usar este comando)
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !contadorcanal <on/off>
  .aline @MeRVa-BoT Este comando activa o desactiva el Servicio de Contador del Canal. Su función es la
  .aline @MeRVa-BoT de registrar las entradas que realiza cada usuario cuando accesa al canal.
  .aline @MeRVa-BoT (Solo los Masters y el Administrador pueden usar este comando)
  .aline @MeRVa-BoT -
  .aline @MeRVa-BoT !contadorcanal limpiar
  .aline @MeRVa-BoT Este comando realiza la limpieza del Contador en el canal activo, eliminando los
  .aline @MeRVa-BoT registros de visitas en el canal para reanudar el contador del canal.
  .aline @MeRVa-BoT (Solo los Masters y el Administrador pueden usar este comando)
  .aline @MeRVa-BoT -
}
;========== LOS ALIAS DEL ADD-ON =============
alias busca {
  if (%nickname.mrv == $readini mrv\psmrv.ini %nickname.mrv nick) { .msg $me 3,0 $+ %nickname.mrv - $readini mrv\psmrv.ini %nickname.mrv char | halt }
  else { .msg $me 3,0 $+ %nickname.mrv no tiene escrito su mensaje. | halt }
}
alias escribe {
  if (is !isin %psmensaje.mrv) { /writeini -n mrv\psmrv.ini %nickname.mrv nick %nickname.mrv | /writeini -n mrv\psmrv.ini %nickname.mrv char %psmensaje.mrv | .msg $me 5,0Mensaje grabado para 12 $+ %nickname.mrv $+ . | halt }
  else { .msg $me 5,0Mensaje no grabado. Intentelo Más Tarde. | halt }
}
alias borra { /remini -n mrv\psmrv.ini %nickname.mrv | .msg $chan 3,0 $+ %nickname.mrv ha sido borrado satisfactoriamente. }
alias uncomando { .msg $me 3,0Este comando está desabilitado. Compruebe que sus servicios esten activos o que inicio sesión correctamente. }
;
;========== LOS EVENTOS DEL ADD-ON =============
;Procesos Previos a la utilización del Add-On
on *:LOAD: { mkdir mrv | set %countnum.mrv 0 | set %mensajeria.mrv off | set %greet.mrv off | set %counter.mrv off }
on 1:text:*mensajeria*:#:{
  if ($1 == ! $+ mensajeria) { 
    if ($2 == on) { set %mensajeria.mrv on | .enable #mensajeria | .msg $chan 5,0El Bot de Mensajes de Usuarios ha sido activado. | .msg $chan 5,0Para Escribir un Mensaje de Usuario usa este comando: 7!escribe <usuario> <mensaje>5. Para Realizar una Busqueda de Mensaje usar: 7!busca <usuario>5. Para Borrar Mensajes de un Usuario usar: 7!borra <usuario>5. | .msg $chan 5,0Para Apagar el Bot de Mensajes de Usuarios usar: 7!mensajeria off5. | .msg $me 5,0Bot de Mensajes de Usuarios 4activado5 por 12 $+ $nick $+ . | halt }
    if ($2 == off) { set %mensajeria.mrv off | .disable #mensajeria | .msg $chan 5,0El Bot de Mensajes de Usuarios ha sido desactivado. | .msg $me 5,0Bot de Mensajes de Usuarios 4desactivado5 por 12 $+ $nick $+ . | halt }
  }
  else { halt }
}
on 1:text:*busca*:#: {
  if (%mensajeria.mrv == on) {
    if ($1 == ! $+ busca) { 
      if ($2 == $readini mrv\psmrv.ini $2 nick) { .msg $chan 3,0 $+ $2 - $readini mrv\psmrv.ini $2 char | halt }
      else { .msg $chan 3,0 $+ $2 no tiene escrito su mensaje. | halt }
    }
    else { halt }
  }
  else { halt }
}
on 1:text:*escribe*:#: {
  if (%mensajeria.mrv == on) {
    if ($1 == ! $+ escribe) { 
      if (is isin $3) { /writeini -n mrv\psmrv.ini $2 nick $2 | /writeini -n mrv\psmrv.ini $2 char $4- | .msg $chan 3,0 $+ $2 - $4- | .msg $me 5,0Mensaje grabado por 12 $+ $nick $+ . | halt }
      else { /writeini -n mrv\psmrv.ini $2 nick $2 | /writeini -n mrv\psmrv.ini $2 char $3- | .msg $chan 3,0 $+ $2 - $3- | .msg $me 5,0Mensaje grabado por 12 $+ $nick $+ . | halt }
    }
    else { halt }
  }
  else { halt }
}
on 1:text:*borra*:#: {
  if (%mensajeria.mrv == on) {
    if ($1 == ! $+ borra) { /remini -n mrv\psmrv.ini $2 | .msg $chan 3,0 $+ $2 ha sido borrado satisfactoriamente. | .msg $me 5,0Mensaje de 12 $+ $2 $+  borrado por 12 $+ $nick $+ . }
    else { halt }
  }
  else { halt }
}
;Servicio de Mensajerias de Bienvenidas
on 1:text:*bienvenida*:#:{
  if ($1 == ! $+ bienvenida) { 
    if ($2 == on) { set %greet.mrv on | .enable #bienvenida | .msg $chan 5,0El Servicio de Mensajes de Bienvenidas ha sido activado. Si desea agregar mensajes de bienvenidas en un canal primero active el comando mensajeria escribiendo: 7 $+ ! $+ mensajeria on. | .msg $chan 5,0Si esta activado el Bot, solo siga las instrucciones del comando. | .msg $me 5,0Servicio de Mensajes de Bienvenidas 4activado5 por 12 $+ $nick $+ . | halt }
    if ($2 == off) { set %greet.mrv off | .disable #bienvenida | .msg $chan 5,0El Servicio de Mensajes de Bienvenidas ha sido desactivado. | .msg $me 5,0Servicio de Mensajes de Bienvenidas 4activado5 por 12 $+ $nick $+ . | halt }
  }
  else { halt }
}
;Servicio de Contadores para el Canal
on 1:text:*contadorcanal*:#:{
  if ($1 == ! $+ contadorcanal) { 
    if ($2 == on) { set %counter.mrv on | .enable #contadorcanal | .msg $chan 5,0El Servicio de Contadores para el Canal $chan $+  ha sido activado. | .msg $me 5,0Servicio de Contador para el Canal $chan 4activado5 por 12 $+ $nick $+ . | halt }
    if ($2 == off) { set %counter.mrv off | .disable #contadorcanal | .msg $chan 5,0El Servicio de Contadores para el Canal $chan $+  ha sido desactivado. | .msg $me 5,0Servicio de Contador para el Canal $chan 4desactivado5 por 12 $+ $nick $+ . | halt }
    if ($2 == limpiar) { /remini -n mrv\countermrv.ini $chan | .msg $chan 3,0El Registro del Contador del Canal  $+ $chan $+  ha sido limpiado. | .msg $me 5,0Registro de Contador del Canal  $+ $chan $+  ha sido 4limpiado5 por 12 $+ $nick $+ . | halt }
  }
  else { halt }
}
on 1:JOIN:#: {
  if (%greet.mrv == on) { 
    if ($nick == $readini mrv\psmrv.ini $nick nick) { .msg $chan 7,1:0,12  $+ $nick $+  7,1:8,1  $+ $readini mrv\psmrv.ini $nick char $+  7: }
    else { }
  }
  if (%greet.mrv == off) { }
  if (%counter.mrv == on) { 
    if ($chan == $readini mrv\countermrv.ini $chan canal) { set %cnum.mrv $readini mrv\countermrv.ini $chan numero | inc %cnum.mrv | /writeini -n mrv\countermrv.ini $chan numero %cnum.mrv | .msg $chan 12,0 Hola 4 $+ $nick $+  5,0 Eres el visitante No. 1:0,1  $+ $readini mrv\countermrv.ini $chan numero $+  1,0:5,0 en el canal  $+ $chan $+ . }
    else { /writeini -n mrv\countermrv.ini $chan canal $chan | set %countnumchan.mrv 0 | /writeini -n mrv\countermrv.ini $chan numero %countnumchan.mrv | .msg $chan 3,0Este Mensaje es la comprobacion de que el Servicio de Contador para el canal  $+ $chan $+  ha sido activado. Desde ahora ya se tiene registrado el canal  $+ $chan $+  en la base de datos de los Contadores. | .msg $me 3,0Este Mensaje es la comprobacion de que el Servicio de Contador para el canal  $+ $chan $+  ha sido activado. Desde ahora ya se tiene registrado el canal  $+ $chan $+  en la base de datos de los Contadores. }
  }
  if (%counter.mrv == off) { }
  else { halt }
}
;Propiedades del Add-On para IRcap y otros SCRiPTs
[ADDON]
nombre=MeRVa-BoT
autor=stewarf
ver=1.3
web=http://www.iespana.es/sharak
desc=Pequeño Add-On con Bots, Servicios y Juegos para Operadores.
