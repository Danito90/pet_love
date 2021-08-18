import 'dart:convert';

Mascotas mascotasFromJson(String str) => Mascotas.fromJson(json.decode(str));

String mascotasToJson(Mascotas data) => json.encode(data.toJson());

class Mascotas {
  Mascotas({
    this.id = "",
    this.tipo = "",
    this.nombre = "",
    this.genero = "",
    this.tamao = "",
    this.edad = "",
    this.color1 = "0x00000000",
    this.color2 = "0x00000000",
    this.color3 = "0x00000000",
    this.collar = false,
    this.profile = "",
    this.imagen001 = "",
    this.imagen002 = "",
    this.imagen003 = "",
    this.imagen004 = "",
    this.imagen005 = "",
    this.imagen006 = "",
    this.imagen007 = "",
    this.fecha = "",
    this.telefono = "",
    this.direccion = "",
    this.adopcion = false,
    this.buscado = false,
    this.encontrado = false,
    this.reencuentro = false,
    this.lovi = 0,
    this.triste = 0,
    this.raza = "",
    this.mail = "",
    this.whatsapp = "",
    this.comentarios = "",
    this.extra1 = "",
    this.extra2 = "",
    this.extra3 = "",
    this.extra4 = "",
    this.extra5 = "",
  });

  String id;
  String tipo;
  String nombre;
  String genero;
  String tamao;
  String edad;
  String color1;
  String color2;
  String color3;
  bool collar;
  String caracteristica;
  String profile;
  String imagen001;
  String imagen002;
  String imagen003;
  String imagen004;
  String imagen005;
  String imagen006;
  String imagen007;
  String fecha;
  String telefono;
  String direccion;
  bool adopcion; //si se adopta o no
  bool buscado; //si se busca o no
  bool encontrado; //si lo encontraron o no
  bool reencuentro; //si se reencontro con el dueño
  int lovi; // suma personas q lo vieron
  int triste; //suma persona q no le gusta q se perdio
  String raza;
  String mail;
  String whatsapp;
  String comentarios;
  String extra1;
  String extra2;
  String extra3;
  String extra4;
  String extra5;

  factory Mascotas.fromJson(Map<String, dynamic> json) => Mascotas(
        id: json["id"],
        tipo: json["tipo"],
        nombre: json["nombre"],
        genero: json["genero"],
        tamao: json["tamao"],
        edad: json["edad"],
        color1: json["color1"],
        color2: json["color2"],
        color3: json["color3"],
        collar: json["collar"],
        profile: json["profile"],
        imagen001: json["imagen001"],
        imagen002: json["imagen002"],
        imagen003: json["imagen003"],
        imagen004: json["imagen004"],
        imagen005: json["imagen005"],
        imagen006: json["imagen006"],
        imagen007: json["imagen007"],
        fecha: json["fecha"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        adopcion: json["adopcion"],
        buscado: json["buscado"],
        encontrado: json["encontrado"],
        reencuentro: json["reencuentro"],
        lovi: json["lovi"],
        triste: json["triste"],
        raza: json["raza"],
        mail: json["mail"],
        whatsapp: json["whatsapp"],
        comentarios: json["comentarios"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        extra3: json["extra3"],
        extra4: json["extra4"],
        extra5: json["extra5"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "tipo": tipo,
        "nombre": nombre,
        "genero": genero,
        "tamao": tamao,
        "edad": edad,
        "color1": color1,
        "color2": color2,
        "color3": color3,
        "collar": collar,
        "caracteristica": caracteristica,
        "profile": profile,
        "imagen001": imagen001,
        "imagen002": imagen002,
        "imagen003": imagen003,
        "imagen004": imagen004,
        "imagen005": imagen005,
        "imagen006": imagen006,
        "imagen007": imagen007,
        "fecha": fecha,
        "telefono": telefono,
        "direccion": direccion,
        "adopcion": adopcion,
        "buscado": buscado,
        "encontrado": encontrado,
        "reencuentro": reencuentro,
        "lovi": lovi,
        "triste": triste,
        "raza": raza,
        "mail": mail,
        "whatsapp": whatsapp,
        "comentarios": comentarios,
        "extra1": extra1,
        "extra2": extra2,
        "extra3": extra3,
        "extra4": extra4,
        "extra5": extra5,
      };
}
