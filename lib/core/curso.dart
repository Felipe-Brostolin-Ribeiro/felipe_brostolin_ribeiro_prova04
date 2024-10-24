class Curso {
  final int id;
  final String nomeCurso;
  final String area;

  Curso({required this.id, required this.nomeCurso, required this.area});

  factory Curso.fromJson(Map<String, Object> json) {
    return Curso(
      id: json['id'] as int,
      nomeCurso: json['nome_curso'] as String,
      area: json['area'] as String,
    );
  }
}
