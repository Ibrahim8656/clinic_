// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class ReceptionScreen extends StatefulWidget {
//   @override
//   _ReceptionScreenState createState() => _ReceptionScreenState();
// }

// class _ReceptionScreenState extends State<ReceptionScreen> {
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _phoneController = TextEditingController();
//   Future<void> _savePatientData() async {
  

//     try {
//       // Save patient data to Firestore
//       await FirebaseFirestore.instance.collection('patients').add({
//         'name': _nameController.text,
//         'age': _ageController.text,
//         'address': _addressController.text,
//         'phone': _phoneController.text,
//         'createdAt': Timestamp.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patient data saved successfully")));
//       // Clear text fields and image
//       _nameController.clear();
//       _ageController.clear();
//       _addressController.clear();
//       _phoneController.clear();
     
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }

//   // Function to save appointment data
//   Future<void> _saveAppointmentData(String patientId) async {
//     try {
//       await FirebaseFirestore.instance.collection('appointments').add({
//         'patientId': patientId,
//         'appointmentTime': Timestamp.now(),
//         'createdAt': Timestamp.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Appointment saved successfully")));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Reception")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Text fields for patient details
          
//             ElevatedButton(
//                onPressed: () {
//     // Show dialog after the build phase
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showDialog(context);
//     });
//   },
//               //onPressed: _savePatientData,
//               child: Text('Add Patient'),
//             ),
//             SizedBox(height: 20),

//             // List of existing appointments
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('patients').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: Text("No appointments today"));
//                   }
//                   final patients = snapshot.data!.docs;
//                   return ListView.builder(
//                     itemCount: patients.length,
//                     itemBuilder: (context, index) {
//                       final patient = patients[index];
//                       return ListTile(
//                         title: Text(patient['name']),
//                         subtitle: Text(patient['age'].toString()),
//                         trailing: IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             _saveAppointmentData(patient.id); // Save the appointment for the patient
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Dialog Title'),
//           content: Column(children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Patient Name'),
//             ),
//             TextField(
//               controller: _ageController,
//               decoration: InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _addressController,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               keyboardType: TextInputType.phone,
//             ),
//             SizedBox(height: 20),

            
//             SizedBox(height: 20),

//             // Button to save patient data
//             ElevatedButton(
//               onPressed: _savePatientData,
//               child: Text('Add Patient'),
//             ),
//             SizedBox(height: 20),
//           ],),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 // إغلاق الـ Dialog عند الضغط على "OK"
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
