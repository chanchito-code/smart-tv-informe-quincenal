import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smart_tv1/config/user_types.dart';
import 'package:smart_tv1/models/menu_item_model.dart';
import 'package:smart_tv1/presentation/layouts/main_layout.dart';
import 'package:smart_tv1/presentation/widgets/sidebar_widget.dart';

Widget _buildTestApp(Widget home) {
  return ScreenUtilInit(
    designSize: const Size(1920, 1080),
    minTextAdapt: true,
    builder: (context, child) =>
        MaterialApp(debugShowCheckedModeBanner: false, home: home),
  );
}

void _configureTvSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(1920, 1080);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('El panel de enlace monta la navegación principal', (
    tester,
  ) async {
    _configureTvSurface(tester);

    await tester.pumpWidget(
      _buildTestApp(const MainLayout(userType: UserType.enlace)),
    );
    await tester.pumpAndSettle();

    expect(find.text('PANEL ENLACE'), findsOneWidget);
    expect(find.text('Mis Tareas'), findsWidgets);
    expect(find.text('Cargar Evidencias'), findsOneWidget);
  });

  testWidgets('El sidebar de administrador despliega submenús', (tester) async {
    _configureTvSurface(tester);

    await tester.pumpWidget(
      _buildTestApp(
        Scaffold(
          body: SidebarWidget(
            userType: UserType.admin,
            currentSectionTitle: 'Panel Informativo',
            menuItems: const [
              MenuItemModel(
                title: 'Informe Quincenal',
                icon: Icons.article,
                subMenu: [
                  MenuItemModel(
                    title: 'Periodo Informado',
                    icon: Icons.add_circle_outline,
                  ),
                ],
              ),
            ],
            onOptionSelected: (_) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('PANEL ADMIN'), findsOneWidget);
    expect(find.text('Informe Quincenal'), findsOneWidget);

    await tester.tap(find.text('Informe Quincenal'));
    await tester.pumpAndSettle();

    expect(find.text('Periodo Informado'), findsOneWidget);
  });
}
