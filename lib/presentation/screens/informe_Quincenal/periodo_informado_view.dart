import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pdf/acuse_detalle_view.dart';

class PeriodoInformadoView extends StatefulWidget {
  const PeriodoInformadoView({super.key});

  @override
  State<PeriodoInformadoView> createState() => _PeriodoInformadoViewState();
}

class _PeriodoInformadoViewState extends State<PeriodoInformadoView> {
  // Variable para simular la opción seleccionada en el menú desplegable
  String _selectedPeriod = '01 AL 15 febrero de 2026';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F7), // Fondo gris claro corporativo
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. SELECTOR DE PERIODO (Dropdown superior)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '* ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Seleccione un periodo del informe',
                          style: TextStyle(
                            color: const Color(0xFF2D3748),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.4),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedPeriod,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        items:
                            <String>[
                              '01 AL 15 enero de 2026',
                              '01 AL 15 febrero de 2026',
                              '16 AL 28 febrero de 2026',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: const Color(0xFF4A5568),
                                    fontSize: 26.sp,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedPeriod = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // 2. FILA DE LAS 3 TARJETAS MÉTRICAS
            Row(
              children: [
                _buildMetricCard(
                  title: 'Porcentaje de cumplimiento',
                  value: '50%',
                  valueColor: const Color(0xFFE53E3E), // Rojo
                  indicatorColor: const Color(0xFFE53E3E),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Entes públicos que reportaron a tiempo',
                  value: '1',
                  valueColor: const Color(0xFF3182CE), // Azul
                  indicatorColor: const Color(0xFF3182CE),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Entes públicos que reportaron a extemporáneo',
                  value: '1',
                  valueColor: const Color(0xFF805AD5), // Morado
                  indicatorColor: const Color(0xFF805AD5),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            // 3. TABLA DE LISTADO DE ENTES PÚBLICOS
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Listado de entes públicos',
                    style: TextStyle(
                      color: const Color(0xFF2D3748),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Controles superiores de la tabla (Mostrar registros y Buscar)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mostrar ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 26.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.4),
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '10 ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 16.sp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            ' registros',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 26.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Buscar: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 26.sp,
                            ),
                          ),
                          Container(
                            width: 200.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.4),
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // ESTRUCTURA DE LA TABLA (Diseño Responsivo)
                  // ESTRUCTURA DE LA TABLA (Diseño Responsivo Corregido)
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.6), // No.
                      1: FlexColumnWidth(2.0), // Ente público
                      2: FlexColumnWidth(1.5), // Registros reportados
                      3: FlexColumnWidth(1.5), // Fecha envió reporte
                      4: FlexColumnWidth(1.2), // Estatus
                      5: FlexColumnWidth(1.5), // Acción
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      // Encabezados de la Tabla (6 celdas)
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color(0xFFCBD5E0),
                        ), // Fondo gris de cabecera
                        children: [
                          _buildHeaderCell('No.'),
                          _buildHeaderCell('Ente público'),
                          _buildHeaderCell('Registros reportados'),
                          _buildHeaderCell('Fecha envió reporte'),
                          _buildHeaderCell('Estatus'),
                          _buildHeaderCell('Acción'),
                        ],
                      ),
                      // Fila de datos #1 (6 celdas exactas)
                      TableRow(
                        children: [
                          _buildDataCell('1', isCenter: true), // 1. No.
                          _buildDataCell('SEDETUR'), // 2. Ente público
                          _buildDataCell(
                            '1',
                            isCenter: true,
                          ), // 3. Registros reportados
                          _buildDataCell(
                            '2026-02-02',
                            isCenter: true,
                          ), // 4. Fecha envió reporte
                          // 5. Celda con el Estatus (Badge) que hacía falta
                          TableCell(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFD69E2E,
                                  ), // Color Naranja/Amarillo de Extemporánea
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  'Extemporánea',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // 6. Celda con el Botón de Acción para ir al PDF
                          TableCell(
                            child: Center(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  // Ejecuta la transición de pantalla completa nativa
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AcuseDetalleView(
                                            entePublico: 'SEDETUR',
                                            periodo:
                                                '01 al 15 de febrero de 2026',
                                          ),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xFF3182CE),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 16.sp,
                                  color: const Color(0xFF3182CE),
                                ),
                                label: Text(
                                  'Visualizar acuse',
                                  style: TextStyle(
                                    color: const Color(0xFF3182CE),
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Paginación Inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mostrando 1 a 1 de 1 registros',
                        style: TextStyle(color: Colors.grey, fontSize: 26.sp),
                      ),
                      Row(
                        children: [
                          _buildPageButton('Anterior', isEnabled: false),
                          _buildPageButton('1', isActive: true),
                          _buildPageButton('Siguiente', isEnabled: false),
                        ],
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

  // Helper: Tarjetas métricas intermedias
  Widget _buildMetricCard({
    required String title,
    required String value,
    required Color valueColor,
    required Color indicatorColor,
  }) {
    return Expanded(
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 20.h,
              bottom: 20.h,
              child: Container(
                width: 5.w,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.r),
                    bottomRight: Radius.circular(4.r),
                  ),
                ),
              ),
            ),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: 26.sp,
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

  // Helper: Celdas del encabezado de la tabla
  Widget _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF2D3748),
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Helper: Celdas de datos comunes de la tabla
  Widget _buildDataCell(String text, {bool isCenter = false}) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Text(
          text,
          textAlign: isCenter
              ? TextAlign.center
              : Alignment.centerLeft.x == 0
              ? TextAlign.left
              : TextAlign.center,
          style: TextStyle(color: const Color(0xFF4A5568), fontSize: 14.sp),
        ),
      ),
    );
  }

  // Helper: Botones de paginación
  Widget _buildPageButton(
    String text, {
    bool isActive = false,
    bool isEnabled = true,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2B6CB0) : Colors.transparent,
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive
              ? Colors.white
              : (isEnabled ? const Color(0xFF2B6CB0) : Colors.grey),
          fontSize: 26.sp,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
