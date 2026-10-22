import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanelInformativoView extends StatelessWidget {
  const PanelInformativoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFEDF2F7,
      ), // Fondo gris claro/azul de la referencia
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. BANNER CENTRAL: Período del informe vigente
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color(0xFF1A202C),
                      fontSize: 26.sp,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Periodo del informe vigente: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '01 al 15 de enero 2026'),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // 2. FILA DE LAS 3 TARJETES PRINCIPALES
            Row(
              children: [
                _buildMetricCard(
                  title: 'Entes públicos\nProveedores de información',
                  value: '24',
                  valueColor: const Color(0xFFE53E3E), // Rojo
                  indicatorColor: const Color(0xFFE53E3E),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Entes públicos que\nreportaron en tiempo',
                  value: '24',
                  valueColor: const Color(0xFF3182CE), // Azul claro
                  indicatorColor: const Color(0xFF3182CE),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Entes públicos omisos',
                  value: '0',
                  valueColor: const Color(0xFF4A5568), // Gris oscuro azulado
                  indicatorColor: const Color(0xFF3182CE),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            // 3. TARJETA INFERIOR DE AVANCE DE CUMPLIMIENTO
            Container(
              width:
                  450.w, // Ancho fijo para mantener la proporción de la imagen
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Avance de cumplimiento',
                    style: TextStyle(
                      color: const Color(0xFF2D3748),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25.h),

                  // Simulación del gráfico de arco (Semircírculo de progreso)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 180.w,
                        height: 180.w,
                        child: CircularProgressIndicator(
                          value:
                              0.5, // 50% de un círculo completo simula el arco superior
                          strokeWidth: 26.w,
                          backgroundColor: const Color(0xFFEDF2F7),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFECC94B),
                          ), // Amarillo/Dorado
                        ),
                      ),
                      // El semicírculo nativo rota, lo centramos visualmente desplazando el texto
                      Transform.translate(
                        offset: Offset(0, -10.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '100%',
                              style: TextStyle(
                                color: const Color(0xFF2D3748),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  // Botón / Texto de detalle inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline, size: 16.sp, color: Colors.grey),
                      SizedBox(width: 5.w),
                      Text(
                        'Ver detalle de cumplimiento',
                        style: TextStyle(color: Colors.grey, fontSize: 26.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Constructor dinámico para las 3 tarjetas superiores
  Widget _buildMetricCard({
    required String title,
    required String value,
    required Color valueColor,
    required Color indicatorColor,
  }) {
    return Expanded(
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Línea indicadora vertical en el borde izquierdo
            Positioned(
              left: 0,
              top: 25.h,
              bottom: 25.h,
              child: Container(
                width: 5.w,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  ),
                ),
              ),
            ),
            // Contenido de la tarjeta
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF4A5568),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: 56.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
