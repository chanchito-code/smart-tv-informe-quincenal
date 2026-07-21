import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/user_types.dart';
import 'presentation/layouts/main_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080), // Proporciones de TV
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          // Aquí decides qué rol quieres probar: UserType.admin o UserType.enlace
          home: MainLayout(userType: UserType.admin),
        );
      },
    );
  }
}
