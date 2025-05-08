import 'package:easy_invoice/widget/bottom_button.dart';
import 'package:easy_invoice/widget/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // nhớ import!
import 'images.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Log In',
          theme: ThemeData(textTheme: GoogleFonts.nunitoSansTextTheme()),
          home: const LogIn(), // <-- home ở đây
        );
      },
    ),
  );
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController taxIdController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isTaxIdError = false;
  bool isUsernameError = false;
  bool isPasswordError = false;
  bool isObscure = true;
  Image eye = Image.asset(Images.eye.path, width: 24.w, height: 24.w);
  Image eyeSplash = Image.asset(
    Images.eyeSplash.path,
    width: 24.w,
    height: 24.w,
  );

  void submitForm() {
    bool isValid = _formKey.currentState!.validate(); // validate toàn bộ form

    setState(() {
      isTaxIdError = taxIdController.text.trim().isEmpty;
      isUsernameError = usernameController.text.trim().isEmpty;
      isPasswordError =
          passwordController.text.trim().isEmpty ||
          passwordController.text.trim().length < 8 ||
          passwordController.text.trim().length > 50;
    });

    if (isValid && !isTaxIdError && !isUsernameError && !isPasswordError) {
      // Nếu form hợp lệ và không lỗi
      print(taxIdController.text);
      print(usernameController.text);
      print(passwordController.text);

      // Thực hiện đăng nhập hoặc điều hướng tiếp
    } else {
      // Nếu form không hợp lệ, show lỗi custom
      print("Vui lòng kiểm tra lại thông tin đăng nhập.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 76.0),
                        child: SizedBox(
                          height: 37.h,
                          width: 158.w,
                          child: Image.asset(
                            Images.logo.path,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 106.h,
                              width: 343.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(text: "Mã số thuế"),

                                  TextFormField(
                                    controller: taxIdController,
                                    decoration: InputDecoration(
                                      hintText: 'Mã số thuế',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(0xFFEBECED),
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFF24E1E,
                                          ), // màu viền khi focus (nhập vào)
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ), // bo góc luôn, không underline
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Image.asset(
                                          Images.closeCircle.path,
                                          width: 24.w, // hoặc size bạn cần
                                          height: 24.w,
                                        ),
                                        onPressed: () {
                                          taxIdController
                                              .clear(); // Xóa nội dung nhập
                                          setState(
                                            () {},
                                          ); // Nếu muốn cập nhật giao diện ngay
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return null; //  trả về chuỗi rỗng để Flutter không tự show lỗi
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      taxIdController.text = value!;
                                    },
                                  ),
                                  if (isTaxIdError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Mã số thuế không được để trống',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (!isTaxIdError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 4),
                            SizedBox(
                              height: 106.h,
                              width: 343.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(text: "Tài khoản"),

                                  TextFormField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      hintText: 'Tài khoản',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(0xFFEBECED),
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFF24E1E,
                                          ), // màu viền khi focus (nhập vào)
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ), // bo góc luôn, không underline
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return null; // trả về chuỗi rỗng để Flutter không tự show lỗi
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      usernameController.text = value!;
                                    },
                                  ),

                                  if (isUsernameError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Tài khoản không được để trống',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),

                                  if (!isUsernameError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 4.h),
                            SizedBox(
                              height: 106.h,
                              width: 343.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(text: "Mật khẩu"),

                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: isObscure, // cực kỳ quan trọng
                                    decoration: InputDecoration(
                                      hintText: 'Mật khẩu',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(0xFFEBECED),
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(0xFFF24E1E),
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ), // bo góc luôn, không underline
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: isObscure ? eyeSplash : eye,
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value.trim().length < 8 ||
                                          value.trim().length > 50) {
                                        return null; // Có lỗi thì trả về chuỗi rỗng
                                      }
                                      return null; // Không lỗi// hợp lệ thì không lỗi
                                    },
                                    onSaved: (value) {
                                      passwordController.text = value!;
                                    },
                                  ),

                                  if (isPasswordError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Mật khẩu phải từ 8 đến 50 ký tự',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),

                                  if (!isPasswordError)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),
                            SizedBox(
                              width: 343.w,
                              height: 54.h,
                              child: ElevatedButton(
                                onPressed: submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(
                                    0xFFF24E1E,
                                  ), // màu nền nút
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  elevation: 0, // nếu muốn không có đổ bóng
                                ),
                                child: Text(
                                  'Đăng nhập',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomButton(
                    text: "Trợ giúp",
                    onPressed: () {},
                    imagePath: Images.headphone.path,
                  ),

                  BottomButton(
                    text: "Group",
                    onPressed: () {},
                    imagePath: Images.face.path,
                  ),

                  BottomButton(
                    text: "Tra cứu",
                    onPressed: () {},
                    imagePath: Images.searchNormal.path,
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
