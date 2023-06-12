import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/internet_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context , state){
      if(state is InternetGainedState){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet Connected")));
      }


      if(state is InternetLostState){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet Lost")));
      }
        },
        builder: (context, state) {

          if(state is InternetGainedState){
            return Center(child: Text("Connective"));
          }
          else if(state is InternetLostState){
            return Center(child: Text("Lost"));
          }
          else{
            return Center(child: Text("loading"));
          }

        },
      ),
    );
  }
}
