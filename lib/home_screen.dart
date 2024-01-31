
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_traker_app/water_consume.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WaterConsume> waterConsumeList = [];
  final TextEditingController _noOfGlassTEController = TextEditingController(text: '1');
  final TextEditingController _noteTEController = TextEditingController(text: 'Morning');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Tracker"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: (){
                      if(_noOfGlassTEController.text.trim().isEmpty){
                        _noOfGlassTEController.text = '1';
                      } 
                      final noOfGlasses = _noOfGlassTEController.text.trim();
                      int value = int.tryParse(noOfGlasses) ?? 1;
                      waterConsumeList.add(
                          WaterConsume(value, DateTime.now(),  _noteTEController.text ));
                      setState(() {
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: Colors.deepOrange, width: 4),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Text("Tap to Add", style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: _noOfGlassTEController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 25,),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: _noteTEController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
        
                ],
              ),
            ),
            ListView.builder(
                itemCount: waterConsumeList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(waterConsumeList[index].noOfGlasses.toString()),
                    ),
                    title: Text(waterConsumeList[index].note),
                    subtitle: Text( DateFormat.yMEd().add_jms().format(waterConsumeList[index].time)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        waterConsumeList.removeAt(index);
                        setState(() {
                        });
                      },
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
