import 'package:rxdart/subjects.dart';

class Dao {

  static Dao instance;
  Dao._();
  static Dao getInstance() {
    if (instance == null) {
      instance = Dao._();
      instance.obj = BehaviorSubject<int>.seeded(null,
      onCancel: () {
          instance.obj.close();
          instance.obj = null;
        }
      );
      instance.obj.add(1);

      instance.a = BehaviorSubject<A>.seeded(null);
      Future.delayed(const Duration(seconds:5),(){
        instance.a.add(A(2));
      });
    }
    
    return instance;
  }
  BehaviorSubject<int> obj;
  BehaviorSubject<A> a;

  void dispose(){
    obj.close();
    a.close();
  }
}

class A{
  final int value;

  A(this.value);
}