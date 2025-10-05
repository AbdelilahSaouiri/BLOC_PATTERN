import 'package:first_app/bloc/counter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CounterBloc())
    ], child: RootView()
    );
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {

   const CounterPage({super.key});
   final int _counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter Page', style: TextStyle(color: Theme
              .of(context)
              .cardColor)),
          backgroundColor: Theme
              .of(context)
              .primaryColor,
        ),
        body: BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Counter Value : ${state.counter}", style: TextStyle(fontSize: 28),)
                ],
              ),
            );
          }
        ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(IncrementEvent());
          },
          child: Icon(Icons.add),
        ),
          SizedBox(width: 16,),
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(DecrementEvent());
          },
          child: Icon(Icons.remove),
          )
      ],
    ),
    );
  }
}


