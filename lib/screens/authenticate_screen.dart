import 'package:flutter/material.dart';
import 'package:gym_app/_common/mycolors.dart';
import 'package:gym_app/components/decoration_field_auth.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool wantEnter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blueDark,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.blueTopGradient,
                  MyColors.blueBottomGradient,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/logo.png", height: 128),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("E-mail"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                      ),
                      Visibility(
                        visible: !wantEnter,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirme Senha"),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text((wantEnter) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            wantEnter = !wantEnter;
                          });
                        },
                        child: Text((wantEnter)
                            ? "Ainda não tem uma conta? Cadastre-se!"
                            : "Já tem uma conta? Entre!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
