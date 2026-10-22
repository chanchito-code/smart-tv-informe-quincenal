# Smart TV · Informe Quincenal SIRIS

Dashboard para **Smart TV** orientado a la visualización y seguimiento del **Informe Quincenal** del Sistema de Información de Reportes Quincenales (SIRIS). La interfaz está diseñada para pantallas de 1920 × 1080 y adapta tipografía, espaciados y componentes a distintas resoluciones.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.12-0175C2?logo=dart&logoColor=white)
![Smart TV](https://img.shields.io/badge/Platform-Smart%20TV-1A202C)
![License](https://img.shields.io/badge/License-MIT-green)

> Prototipo de interfaz con datos de ejemplo. La capa de servicio HTTP ya está preparada, pero las vistas aún no consumen el backend.

---

## Español

### Descripción

Aplicación Flutter que digitaliza la consulta del Informe Quincenal de entes públicos: periodos informados, cumplimiento, entes omisos, servidores públicos sancionados y visualización de acuses. Está pensada para mostrarse en una Smart TV o Android TV y facilitar la lectura de indicadores a distancia.

### Características

- **Paneles por rol**: `Administrador` y `Enlace`, con menús y vistas diferenciadas.
- **Panel informativo**: periodo vigente, métricas de entes proveedores, reportes a tiempo, omisos y gráfico de cumplimiento.
- **Informe quincenal**: selector de periodo, tarjetas de cumplimiento, tabla de entes públicos y acceso al detalle.
- **Entes públicos**: filtros por año y mes, selección de ente proveedor, indicadores y navegación a acuses.
- **Sancionados**: filtros por tipo de sancionado, periodo y ente proveedor, con tabla de resultados.
- **Acuses**: vistas de detalle por ente y por servidor público.
- **Diseño para TV**: escalado responsivo con `flutter_screenutil` sobre un lienzo de 1920 × 1080.
- **Servicio HTTP base** para acuses y servidores públicos, con URL configurable por entorno.

### Stack

| Tecnología | Uso |
| --- | --- |
| Flutter | Framework de interfaz multiplataforma |
| Dart 3.12 | Lenguaje de programación |
| `flutter_screenutil` | Adaptación de medidas y tipografía a la pantalla |
| `http` | Consumo de servicios REST |
| Material Design | Componentes y sistema visual |

### Estructura del proyecto

```
lib/
├── config/                  # Configuración de roles
├── models/                  # Modelos de datos (menús, etc.)
├── presentation/
│   ├── layouts/             # Layout principal (sidebar + navbar + contenido)
│   ├── screens/
│   │   ├── informe_Quincenal/
│   │   │   └── pdf/         # Vistas de acuses
│   │   ├── panel_Informativo/
│   │   └── sancionados/
│   └── widgets/             # Sidebar y navbar reutilizables
├── services/                # Servicio HTTP
└── main.dart                # Punto de entrada
```

### Requisitos

- Flutter 3.x (canal stable)
- Dart 3.12 o superior
- Android Studio / VS Code con el SDK de Flutter
- Opcional: un emulador o dispositivo Android TV / Smart TV

### Instalación y ejecución

```bash
git clone https://github.com/chanchito-code/smart-tv-informe-quincenal.git
cd smart-tv-informe-quincenal
flutter pub get
flutter run
```

Para elegir el dispositivo:

```bash
flutter devices
flutter run -d windows
flutter run -d chrome
```

> El rol que se muestra al iniciar se configura en `lib/main.dart` mediante `UserType.admin` o `UserType.enlace`.

### Configuración del API

La URL del backend se define en tiempo de compilación con `--dart-define`:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.1.50:8000/api
```

Valor por defecto (emulador Android local):

```
http://10.0.2.2:8000/api
```

Endpoints esperados por `ApiService`:

| Método | Endpoint | Respuesta |
| --- | --- | --- |
| `GET` | `/acuses` | Lista JSON de acuses |
| `GET` | `/servidores-publicos` | Lista JSON de servidores públicos sancionados |

Si la app se ejecuta en un dispositivo físico, la Smart TV y el equipo del backend deben estar en la misma red. Para Android, verifica que el tráfico HTTP sin TLS esté permitido o utiliza HTTPS.

### Pruebas y análisis

```bash
flutter test
flutter analyze
```

### Estado del proyecto

- [x] Layout principal con sidebar, navbar y navegación por roles.
- [x] Vistas de panel informativo, informe quincenal, entes públicos y sancionados.
- [x] Vistas de acuse y navegación entre pantallas.
- [x] Servicio HTTP base con URL configurable.
- [ ] Conectar las vistas con el backend real.
- [ ] Autenticación y permisos por rol.
- [ ] Ampliar la cobertura de pruebas.
- [ ] Generar build de producción para Android TV.

### Autor

**Chanchito-code**  
GitHub: [@chanchito-code](https://github.com/chanchito-code)

### Licencia

Este proyecto se distribuye bajo la licencia **MIT**. Consulta [LICENSE](LICENSE) para más información.

---

## English

### Overview

Flutter dashboard for **Smart TVs** focused on the SIRIS biweekly report (Informe Quincenal). The UI targets 1920 × 1080 screens and scales typography, spacing and components across resolutions.

> UI prototype with sample data. The HTTP service layer is ready, but the screens do not consume the backend yet.

### Features

- Role-based panels for **Admin** and **Liaison** users.
- Informative dashboard with period, compliance metrics and charts.
- Biweekly report with period selector, metrics and public entity table.
- Entity filters by year/month plus receipt (acuse) navigation.
- Sanctioned public servants report with search filters.
- Receipt detail views.
- TV-first responsive layout powered by `flutter_screenutil`.

### Tech stack

Flutter · Dart 3.12 · `flutter_screenutil` · `http` · Material Design

### Getting started

```bash
git clone https://github.com/chanchito-code/smart-tv-informe-quincenal.git
cd smart-tv-informe-quincenal
flutter pub get
flutter run
```

Configure the API URL:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.1.50:8000/api
```

Default value: `http://10.0.2.2:8000/api` (Android emulator).

### Quality checks

```bash
flutter test
flutter analyze
```

### Status

- [x] Main layout, role-based navigation and screens.
- [x] Receipt views and screen navigation.
- [x] Configurable HTTP service layer.
- [ ] Backend integration.
- [ ] Authentication and role permissions.
- [ ] Expanded test coverage.
- [ ] Android TV production build.

### License

Distributed under the **MIT** License. See [LICENSE](LICENSE).
