import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "Your BMI Result";
  var bgColor = Colors.cyan.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(result,
              textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: result == "Your BMI Result" ?  34 :
                          result == "All Fild Required" ?  34 : 20
              ,
              
              fontWeight: FontWeight.w700,
              color:result == "Your BMI Result" ? Colors.deepPurple :
                          result == "All Fild Required" ? Colors.red : Colors.black
              
              ),),
              SizedBox(height: 55,),
              TextField(
                 onChanged: (value) {
                  setState(() {
                    result = "Weight Updated :$value";
                    
                  });
                },
                controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Put Your Weight in KG"),
                  prefixIcon: Icon(Icons.monitor_weight),
                

                ),
              ),
              SizedBox(height: 20,),
              TextField(
                onChanged: (value) {
                  setState(() {
                    result = "Hight(ft) Updated :$value";
                    
                  });
                },
                controller: ftController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Put Your Hight in Feet"),
                  prefixIcon: Icon(Icons.height)
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                 onChanged: (value) {
                  setState(() {
                    result = "Hight(in) Updated :$value";
                    
                  });
                },
                controller: inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Put Your Hight in Inch"),
                  prefixIcon: Icon(Icons.height)
                ),
              ),
              SizedBox(height: 35,),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,),
                onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if(wt != "" && ft != "" && inch != ""){
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iinch = int.parse(inch);
                 var totalInch = (ift * 12) + iinch;
                 var totalCm = totalInch * 2.54;
                 var totalM = totalCm / 100;
                 var bmi = iwt / (totalM * totalM);
                 var msg = "";
                 if(bmi > 25){
                   msg = "You'er Over Weight";
                   bgColor = Colors.orange.shade200;
                 }else if(bmi < 18){
                  msg = "You'er Under Weight";
                   bgColor = Colors.red.shade200;

                 }else{
                  msg = "You'er Fit";
                   bgColor = Colors.green.shade200;
                 }
                 setState(() {
                   result = "$msg\nYour BMI Status:\n ${bmi.toStringAsFixed(2)}";
                 });

                }else{
                 setState(() {
                    result = "All Fild Required";
                 });
                }
               }, child: Text("Calculate")),
              

          ],
        ),
      ),
    );
  }
}