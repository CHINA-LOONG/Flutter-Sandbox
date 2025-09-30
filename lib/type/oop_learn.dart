class Person {
  String name;
  int age;

  /// 标准构造函数
  Person(this.name, this.age);

  @override
  String toString() {
    return "name:$name,age:$age";
  }
}

class Student extends Person with StudyMixin {
  String _school;
  String city;

  Student(String name, int age, this._school, {this.city = '北京'})
    : super(name, age);
}

mixin StudyMixin {
  String className = 'flutter';
  void study() {
    print('$className is studying');
  }
}
