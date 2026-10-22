import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tv1/presentation/screens/panel_Informativo/panel_informativo_view.dart';
import '../../config/user_types.dart';
import '../../models/menu_item_model.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/navbar_widget.dart';
// ignore: duplicate_import
import '../screens/panel_Informativo/panel_informativo_view.dart';
// ignore: unused_import, duplicate_import
import '../screens/sancionados/sancionados_view.dart';
// ignore: unused_import, duplicate_import
import '../screens/informe_Quincenal/entes_publicos_view.dart';
// ignore: unused_import, duplicate_import
import '../screens/informe_Quincenal/periodo_informado_view.dart';

class MainLayout extends StatefulWidget {
  final UserType userType;

  const MainLayout({super.key, required this.userType});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  String _currentSectionTitle = 'Panel Informativo';

  @override
  void initState() {
    super.initState();
    _currentSectionTitle = widget.userType == UserType.admin
        ? 'Panel Informativo'
        : 'Mis Tareas';
  }

  // Listas de menús configuradas para Administrador
  final List<MenuItemModel> _adminMenu = const [
    MenuItemModel(title: 'Panel Informativo', icon: Icons.dashboard),
    MenuItemModel(
      title: 'Informe Quincenal',
      icon: Icons.article,
      subMenu: [
        MenuItemModel(
          title: 'Periodo Informado',
          icon: Icons.add_circle_outline,
        ),
        MenuItemModel(title: 'Entes publicos', icon: Icons.history),
      ],
    ),
    MenuItemModel(
      title: 'Sancionados',
      icon: Icons.gavel,
      subMenu: [
        MenuItemModel(title: 'Reportes', icon: Icons.format_list_bulleted),
      ],
    ),
  ];

  // Listas de menús configuradas para Enlace
  final List<MenuItemModel> _enlaceMenu = const [
    MenuItemModel(title: 'Mis Tareas', icon: Icons.assignment_turned_in),
    MenuItemModel(title: 'Cargar Evidencias', icon: Icons.cloud_upload),
    MenuItemModel(title: 'Notificaciones', icon: Icons.notifications),
  ];

  /// Método para retornar la vista (pantalla) correspondiente al título seleccionado
  Widget _getBodyContent() {
    switch (_currentSectionTitle) {
      // --- Vistas de Administrador ---
      case 'Panel Informativo':
        return const PanelInformativoView();
      case 'Periodo Informado':
        return const PeriodoInformadoView();
      case 'Entes publicos':
        return const EntesPublicosView();
      case 'Reportes':
        return const SancionadosView();

      // --- Vistas de Enlace ---
      case 'Mis Tareas':
        return Center(
          child: Text(
            '✅ Lista de tareas asignadas al enlace',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        );
      case 'Cargar Evidencias':
        return Center(
          child: Text(
            '📤 Zona para subir archivos y evidencias',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        );
      case 'Notificaciones':
        return Center(
          child: Text(
            '🔔 Bandeja de alertas del sistema',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        );

      default:
        return Center(
          child: Text(
            'Sección: $_currentSectionTitle',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escogemos la lista correcta según el rol recibido
    final currentMenu = widget.userType == UserType.admin
        ? _adminMenu
        : _enlaceMenu;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Row(
        children: [
          // Widget de Sidebar
          SidebarWidget(
            userType: widget.userType,
            currentSectionTitle: _currentSectionTitle,
            menuItems: currentMenu,
            onOptionSelected: (title) {
              setState(() {
                _currentSectionTitle = title;
              });
            },
          ),

          // Contenido derecho
          Expanded(
            child: Column(
              children: [
                // Widget de Navbar
                NavbarWidget(
                  title: _currentSectionTitle,
                  userType: widget.userType,
                ),

                // Espacio dinámico para renderizar las pantallas reales
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(40.w),
                    child:
                        _getBodyContent(), // <-- Llamamos a la función constructora de contenido
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
