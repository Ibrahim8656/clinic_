import 'package:clinic_/features/reception/presentation/cubit/reception_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_/features/reception/presentation/cubit/reception_cubit.dart';
import 'package:clinic_/features/reception/data/repository/repositiry.dart';

class ReceptionScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReceptionCubit, ReceptionState>(
      listener: (context, state) {
        if (state is ReceptionError) {
          // Handle error state
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is ReceptionSuccess) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ReceptionLoading) {
          return Scaffold(
            appBar: AppBar(title: Text("Reception")),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text("Reception")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show the dialog to add a new patient
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BlocProvider.value(
                          value: BlocProvider.of<ReceptionCubit>(context), // Provide the Cubit to the dialog context
                          child: AlertDialog(
                            title: Text('Add Patient'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Patient Name',
                                  ),
                                ),
                                TextField(
                                  controller: _ageController,
                                  decoration: InputDecoration(labelText: 'Age'),
                                  keyboardType: TextInputType.number,
                                ),
                                TextField(
                                  controller: _addressController,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                  ),
                                ),
                                TextField(
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // Save patient data via Cubit
                                    BlocProvider.of<ReceptionCubit>(context).savePatientData(
                                      _nameController.text,
                                      _ageController.text,
                                      _addressController.text,
                                      _phoneController.text,
                                    );
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('Save Patient'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text('Add Patient'),
                ),
                SizedBox(height: 20),
                // Use BlocBuilder to listen to the state and display patient data
                BlocBuilder<ReceptionCubit, ReceptionState>(
                  builder: (context, state) {
                    if (state is ReceptionLoaded) {
                      final patients = state.patients;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: patients.length,
                          itemBuilder: (context, index) {
                            final patient = patients[index];
                            return ListTile(
                              title: Text(patient['name']),
                              subtitle: Text(patient['age'].toString()),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Save the appointment for the patient
                                  BlocProvider.of<ReceptionCubit>(context).saveAppointmentData(patient.id);
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: Text("No patients"));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
