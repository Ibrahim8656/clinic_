import 'package:clinic_/core/errors/widgets/custom_textfild.dart';
import 'package:clinic_/core/errors/widgets/show_snack_bar.dart';
import 'package:clinic_/features/auth/data/repository/repository.dart';
import 'package:clinic_/features/auth/domain/usecases/login_usecase.dart';
import 'package:clinic_/features/auth/domain/usecases/register_usecase.dart';
import 'package:clinic_/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:clinic_/features/reception/presentation/screens/ReceptionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key, required this.isadoctor});
  final bool isadoctor;
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocProvider(
      create:
          (context) => AuthCubit(
            RegisterUserUseCase(AuthRepositoryImpl(FirebaseAuth.instance)),
            LoginUsecase(AuthRepositoryImpl(FirebaseAuth.instance)),
          ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
        if(state is LoginSuccess){
          showSnackBar(context, "Login Success", Colors.green);
         if(isadoctor){

         }else{
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ReceptionScreen()));
         }
        }
        if(state is LoginFailure){
           showSnackBar(context, state.message, Colors.red);
        }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Profile Icon
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue.shade500,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Title
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            SizedBox(height: 30),
                            custom_text_fild(
                              Controller: _emailController,
                              labelText: "email",
                              prefixIcon: Icons.person,
                              validatemessage: 'Plase enter email',
                            ),
                            SizedBox(height: 20),
                            custom_text_fild(
                              Controller: _passwordController,
                              labelText: "Passowrd",
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              validatemessage: 'Plase enter Passowrd',
                            ),
                            SizedBox(height: 30,),

                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthCubit.get(context).Login(
                                    email: _emailController.text,
                                    passowrd: _passwordController.text,
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
