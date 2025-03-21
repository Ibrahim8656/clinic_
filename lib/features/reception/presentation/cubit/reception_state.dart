import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ReceptionState {}

class ReceptionInitial extends ReceptionState {}

class ReceptionLoading extends ReceptionState {}

class ReceptionSuccess extends ReceptionState {
  final String message;

  ReceptionSuccess(this.message);
}

class ReceptionError extends ReceptionState {
  final String errorMessage;

  ReceptionError(this.errorMessage);
}

class ReceptionLoaded extends ReceptionState {
  final List<DocumentSnapshot> patients;

  ReceptionLoaded(this.patients);
}
