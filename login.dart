import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.08, // ضبط المسافة بناءً على نسبة من الشاشة
                ),
                Image.asset(
                  'assets/logo.png',
                  width: width * 0.7, // ضبط حجم الصورة بناءً على عرض الشاشة
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  'Login to your account',
                  style: TextStyle(
                      fontSize: height * 0.03), // حجم النص نسبي لطول الشاشة
                ),
                SizedBox(
                  height: height * 0.08, // مسافة بين النص وحقول الإدخال
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: width * 0.03),
                  height:
                      height * 0.08, // جعل الحقل متجاوب بناءً على طول الشاشة
                  width: width * 0.9, // عرض الحقل بناءً على عرض الشاشة
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 3),
                          color: Colors.grey)
                    ],
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Email',
                      hintStyle: TextStyle(
                        fontSize: height * 0.025, // حجم النص نسبي لطول الشاشة
                        color: Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: height * 0.04, // حجم الأيقونة نسبي لطول الشاشة
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: width * 0.03),
                  height:
                      height * 0.08, // جعل الحقل متجاوب بناءً على طول الشاشة
                  width: width * 0.9, // عرض الحقل بناءً على عرض الشاشة
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 3),
                          color: Colors.grey)
                    ],
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Password',
                      hintStyle: TextStyle(
                        fontSize: height * 0.025, // حجم النص نسبي لطول الشاشة
                        color: Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: height * 0.04, // حجم الأيقونة نسبي لطول الشاشة
                        color: Colors.grey[600],
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05, // مسافة بين حقول الإدخال وزر الدخول
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        width * 0.3, // الحشوة الأفقية نسبة إلى عرض الشاشة
                    vertical:
                        height * 0.02, // الحشوة الرأسية نسبة إلى طول الشاشة
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('Home');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: height * 0.035, // حجم النص نسبي لطول الشاشة
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue[400],
                ),
                // يمكنك إضافة مزيد من العناصر هنا وجعلها متجاوبة إذا لزم الأمر
              ],
            ),
          ),
        ),
      ),
    );
  }
}
