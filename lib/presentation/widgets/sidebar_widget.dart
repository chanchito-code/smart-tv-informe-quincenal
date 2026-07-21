import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/user_types.dart';
import '../../models/menu_item_model.dart';

class SidebarWidget extends StatelessWidget {
  final UserType userType;
  final String currentSectionTitle;
  final ValueChanged<String> onOptionSelected; // Envía el Título seleccionado
  final List<MenuItemModel> menuItems;

  const SidebarWidget({
    super.key,
    required this.userType,
    required this.currentSectionTitle,
    required this.onOptionSelected,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        color: Colors.white, // Fondo Blanco Solicitado
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(4, 0), // Sombra sutil a la derecha
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado del tipo de usuario con fondo sutil diferenciador
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            color: userType == UserType.admin
                ? const Color(0xFFFFF5F5) // Fondo rojizo sutil para Admin
                : const Color(0xFFEBF8FF), // Fondo azulado sutil para Enlace
            child: Text(
              userType == UserType.admin ? 'PANEL ADMIN' : 'PANEL ENLACE',
              style: TextStyle(
                color: userType == UserType.admin
                    ? const Color(0xFFC53030) // Rojo Admin Corporativo
                    : const Color(0xFF2B6CB0), // Azul SIRIS Oficial
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),

          Divider(color: Colors.grey.withOpacity(0.2), height: 1),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];

                if (item.hasSubMenu) {
                  // === CASO A: TIENE SUBMENÚ (DROPDOWN) ===
                  return Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      splashColor: const Color(
                        0xFFE2E8F0,
                      ), // Hover grisáceo al dar clic
                      highlightColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      iconColor: const Color(0xFF2B6CB0),
                      collapsedIconColor: const Color(0xFF718096),
                      title: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: const Color(0xFF4A5568),
                            size: 24.sp,
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color(
                                  0xFF2D3748,
                                ), // Texto oscuro legible en fondo blanco
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: item.subMenu!.map((subItem) {
                        final isSelected = currentSectionTitle == subItem.title;
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 3.h,
                            bottom: 3.h,
                            right: 15.w,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.r),
                            onTap: () => onOptionSelected(subItem.title),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                // Efecto Hover/Active: Fondo azul claro si está seleccionado
                                color: isSelected
                                    ? const Color(0xFFEBF8FF)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                                // Línea indicadora izquierda gruesa al estar activo
                                border: isSelected
                                    ? const Border(
                                        left: BorderSide(
                                          color: Color(0xFF2B6CB0),
                                          width: 4,
                                        ),
                                      )
                                    : null,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    subItem.icon,
                                    color: isSelected
                                        ? const Color(0xFF2B6CB0)
                                        : const Color(0xFF718096),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      subItem.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: isSelected
                                            ? const Color(0xFF2B6CB0)
                                            : const Color(0xFF4A5568),
                                        fontSize: 26.sp,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  // === CASO B: BOTÓN SIMPLE SIN SUBMENÚ ===
                  final isSelected = currentSectionTitle == item.title;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 15.w,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: () => onOptionSelected(item.title),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFEBF8FF)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.r),
                          border: isSelected
                              ? const Border(
                                  left: BorderSide(
                                    color: Color(0xFF2B6CB0),
                                    width: 4,
                                  ),
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              color: isSelected
                                  ? const Color(0xFF2B6CB0)
                                  : const Color(0xFF718096),
                              size: 24.sp,
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF2B6CB0)
                                      : const Color(0xFF2D3748),
                                  fontSize: 26.sp,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
