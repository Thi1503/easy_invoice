import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.imagePath,
  });

  final String text;
  final VoidCallback onPressed;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 109.w,
      height: 54.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFFEBECED)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.only(
            top: 15.h,
            bottom: 15.h,
            left: 16.w,
            right: 16.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 24.w,
              height: 24.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 4.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // cho chắc chắn căn giữa
            ),
          ],
        ),
      ),
    );
  }
}
