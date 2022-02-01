
class BasesModel {

  int id;
  double latitud;
  double longitud;
  String base;
  String region;
  String distrito;
  String direccion;
  String imagen;

  BasesModel({
    required this.id,
    required this.latitud,
    required this.longitud,
    required this.base,
    required this.region,
    required this.distrito,
    required this.direccion,
    required this.imagen,
  });

  factory BasesModel.fromJson(Map<String, dynamic> json) => BasesModel(
    id: json["id"],
    latitud: json["latitud"].toDouble(),
    longitud: json["longitud"].toDouble(),
    base: json["base"],
    region: json["region"],
    distrito: json["distrito"],
    direccion: json["direccion"],
    imagen: json["imagen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitud": latitud,
    "longitud": longitud,
    "base": base,
    "region": region,
    "distrito": distrito,
    "direccion": direccion,
    "imagen": imagen,
  };
}
