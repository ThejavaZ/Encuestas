class Student {
  String? name;
  String? phone;
  String? email;
  String? record;
  int? age;
  String? shift;
  String? degree;
  String? specialization;
  double? prom;
  String? section;

  Student({
    this.name,
    this.phone,
    this.email,
    this.record,
    this.age,
    this.shift,
    this.degree,
    this.specialization,
    this.prom,
    this.section,
  });

  // Método para actualizar los campos del estudiante
  void update({
    String? name,
    String? phone,
    String? email,
    String? record,
    int? age,
    String? shift,
    String? degree,
    String? specialization,
    double? prom,
    String? section,
  }) {
    this.name = name ?? this.name;
    this.phone = phone ?? this.phone;
    this.email = email ?? this.email;
    this.record = record ?? this.record;
    this.age = age ?? this.age;
    this.shift = shift ?? this.shift;
    this.degree = degree ?? this.degree;
    this.specialization = specialization ?? this.specialization;
    this.prom = prom ?? this.prom;
    this.section = section ?? this.section;
  }

  @override
  String toString() {
    return '''
    Student(
      name: $name, 
      phone: $phone, 
      email: $email, 
      record: $record, 
      age: $age,
      shift: $shift,
      degree: $degree,
      specialization: $specialization,
      prom: $prom,
      section: $section
    )
    ''';
  }
}
