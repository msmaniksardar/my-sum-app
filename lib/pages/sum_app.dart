import 'package:flutter/material.dart';


class SumApp extends StatefulWidget {
  const SumApp({super.key});
  @override
  State<SumApp> createState()=> _SumAppState();
}

class _SumAppState extends State<SumApp>{
  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox( width: 10 , child: Container( decoration: BoxDecoration(
            color: Colors.red
          ),),)
        ],
      ),
    ));
  }
}