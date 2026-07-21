import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  // Nueva propiedad opcional para submenús
  final List<MenuItemModel>? subMenu;

  const MenuItemModel({
    required this.title,
    required this.icon,
    this.subMenu, // Por defecto será null si no se envía
  });

  // Un método rápido para saber si esta opción se despliega
  bool get hasSubMenu => subMenu != null && subMenu!.isNotEmpty;
}
