import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'dao.dart';
/// stream() would init InMemory.
/// when you add, subject would be null.
/// ** init with [stream()] is after you use.
class InMemory<T> {
  T seedValue;
  BehaviorSubject<T> _subject;

  InMemory({this.seedValue});

  T get value => _subject?.value;

  Stream<T> stream() {
    if (_subject == null) {
      _subject = BehaviorSubject.seeded(
        seedValue,
        onCancel: () {
          _subject.close();
          _subject = null;
        },
      );
    }

    return _subject.distinct();
  }

  void add(T value) {
    if (_subject == null) {
      return;
    }

    _subject.add(value);
  }
/// [init] would discard in future
  void init(T value) {
    stream();
    add(value);
  }
}


class Dao2 {

  static Dao2 instance;
  Dao2._();
  static Dao2 getInstance() {
    if (instance == null) {
      instance = Dao2._();

      Future.delayed(const Duration(seconds:5),(){
        instance.a.init(A(2));
      });
    }
    
    return instance;
  }
  // BehaviorSubject<int> obj;
  final a = InMemory<A>(seedValue: null);

  void dispose(){
    // obj.close();
    // a.close();
  }
}
