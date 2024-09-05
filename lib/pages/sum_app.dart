import 'package:flutter/material.dart';

class SumApp extends StatefulWidget {
  const SumApp({super.key});
  @override
  State<SumApp> createState() => _SumAppState();
}

class _SumAppState extends State<SumApp> {
  final TextEditingController _firstTextController = TextEditingController();
  final TextEditingController _secondTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _result = 0;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Calculate"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildTextFormField(textController: _firstTextController , validator:_validationTextField ),
              SizedBox(
                height: 30,
              ),
              buildTextFormField(textController: _secondTextController ,validator:_validationTextField ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _OnTabAddButton();
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Center(
                            child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(2, 1))
                            ],
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _OnTabRemoveButton();
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Center(
                            child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(2, 1))
                            ],
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _OnTabMultipleButton();
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Center(
                            child: Text(
                          "*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(2, 1))
                            ],
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _OnTabDivideButton();
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Center(
                            child: Text(
                          "/",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(2, 1))
                            ],
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildText(),
            ],
          ),
        ),
      ),
    ));
  }

  TextFormField buildTextFormField({textController , validator}) {
    return TextFormField(
      validator: validator,
      controller: textController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "First number",
          labelStyle: TextStyle(color: Colors.black),
          hintText: "Enter Your Number",
          hintStyle: TextStyle(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(style: BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 1)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
    );
  }

  Text buildText() {
    return Text(
      "Result: ${_result.toStringAsFixed(2)}",
      style: TextStyle(fontSize: 25),
    );
  }

  void _OnTabAddButton() {
    if(_formKey.currentState!.validate()){
      double firstNumber = double.tryParse(_firstTextController.text) ?? 0;
      double secondNumber = double.tryParse(_secondTextController.text) ?? 0;
      _result = firstNumber + secondNumber;
      setState(() {});
    }

  }

  void _OnTabRemoveButton() {
    if(_formKey.currentState!.validate()){
      double firstNumber = double.tryParse(_firstTextController.text) ?? 0;
      double secondNumber = double.tryParse(_secondTextController.text) ?? 0;
      _result = firstNumber - secondNumber;
      setState(() {});
    }

  }

  void _OnTabMultipleButton() {
    if(_formKey.currentState!.validate()){
      double firstNumber = double.tryParse(_firstTextController.text) ?? 0;
      double secondNumber = double.tryParse(_secondTextController.text) ?? 0;
      _result = firstNumber * secondNumber;
      setState(() {});
    }


  }

  void _OnTabDivideButton() {
    if(_formKey.currentState!.validate()){
      double firstNumber = double.tryParse(_firstTextController.text) ?? 0;
      double secondNumber = double.tryParse(_secondTextController.text) ?? 0;
      _result = firstNumber / secondNumber;
      setState(() {});
    }


  }

  String? _validationTextField(value) {
    if (value == null || value.isEmpty) {
      return "Enter a Value";
    }
    if (value == null || value.isEmpty) {
      return "Enter a Value";
    }
    return null;
  }
}
