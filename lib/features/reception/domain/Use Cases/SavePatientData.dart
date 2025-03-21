import 'package:clinic_/features/reception/data/repository/repositiry.dart';

class SavePatientData {
  final ReceptionRepository receptionRepository;

  SavePatientData(this.receptionRepository);

  Future<void> call(String name, String age, String address, String phone) {
    return receptionRepository.savePatientData(name, age, address, phone);
  }
}