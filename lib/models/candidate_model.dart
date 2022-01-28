class CandidateModel {
  CandidateModel({
    required this.id,
    required this.nombre,
    required this.numero,
    required this.resumen,
    required this.region,
    this.profesion,
    this.email,
    this.experiencia,
    this.paginaWeb,
    this.facebook,
    this.twitter,
    this.instagram,
    required this.foto,
  });

  int id;
  String nombre;
  int numero;
  String resumen;
  String region;
  String? profesion;
  String? email;
  String? experiencia;
  String? paginaWeb;
  String? facebook;
  String? twitter;
  String? instagram;
  String foto;

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
    id: json["id"],
    nombre: json["nombre"],
    numero: json["numero"],
    resumen: json["resumen"],
    region: json["region"],
    profesion: json["profesion"] ?? "",
    email: json["email"] ?? "",
    experiencia: json["experiencia"] ?? "",
    paginaWeb: json["pagina_web"] ?? "",
    facebook: json["facebook"] ?? "",
    twitter: json["twitter"] ?? "",
    instagram: json["instagram"] ?? "",
    foto: json["foto"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "numero": numero,
    "resumen": resumen,
    "region": region,
    "profesion": profesion,
    "email": email,
    "experiencia": experiencia,
    "pagina_web": paginaWeb,
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
    "foto": foto,
  };
}
