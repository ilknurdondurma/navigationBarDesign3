import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class addRecord extends StatefulWidget {
  const addRecord({Key? key}) : super(key: key);

  @override
  State<addRecord> createState() => _addRecordState();
}

class _addRecordState extends State<addRecord> {
  int _selectedValue = 60;
  DateTime _selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyCardWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.monitor_weight_outlined,color: Colors.white,size: 20,),
                Text(
                  "KİLO :",
                  style: const TextStyle(color: Colors.white),
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  textStyle: TextStyle(color: Colors.white),
                  minValue: 0,
                  maxValue: 180,
                  value: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)

                  ),
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: ()async{

              var initialDate= DateTime.now();
              _selectedDate= await showDatePicker(
                builder: (context, child) {
                  return Theme(data: ThemeData.dark(),child: child??Text(""),);
                },
                  context: context,
                  initialDate: initialDate,
                  firstDate: initialDate.subtract(Duration(days:10)),
                  lastDate: initialDate.add(Duration(days: 10)))??_selectedDate;

              setState(() {
                _selectedDate;
              });
            },
            child: MyCardWidget(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon((Icons.date_range),color: Colors.white,),
                    Text("   TARİH :",style: TextStyle(color: Colors.white)),
                    Expanded(child:
                    Text(DateFormat('d MMM ').format(_selectedDate),
                        style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,

                    ),

                    ),



                  ],
                ),
              )
            ),
          ),

        ],//CHİLDREN BODY
      ),//COLUMN BODY
    );
  }
}

class MyCardWidget extends StatelessWidget {
  final Color? renk;
  final Widget? child;
  final double? border;

  MyCardWidget({this.renk = Colors.black, this.child, this.border = 16});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: renk,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(border!)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
