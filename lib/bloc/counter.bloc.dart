import 'package:bloc/bloc.dart';

abstract class CounterEvent{}

class IncrementEvent extends CounterEvent{}
class DecrementEvent extends CounterEvent{}

class CounterState{
  final int counter;
  CounterState({required this.counter});
}

class InitialState extends CounterState{
  InitialState():super(counter: -10);
}

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(InitialState()){
    on((IncrementEvent event,emit){
        emit(CounterState(counter: state.counter+1));
    });
    on((DecrementEvent event,emit){
      if(state.counter>0) {
        emit(CounterState(counter: state.counter-1));
      }
    });
  }
  
}
