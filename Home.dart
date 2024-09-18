// // ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Generatepdf.dart';
import 'package:flutter_application_2/createFoldar.dart';
import 'package:intl/intl.dart';

Future<Uint8List> loadAssetImage(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List();
}

final DateTime time = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(time);
String formattedTime = DateFormat('HH:mm').format(time);

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 105);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;

  List<Widget> name = [];

  @override
  void initState() {
    super.initState();

    name = [
      Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // الحصول على حجم الشاشة بعد بناء الواجهة
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(
                          height * 0.08), // تكبير الحشوة لجعل الأزرار أكبر
                      backgroundColor: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('Map');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.map,
                          size: height * 0.1, // تكبير حجم الأيقونة
                          color: Colors.blue,
                        ),
                        SizedBox(
                            height: height *
                                0.02), // مسافة فارغة أكبر بين الأيقونة والنص
                        Text(
                          'Map',
                          style: TextStyle(
                            fontSize: height * 0.04, // تكبير حجم النص
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.05), // زيادة المسافة بين الأزرار
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(
                          height * 0.06), // تكبير الحشوة لجعل الأزرار أكبر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: height * 0.1, // تكبير حجم الأيقونة
                          color: Colors.blue,
                        ),
                        SizedBox(
                            height: height *
                                0.02), // مسافة فارغة أكبر بين الأيقونة والنص
                        Text(
                          'Upload Image',
                          style: TextStyle(
                            fontSize: height * 0.04, // تكبير حجم النص
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.05), // زيادة المسافة بين الأزرار
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(
                          height * 0.09), // تكبير الحشوة لجعل الأزرار أكبر
                      backgroundColor: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      ClassName.reprts();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.description,
                          size: height * 0.1,
                          color: Colors.blue,
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Report',
                          style: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Foldar(
                TripNo: 'Trip No.1',
                onPressed: () {
                  Navigator.of(context).pushNamed('Listofreports');
                },
              ),
              Foldar(
                TripNo: 'Trip No.2',
                onPressed: () {
                  Navigator.of(context).pushNamed('Listofreports');
                },
              ),
              Foldar(
                TripNo: 'Trip No.3',
                onPressed: () {
                  Navigator.of(context).pushNamed('Listofreports');
                },
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        currentIndex: selected,
        selectedLabelStyle: TextStyle(fontSize: 15),
        unselectedLabelStyle: TextStyle(fontSize: 15),
        iconSize: height * 0.05, // ضبط حجم الأيقونات بناءً على ارتفاع الشاشة
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: height * 0.05),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description, size: height * 0.05),
            label: 'Report',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar with wave
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: height * 0.35, // ضبط ارتفاع العنصر بناءً على الشاشة
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text(
                    'RoadEye',
                    style: TextStyle(
                      fontSize: height * 0.05, // حجم النص بناءً على طول الشاشة
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.all(width * 0.05), // الحشوة نسبية إلى عرض الشاشة
              child: name.elementAt(selected),
            ),
          ),
        ],
      ),
    );
  }
}

class Reportbutton extends StatelessWidget {
  final IconData icon;
  final String street;
  final VoidCallback onPressed;

  const Reportbutton({
    required this.icon,
    required this.street,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: height * 0.02, // الحشوة بناءً على ارتفاع الشاشة
        horizontal: width * 0.05, // الحشوة بناءً على عرض الشاشة
      ),
      child: ListTile(
        leading: Icon(icon, size: height * 0.05, color: Colors.blue),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              street,
              style: TextStyle(fontSize: height * 0.02),
            ),
            Text(
              'Date:$formattedDate Time:$formattedTime',
              style: TextStyle(fontSize: height * 0.015),
            ),
          ],
        ),
        trailing:
            Icon(Icons.arrow_forward, size: height * 0.04, color: Colors.blue),
        onTap: onPressed,
      ),
    );
  }
}
