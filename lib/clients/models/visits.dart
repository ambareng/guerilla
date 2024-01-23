import 'package:equatable/equatable.dart';

class Visit extends Equatable {
  final int id;
  final String? notes;
  final String? prescriptions;
  final String? diagnosis;
  final String visitDate;

  const Visit(
      {required this.id,
      this.notes,
      this.prescriptions,
      this.diagnosis,
      required this.visitDate});

  @override
  List<Object?> get props => [id, notes, prescriptions, diagnosis, visitDate];

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      id: json['id'],
      notes: json['notes'],
      prescriptions: json['prescriptions'],
      diagnosis: json['diagnosis'],
      visitDate: json['visit_date'],
    );
  }
}
