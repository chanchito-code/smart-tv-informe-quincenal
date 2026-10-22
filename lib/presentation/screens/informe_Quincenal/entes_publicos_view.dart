import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pdf/acuse_ente_view.dart';

class EntesPublicosView extends StatefulWidget {
  const EntesPublicosView({super.key});

  @override
  State<EntesPublicosView> createState() => _EntesPublicosViewState();
}

class _EntesPublicosViewState extends State<EntesPublicosView> {
  // Variables de control para los filtros simulados
  String? _selectedYear;
  String? _selectedMonth;
  String _selectedEnte =
      'Secretaría Ejecutiva del Sistema Anticorrupción del Estado de Quintana Roo';

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
            // 1. SECCIÓN DE FILTROS DE BÚSQUEDA
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
                    'Seleccione filtros de búsqueda',
                    style: TextStyle(
                      color: const Color(0xFF4A5568),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Fila de Año y Mes
                  Row(
                    children: [
                      // Dropdown Año
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Año',
                              style: TextStyle(
                                color: const Color(0xFF2D3748),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownContainer(
                              hint: 'Seleccionar año',
                              value: _selectedYear,
                              items: ['2024', '2025', '2026'],
                              onChanged: (val) =>
                                  setState(() => _selectedYear = val),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      // Dropdown Mes
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mes',
                              style: TextStyle(
                                color: const Color(0xFF2D3748),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownContainer(
                              hint: 'Seleccionar mes',
                              value: _selectedMonth,
                              items: ['Enero', 'Febrero', 'Marzo', 'Abril'],
                              onChanged: (val) =>
                                  setState(() => _selectedMonth = val),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  // Dropdown Ente Público Proveedor de Información
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
                          text: 'Ente público proveedor de información',
                          style: TextStyle(
                            color: const Color(0xFF2D3748),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildDropdownContainer(
                    hint: 'Seleccionar ente público',
                    value: _selectedEnte,
                    items: [
                      'Secretaría Ejecutiva del Sistema Anticorrupción del Estado de Quintana Roo',
                    ],
                    onChanged: (val) => setState(() => _selectedEnte = val!),
                  ),

                  SizedBox(height: 20.h),

                  // Botones de acción alineados a la derecha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF2B6CB0,
                          ), // Azul rey oscuro
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Generar informe quincenal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _selectedYear = null;
                            _selectedMonth = null;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF2B6CB0)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.refresh,
                          size: 18.sp,
                          color: const Color(0xFF2B6CB0),
                        ),
                        label: Text(
                          'Limpiar filtros de búsqueda',
                          style: TextStyle(
                            color: const Color(0xFF2B6CB0),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // 2. FILA DE LAS 3 TARJETAS MÉTRICAS
            Row(
              children: [
                _buildMetricCard(
                  title: 'Efectividad de cumplimiento',
                  value: '50%',
                  valueColor: const Color(0xFFE53E3E),
                  indicatorColor: const Color(0xFFE53E3E),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Informes reportados en tiempo',
                  value: '1',
                  valueColor: const Color(0xFF3182CE),
                  indicatorColor: const Color(0xFF3182CE),
                ),
                SizedBox(width: 20.w),
                _buildMetricCard(
                  title: 'Informes reportados en extemporáneo',
                  value: '1',
                  valueColor: const Color(0xFF4A5568),
                  indicatorColor: const Color(0xFF3182CE),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            // 3. TABLA DE LISTADO DE INFORMES QUINCENALES
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
                    'Listado de informes quincenales reportados en el periodo',
                    style: TextStyle(
                      color: const Color(0xFF2D3748),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Controles superiores de la tabla
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

                  // ESTRUCTURA DE LA TABLA
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.6), // No.
                      1: FlexColumnWidth(2.0), // Periodo del informe
                      2: FlexColumnWidth(1.5), // Registros reportados
                      3: FlexColumnWidth(1.5), // Fecha envió reporte
                      4: FlexColumnWidth(1.2), // Estatus
                      5: FlexColumnWidth(1.5), // Acción
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      // Encabezados
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color(0xFFCBD5E0),
                        ),
                        children: [
                          _buildHeaderCell('No.'),
                          _buildHeaderCell('Periodo del informe'),
                          _buildHeaderCell('Registros reportados'),
                          _buildHeaderCell('Fecha envió reporte'),
                          _buildHeaderCell('Estatus'),
                          _buildHeaderCell('Acción'),
                        ],
                      ),
                      // Fila de datos #1
                      TableRow(
                        children: [
                          _buildDataCell('1', isCenter: true),
                          _buildDataCell('Enero 01 al 15 2026'),
                          _buildDataCell('1', isCenter: true),
                          _buildDataCell('2026-01-10', isCenter: true),

                          // Badge Estatus "Normal" (Verde de la imagen)
                          TableCell(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF38A169,
                                  ), // Verde corporativo
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Botón personalizado: "Visualizar acuse"
                          TableCell(
                            child: Center(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  // Navegación limpia a pantalla completa
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AcuseEnteView(
                                        entePublico:
                                            'Secretaría Ejecutiva del Sistema Anticorrupción', // O la variable dinámica que uses
                                        periodo: 'Enero 01 al 15 2026',
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
                                    fontSize: 13.sp,
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

                  // Paginación
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mostrando 1 a 1 de 1 registros',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
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

  // Helper para construir los inputs contenedores de dropdowns estilizados
  Widget _buildDropdownContainer({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.4)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          items: items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(
                val,
                style: TextStyle(
                  color: const Color(0xFF4A5568),
                  fontSize: 15.sp,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // Auxiliares estáticos heredados del diseño unificado
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
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: 48.sp,
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

  Widget _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF2D3748),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {bool isCenter = false}) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Text(
          text,
          textAlign: isCenter ? TextAlign.center : TextAlign.left,
          style: TextStyle(color: const Color(0xFF4A5568), fontSize: 14.sp),
        ),
      ),
    );
  }

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
          fontSize: 13.sp,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
