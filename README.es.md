# AutoConfirm4D

[English](README.md) | [Bahasa Indonesia](README.id.md) | [Español](README.es.md)

Módulo de KernelSU / Magisk que desbloquea la pantalla de bloqueo de Samsung en cuanto
se introduce el 4.º dígito del PIN, sin pulsar OK.

No modifica SystemUI ni toca el almacén de credenciales. Solo establece un valor en la
base de datos del sistema, `Settings.Secure n_digits_pin_enabled = 4`, que es la opción
"PIN de N dígitos" de Samsung. El sistema sigue verificando el PIN por la misma vía que
el botón OK.

## Requisitos

| Elemento | Requisito |
|---|---|
| Dispositivo | Samsung Galaxy con One UI (ver compatibilidad) |
| Root | KernelSU o Magisk (app gestora que pueda instalar módulos) |
| LSPosed | **No es necesario.** Este módulo no usa hooks |
| Bloqueo de pantalla | PIN de **exactamente 4 dígitos** |
| Respaldo | Huella digital registrada y funcionando (muy recomendado) |

## Compatibilidad

| Dispositivo | One UI | Build | Estado |
|---|---|---|---|
| Galaxy A36 (SM-A366B) | 9.0 | CP2A.260605.016.A366BXXUCDZIF | Probado, funciona |
| Otros Galaxy | 6.x - 9.x | - | Sin probar |

| Solución root | Estado |
|---|---|
| KernelSU | Ruta de script de arranque usada en el dispositivo de prueba |
| Magisk | Sin probar |
| Botón Action | Requiere un gestor compatible con `action.sh`. Si falta, usa los comandos de Termux de abajo |

Solo la fila "Probado" está verificada. En otros dispositivos el ajuste puede no existir,
ignorarse o sobrescribirse. Compruébalo con `settings get secure n_digits_pin_enabled`.

## Instalación

1. Asegúrate de que tu PIN tenga exactamente 4 dígitos y de que la huella funcione.
2. Abre tu gestor de root, ve a Módulos, elige Instalar desde almacenamiento y selecciona el zip.
3. Reinicia.
4. Bloquea el teléfono e introduce el PIN. Debe desbloquear tras el 4.º dígito.

## Desactivar

- Pulsa el botón **Action** del módulo en el gestor (alterna ON/OFF), o
- Elimina el módulo (se restaura el valor original), o
- Desde Termux:

```
su -c "settings put secure n_digits_pin_enabled 0"
```

Desactivar el módulo en el gestor no restablece el ajuste. Usa antes Action o el comando.

## Antes de cambiar el PIN

Desactiva el módulo, cambia el PIN y vuelve a activarlo solo si el nuevo PIN tiene 4 dígitos.

## Si te quedas bloqueado

Con la opción activa, la entrada se detiene en 4 dígitos. Un PIN de otra longitud no se
puede escribir. Desbloquea con la huella y ejecuta el comando de "Desactivar". Sin huella,
arranca en Modo Seguro; el ajuste se guarda en la base de datos de Settings, así que el
restablecimiento de fábrica es el último recurso.

## Limitaciones

- Cada entrada errónea de 4 dígitos cuenta como intento fallido, incluido el bloqueo temporal de Samsung.
- El comportamiento tras una actualización de firmware no está garantizado. Vuelve a probar tras cada una.
- Sin verificar: si Samsung Settings reescribe el valor al cambiar el tipo de bloqueo.
- No es una omisión de seguridad. Un PIN de 4 dígitos es más débil que uno más largo, con o sin este módulo.

## Licencia

MIT
