import 'package:rxdart/rxdart.dart';

class CounterBloc {
  //Variables
  int initialCount = 0;
  BehaviorSubject<int> _subjectCounter;

  //Constructor
  CounterBloc({this.initialCount}) {
    _subjectCounter = BehaviorSubject<int>.seeded(this.initialCount);
  }

  //Output
  Observable get counterObservable => _subjectCounter.stream;

  //Input increment method
  void increment() {
    initialCount++;
    _subjectCounter.sink.add(initialCount);
  }

  //Input decrement method
  void decrement() {
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void dispose() {
    _subjectCounter.close();
  }
}
