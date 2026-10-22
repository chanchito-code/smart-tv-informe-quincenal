import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcuseEnteView extends StatelessWidget {
  final String entePublico;
  final String periodo;

  const AcuseEnteView({
    super.key,
    required this.entePublico,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2B6CB0)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Acuse por Ente Público Proveedor',
          style: TextStyle(
            color: const Color(0xFF2D3748),
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.w),
          child: Container(
            width: 1000.w,
            padding: EdgeInsets.all(40.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SISTEMA DE INFORMACIÓN DE REPORTES QUINCENALES (SIRIS)',
                          style: TextStyle(
                            color: const Color(0xFF2B6CB0),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Reporte Individual de Cumplimiento de Obligaciones',
                          style: TextStyle(color: Colors.grey, fontSize: 26.sp),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.business_center_rounded,
                      size: 45.sp,
                      color: const Color(0xFF2B6CB0),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                const Divider(thickness: 1.5),
                SizedBox(height: 25.h),

                Text(
                  'DETALLES DEL ENTE PÚBLICO',
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 15.h),

                _buildDetailRow('Nombre Oficial:', entePublico),
                _buildDetailRow('Periodo Evaluado:', periodo),
                _buildDetailRow('Estatus de Registro:', 'CUMPLIDO A TIEMPO'),
                _buildDetailRow(
                  'Folio de Validación:',
                  'VAL-2026-${entePublico.toUpperCase()}-098',
                ),
                _buildDetailRow(
                  'Fecha de Certificación:',
                  '2026-01-10 09:12:00 Horas',
                ),

                SizedBox(height: 35.h),
                const Divider(),
                SizedBox(height: 20.h),

                Text(
                  'CADENA DE AUTENTICACIÓN DIGITAL',
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFC),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'SHA256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855... Certificado por Ente Autónomo de Fiscalización.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 26.sp,
                      fontFamily: 'monospace',
                      height: 1.4,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // Boton de acción inferior
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: const Text(
                        'Regresar al Panel',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B6CB0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 12.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250.w,
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF718096),
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: const Color(0xFF2D3748),
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
