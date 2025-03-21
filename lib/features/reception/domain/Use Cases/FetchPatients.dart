
import 'package:clinic_/features/reception/data/repository/repositiry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchPatients {
  final ReceptionRepository receptionRepository;

  FetchPatients(this.receptionRepository);

  Future<List<DocumentSnapshot>> call() {
    return receptionRepository.fetchPatients();
  }
}