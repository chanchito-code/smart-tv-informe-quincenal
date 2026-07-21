import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcuseDetalleView extends StatelessWidget {
  final String entePublico;
  final String periodo;

  const AcuseDetalleView({
    super.key,
    required this.entePublico,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F7), // Fondo gris claro de la app
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2B6CB0)),
          onPressed: () =>
              Navigator.of(context).pop(), // Regresa a la tabla anterior
        ),
        title: Text(
          'Visualización de Acuse Oficial',
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
            width: 1000.w, // Ancho horizontal excelente para Smart TV
            padding: EdgeInsets.all(40.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado institucional
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
                          'Acuse de Recepción de Informe Digital',
                          style: TextStyle(color: Colors.grey, fontSize: 26.sp),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.gavel_rounded,
                      size: 45.sp,
                      color: const Color(0xFF2B6CB0),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                const Divider(thickness: 1.5),
                SizedBox(height: 25.h),

                // Bloque de Datos Generales
                Text(
                  'DATOS DEL REGISTRO',
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 15.h),

                _buildDetailRow('Ente Público:', entePublico),
                _buildDetailRow('Periodo del Informe:', periodo),
                _buildDetailRow(
                  'Fecha y Hora de Envío:',
                  '2026-02-02 11:45:23 Horas (Centro)',
                ),
                _buildDetailRow(
                  'Folio Único de Control:',
                  'SIRIS-2026-QE-0012497',
                ),
                _buildDetailRow(
                  'Estatus de la Entrega:',
                  'EXTEMPORÁNEA (Fuera de tiempo legal)',
                ),

                SizedBox(height: 35.h),
                const Divider(),
                SizedBox(height: 20.h),

                // Sección de Seguridad / Sello Digital
                Text(
                  'SELLO DIGITAL DE FIRMA ELECTRÓNICA',
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
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Text(
                    'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC3x9Vp8qZ... Cadena Oficial Encriptada ... 7a:8b:9c:1d:2e:3f:4a:5b:6c:7d:8e:9f:0a:1b:2c:3d:4e:5f:6a:7b:8c:9d:0e:1f',
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
                      label: const Text('Volver al Listado', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B6CB0),
                        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
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
