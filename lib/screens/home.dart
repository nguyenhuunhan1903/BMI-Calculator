import 'package:flutter/material.dart';
import 'package:resumeproject/constrants/app_constrants.dart';
import 'package:resumeproject/widgets/left_bar.dart';

import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult=0;
   String _textResult = "";
  final Color? accentColor = accentHexColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Caculator",
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ), //in order to margin
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  )),
              SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  )),
            ]),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap:(){
                double _h=double.parse(_heightController.text);
                 double _w=double.parse(_weightController.text);
                 setState(() {
                   _bmiResult=_w/(_h*_h);
                   if(_bmiResult>25){
                    _textResult="You're over weight";
                   }else if(_bmiResult>=18.5&&_bmiResult<=25){
                    _textResult="You're mormal weight";
                   }else{
                    _textResult="You're under weight";
                   }
                 });
              },
              child: const Text("Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellowAccent)),
            ),
            const SizedBox(height: 50,),
            Text(_bmiResult.toStringAsFixed(2),style:const TextStyle(fontSize: 90,fontWeight: FontWeight.w500,color: Colors.yellowAccent)),

            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: accentHexColor),
              ),
            ),
            const SizedBox(height: 10,),
            const LeftBar(barWidth: 40,),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 70,),
            const SizedBox(height:20,),
            const LeftBar(barWidth:40,),
            const SizedBox(height:20,),
            const RightBar(barWidth: 70,),
            const SizedBox(height: 50,),
            const RightBar(barWidth: 70,),
          ]),
        ));
  }
}
