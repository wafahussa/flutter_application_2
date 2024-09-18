// // ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Generatepdf.dart';
// import 'package:flutter_application_2/createFoldar.dart';
// import 'package:flutter_application_2/pdf_creator.dart';
// import 'package:intl/intl.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   // قائمة الصفحات (يمكنك وضع كل صفحة تريدها هنا)
//   final List<Widget> _pages = <Widget>[
//     FirstPage(),
//     SecondPage(), // الآن تحتوي على الفلترة وقائمة الرحلات
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         // تغيير محتوى الـ AppBar بناءً على الصفحة المحددة
//         title: _selectedIndex == 0
//             ? Text(
//                 'ROADEYE',
//                 style: TextStyle(color: Colors.blue),
//               ) // عنوان للصفحة الأولى
//             : null, // لا يوجد عنوان للصفحة الثانية
//         // لا يوجد أكشنز في الصفحة الأولى
//       ),
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         items: <BottomNavigationBarItem>[
//           const BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.description,
//             ),
//             label: 'Report',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// // الصفحة الأولى
// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           // الحصول على حجم الشاشة بعد بناء الواجهة
//           final height = constraints.maxHeight;
//           final width = constraints.maxWidth;

//           return SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.all(
//                         height * 0.08), // تكبير الحشوة لجعل الأزرار أكبر
//                     backgroundColor: Colors.blue[100],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 5,
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('Map');
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.map,
//                         size: height * 0.1, // تكبير حجم الأيقونة
//                         color: Colors.blue,
//                       ),
//                       SizedBox(
//                           height: height *
//                               0.02), // مسافة فارغة أكبر بين الأيقونة والنص
//                       Text(
//                         'Map',
//                         style: TextStyle(
//                           fontSize: height * 0.04, // تكبير حجم النص
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: height * 0.05), // زيادة المسافة بين الأزرار
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.all(
//                         height * 0.06), // تكبير الحشوة لجعل الأزرار أكبر
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 5,
//                   ),
//                   onPressed: () {},
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.cloud_upload_outlined,
//                         size: height * 0.1, // تكبير حجم الأيقونة
//                         color: Colors.blue,
//                       ),
//                       SizedBox(
//                           height: height *
//                               0.02), // مسافة فارغة أكبر بين الأيقونة والنص
//                       Text(
//                         'Upload Image',
//                         style: TextStyle(
//                           fontSize: height * 0.04, // تكبير حجم النص
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: height * 0.05), // زيادة المسافة بين الأزرار
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.all(
//                         height * 0.09), // تكبير الحشوة لجعل الأزرار أكبر
//                     backgroundColor: Colors.blue[100],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 5,
//                   ),
//                   onPressed: () {
//                     ClassName.reprts();
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.description,
//                         size: height * 0.1,
//                         color: Colors.blue,
//                       ),
//                       SizedBox(height: height * 0.02),
//                       Text(
//                         'Report',
//                         style: TextStyle(
//                           fontSize: height * 0.04,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // الصفحة الثانية مع إضافة الفلترة وقائمة الرحلات
// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   String? selectedStatus;
//   DateTime? startDate;
//   DateTime? endDate;
//   final TextEditingController _searchController = TextEditingController();

//   Future<void> _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != (isStartDate ? startDate : endDate)) {
//       setState(() {
//         if (isStartDate) {
//           startDate = picked;
//         } else {
//           endDate = picked;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           double width = constraints.maxWidth;
//           bool isSmallScreen = width < 600;

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Row for the Date Picker and Search
//                   Row(
//                     children: [
//                       // Start Date Picker
//                       Expanded(
//                         flex: isSmallScreen ? 1 : 2,
//                         child: InkWell(
//                           onTap: () => _selectDate(context, true),
//                           child: InputDecorator(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'From Date',
//                             ),
//                             child: Text(
//                               startDate == null
//                                   ? 'mm/dd/yyyy'
//                                   : DateFormat('MM/dd/yyyy').format(startDate!),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),

//                       // End Date Picker
//                       Expanded(
//                         flex: isSmallScreen ? 1 : 2,
//                         child: InkWell(
//                           onTap: () => _selectDate(context, false),
//                           child: InputDecorator(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'To Date',
//                             ),
//                             child: Text(
//                               endDate == null
//                                   ? 'mm/dd/yyyy'
//                                   : DateFormat('MM/dd/yyyy').format(endDate!),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),

//                   // Search Bar
//                   TextFormField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Search',
//                       prefixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   // Search Button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Implement your search logic here
//                     },
//                     child: Text('Search'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // قائمة الرحلات
//                   Foldar(
//                     TripNo: 'Trip No.1',
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('Listofreports');
//                     },
//                   ),
//                   Foldar(
//                     TripNo: 'Trip No.2',
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('Listofreports');
//                     },
//                   ),
//                   Foldar(
//                     TripNo: 'Trip No.3',
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('Listofreports');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Reportbutton extends StatelessWidget {
//   final IconData icon;
//   final String street;
//   final VoidCallback onPressed;

//   const Reportbutton({
//     required this.icon,
//     required this.street,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;

//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.symmetric(
//         vertical: height * 0.02, // الحشوة بناءً على ارتفاع الشاشة
//         horizontal: width * 0.05, // الحشوة بناءً على عرض الشاشة
//       ),
//       child: ListTile(
//         leading: Icon(icon, size: height * 0.05, color: Colors.blue),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               street,
//               style: TextStyle(fontSize: height * 0.02),
//             ),
//             Text(
//               'Date:$formattedDate Time:$formattedTime',
//               style: TextStyle(fontSize: height * 0.015),
//             ),
//           ],
//         ),
//         trailing:
//             Icon(Icons.arrow_forward, size: height * 0.04, color: Colors.blue),
//         onTap: onPressed,
//       ),
//     );
//   }
// }
