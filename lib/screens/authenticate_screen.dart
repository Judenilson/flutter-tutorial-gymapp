import 'package:flutter/material.dart';
import 'package:gym_app/_common/mycolors.dart';
import 'package:gym_app/_common/mysnackbar.dart';
import 'package:gym_app/components/decoration_field_auth.dart';
import 'package:gym_app/services/authenticating_service.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool wantEnter = true;
  final _formkey = GlobalKey<FormState>();
  String? _pass;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  AuthenticatingService _authService = AuthenticatingService();

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
              key: _formkey,
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
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "O e-mail não é válido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _passController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          _pass = value;
                          if (value == null) {
                            return "A senha não pode ser vazia";
                          }
                          if (value.length < 6) {
                            return "A senha deve ter no mínimo 6 caracteres";
                          }
                          return null;
                        },
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
                              validator: (String? value) {
                                if (value == null) {
                                  return "A confirmação de senha não pode ser vazia";
                                }
                                if (value.length < 6) {
                                  return "A confirmação de senha deve ter no mínimo 6 caracteres";
                                }
                                if (_pass != value) {
                                  return "As senhas não conferem";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          formClickButton();
                        },
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

  formClickButton() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passController.text;

    if (_formkey.currentState!.validate()) {
      if (wantEnter) {
        debugPrint("Entrada Validada");
        _authService
            .logUsers(email: email, password: password)
            .then((String? erro) {
          if (erro != null) {
            showSnackBar(context: context, msg: erro);
          }
        });
      } else {
        debugPrint("Cadastro Validado");
        debugPrint(
            "${_emailController.text}, ${_passController.text}, ${_nameController.text},");
        _authService
            .registerUser(name: name, password: password, email: email)
            .then(
          (String? erro) {
            if (erro != null) {
              showSnackBar(
                context: context,
                msg: erro,
              );
            }
          },
        );
      }
    } else {
      debugPrint("Form inválido");
    }
  }
}
