import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SancionadosView extends StatefulWidget {
  const SancionadosView({super.key});

  @override
  State<SancionadosView> createState() => _SancionadosViewState();
}

class _SancionadosViewState extends State<SancionadosView> {
  // Variables para controlar las selecciones de los filtros
  String? _selectedSancionadoType;
  String? _selectedPeriodo;
  String _selectedEnteProveedor = 'SEDETUR';

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
            // 1. CONTENEDOR DE FILTROS DE BÚSQUEDA
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

                  // Fila 1: Tipo de Sancionados y Periodos Informativos
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sancionados',
                              style: TextStyle(
                                color: const Color(0xFF2D3748),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownContainer(
                              hint: 'Seleccione un tipo de sancionado...',
                              value: _selectedSancionadoType,
                              items: [
                                'Servidor Público',
                                'Persona Física',
                                'Persona Moral',
                              ],
                              onChanged: (val) =>
                                  setState(() => _selectedSancionadoType = val),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Periodos informativos',
                              style: TextStyle(
                                color: const Color(0xFF2D3748),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownContainer(
                              hint: 'Seleccione...',
                              value: _selectedPeriodo,
                              items: [
                                'Primer Quincena Enero 2026',
                                'Segunda Quincena Enero 2026',
                              ],
                              onChanged: (val) =>
                                  setState(() => _selectedPeriodo = val),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  // Campo 2: Entes Públicos Proveedores
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
                          text: 'Entes públicos proveedores',
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
                    hint: 'Seleccione...',
                    value: _selectedEnteProveedor,
                    items: ['SEDETUR', 'SABGOB', 'SEDE', 'SESAEQROO'],
                    onChanged: (val) => setState(
                      () => _selectedEnteProveedor = val ?? 'SEDETUR',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // 2. TABLA CON EL LISTADO DE SANCIONADOS
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
                  // Estructura de la Tabla de Datos
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.5), // No.
                      1: FlexColumnWidth(1.2), // No. Expediente
                      2: FlexColumnWidth(2.2), // Nombre Completo
                      3: FlexColumnWidth(1.2), // Ente Público
                      4: FlexColumnWidth(1.2), // Falta cometida
                      5: FlexColumnWidth(2.0), // Tipo sanciones
                      6: FlexColumnWidth(1.3), // Tipo sancionado
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      // Encabezados de la Tabla
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color(0xFFCBD5E0),
                        ),
                        children: [
                          _buildHeaderCell('No.'),
                          _buildHeaderCell('No. expediente'),
                          _buildHeaderCell('Nombre completo'),
                          _buildHeaderCell('Ente público'),
                          _buildHeaderCell('Falta cometida'),
                          _buildHeaderCell('Tipo sanciones'),
                          _buildHeaderCell('Tipo sancionado'),
                        ],
                      ),
                      // Registro #1
                      _buildSancionadoRow(
                        '1',
                        'SP-01/2026',
                        'ARMANDO PADILLA SANCHEZ',
                        'SABGOB',
                        'PECULADO',
                        'INHABILITACIÓN, ECONÓMICA',
                        'PERSONA FÍSICA',
                      ),
                      // Registro #2
                      _buildSancionadoRow(
                        '2',
                        'SP-02/2026',
                        'LAURA SANSORES PEÑA',
                        'SEDETUR',
                        'NEPOTISMO',
                        'ECONÓMICA',
                        'PERSONA MORAL',
                      ),
                      // Registro #3
                      _buildSancionadoRow(
                        '3',
                        'SP-03/2026',
                        'HERNAN PEREZ AGUILAR',
                        'SESAEQROO',
                        'COHECHO',
                        'INHABILITACIÓN',
                        'SERVIDOR PÚBLICO',
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Paginación Inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mostrando 1 a 3 de 3 registros',
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

  // Helper para generar las filas de la tabla de sancionados dinámicamente
  TableRow _buildSancionadoRow(
    String no,
    String expediente,
    String nombre,
    String ente,
    String falta,
    String sancion,
    String tipo,
  ) {
    return TableRow(
      children: [
        _buildDataCell(no, isCenter: true),
        // Número de expediente con estilo de enlace azul
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              expediente,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF3182CE),
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _buildDataCell(nombre),
        _buildDataCell(ente, isCenter: true),
        _buildDataCell(falta, isCenter: true),
        _buildDataCell(sancion, isCenter: true),
        _buildDataCell(tipo, isCenter: true),
      ],
    );
  }

  // Helpers de componentes reutilizables
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
            style: TextStyle(color: Colors.grey, fontSize: 26.sp),
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
                  fontSize: 26.sp,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
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
            fontSize: 26.sp,
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
          style: TextStyle(color: const Color(0xFF4A5568), fontSize: 26.sp),
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
          fontSize: 26.sp,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
