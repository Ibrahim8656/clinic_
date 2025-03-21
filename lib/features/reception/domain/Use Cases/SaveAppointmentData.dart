import 'package:clinic_/features/reception/data/repository/repositiry.dart';

class SaveAppointmentData {
  final ReceptionRepository receptionRepository;

  SaveAppointmentData(this.receptionRepository);

  Future<void> call(String patientId) {
    return receptionRepository.saveAppointmentData(patientId);
  }
}