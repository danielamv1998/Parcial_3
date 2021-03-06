class Cama {
  int? idCama;
  int? estado; //0 libre, 1 ocupada
  int? idPiso;
  String? idPaciente;
  String? nombre;
  String? fechaIngreso;
  String? diagnostico;

  Cama({
    this.idCama,
    this.estado,
    this.idPiso,
    this.idPaciente,
    this.nombre,
    this.fechaIngreso,
    this.diagnostico,
  });

  Cama.newCama();

  factory Cama.fromJson(Map<String, dynamic> json) => Cama(
        idCama: json["idCama"],
        estado: json["estado"],
        idPiso: json["idPiso"],
        idPaciente: json["idPaciente"],
        nombre: json["nombre"],
        fechaIngreso: json["fechaHoraIngreso"],
        diagnostico: json["diagnostico"],
      );
}
