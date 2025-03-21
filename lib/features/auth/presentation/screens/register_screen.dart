// import 'package:clinic_/core/errors/widgets/custom_textfild.dart';
// import 'package:clinic_/core/errors/widgets/show_snack_bar.dart';
// import 'package:clinic_/features/auth/data/repository/repository.dart';
// import 'package:clinic_/features/auth/domain/usecases/login_usecase.dart';
// import 'package:clinic_/features/auth/domain/usecases/register_usecase.dart';
// import 'package:clinic_/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:clinic_/features/auth/presentation/screens/loginscreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class RegisterPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: BlocProvider(
//         create: (context) => AuthCubit(
//           RegisterUserUseCase(AuthRepositoryImpl(FirebaseAuth.instance)),LoginUsecase(AuthRepositoryImpl(FirebaseAuth.instance))
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               custom_text_fild( Controller: _emailController, labelText: 'email', prefixIcon:Icons.email, validatemessage:  'Plase enter email',)
//              ,
//               SizedBox(height: 20),
//              custom_text_fild(Controller: _passwordController, labelText: 'passowrd', prefixIcon: Icons.lock, validatemessage:  'Plase enter Passowrd',),
//               SizedBox(height: 20),
//               BlocConsumer<AuthCubit, AuthState>(
//                 listener: (context, state) {
//                   if (state is AuthSuccess) {
//                     showSnackBar(context,'Registration Successful',Colors.green);
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
//                   } else if (state is AuthFailure) {
//                     // Show error message
//                     showSnackBar(context,state.message,Colors.red);
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is AuthLoading) {
//                     return CircularProgressIndicator();
//                   }
//                   return ElevatedButton(
//                     onPressed: () {
//                       final email = _emailController.text;
//                       final password = _passwordController.text;
//                       AuthCubit.get(context).Register(email, password);
//                     },
//                     child: Text('Register'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


