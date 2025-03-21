import 'package:cloud_firestore/cloud_firestore.dart';

class ReceptionRepository {
  final ReceptionDataSource receptionDataSource;

  ReceptionRepository(this.receptionDataSource);

  Future<void> savePatientData(String name, String age, String address, String phone) {
    return receptionDataSource.savePatientData(name, age, address, phone);
  }

  Future<void> saveAppointmentData(String patientId) {
    return receptionDataSource.saveAppointmentData(patientId);
  }

  Future<List<DocumentSnapshot>> fetchPatients() {
    return receptionDataSource.fetchPatients();
  }
}

class ReceptionDataSource {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> savePatientData(String name, String age, String address, String phone) async {
    await firebaseFirestore.collection('patients').add({
      'name': name,
      'age': age,
      'address': address,
      'phone': phone,
      'createdAt': Timestamp.now(),
    });
  }

  Future<void> saveAppointmentData(String patientId) async {
    await firebaseFirestore.collection('appointments').add({
      'patientId': patientId,
      'appointmentTime': Timestamp.now(),
      'createdAt': Timestamp.now(),
    });
  }

  Future<List<DocumentSnapshot>> fetchPatients() async {
    final snapshot = await firebaseFirestore.collection('patients').get();
    return snapshot.docs;
  }
}
