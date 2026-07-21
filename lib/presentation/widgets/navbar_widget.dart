import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/user_types.dart';

class NavbarWidget extends StatelessWidget {
  final String title;
  final UserType userType;

  const NavbarWidget({super.key, required this.title, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.account_circle, color: Colors.white, size: 30.sp),
              SizedBox(width: 10.w),
              Text(
                userType == UserType.admin
                    ? 'Administrador Principal'
                    : 'Usuario Enlace',
                style: TextStyle(color: Colors.white, fontSize: 26.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
