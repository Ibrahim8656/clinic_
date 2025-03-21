import 'package:clinic_/features/reception/data/repository/repositiry.dart';
import 'package:clinic_/features/reception/presentation/cubit/reception_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  final ReceptionRepository receptionRepository;

  ReceptionCubit(this.receptionRepository) : super(ReceptionInitial());
  static ReceptionCubit get(context) => BlocProvider.of(context);

  Future<void> savePatientData(
    String name,
    String age,
    String address,
    String phone,
  ) async {
    try {
      emit(ReceptionLoading());
      await receptionRepository.savePatientData(name, age, address, phone);
      emit(ReceptionSuccess("Patient data saved successfully"));
    } catch (e) {
      emit(ReceptionError("Error: $e"));
    }
  }

  Future<void> saveAppointmentData(String patientId) async {
    try {
      await receptionRepository.saveAppointmentData(patientId);
      emit(ReceptionSuccess("Appointment saved successfully"));
    } catch (e) {
      emit(ReceptionError("Error: $e"));
    }
  }

  Future<void> fetchPatients() async {
    try {
      emit(ReceptionLoading());
      final patients = await receptionRepository.fetchPatients();
      emit(ReceptionLoaded(patients));
    } catch (e) {
      emit(ReceptionError("Error: $e"));
    }
  }
}

