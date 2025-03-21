import 'package:clinic_/features/auth/presentation/screens/HomeScreen.dart';
import 'package:clinic_/features/reception/presentation/screens/ReceptionScreen.dart';
import 'package:clinic_/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_/features/reception/data/repository/repositiry.dart';
import 'package:clinic_/features/reception/presentation/cubit/reception_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app with the ReceptionCubit available throughout the widget tree
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReceptionCubit(
        ReceptionRepository(
          ReceptionDataSource(),
        ),
      )..fetchPatients(), // Fetch patients when the app starts
      child: MaterialApp(
        title: 'Clinic App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ReceptionScreen(),
      ),
    );
  }
}
