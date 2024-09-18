import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketManagement extends StatefulWidget {
  @override
  _TicketManagementState createState() => _TicketManagementState();
}

class _TicketManagementState extends State<TicketManagement> {
  String? selectedStatus;
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isSmallScreen = width < 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      // Start Date Picker
                      Expanded(
                        flex: isSmallScreen ? 1 : 2,
                        child: InkWell(
                          onTap: () => _selectDate(context, true),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'From Date',
                            ),
                            child: Text(
                              startDate == null
                                  ? 'mm/dd/yyyy'
                                  : DateFormat('MM/dd/yyyy').format(startDate!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      // End Date Picker
                      Expanded(
                        flex: isSmallScreen ? 1 : 2,
                        child: InkWell(
                          onTap: () => _selectDate(context, false),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'To Date',
                            ),
                            child: Text(
                              endDate == null
                                  ? 'mm/dd/yyyy'
                                  : DateFormat('MM/dd/yyyy').format(endDate!),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Search Bar
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Search Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement your search logic here
                    },
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
