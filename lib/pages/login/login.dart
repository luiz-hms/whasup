import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whasup/models/user_model.dart';
import 'package:whasup/pages/home_page.dart';
import 'package:whasup/pages/login/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  final GlobalKey<_LoginState> myWidgetKey = GlobalKey();
  String _mensagemErro = "";
  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (email.isNotEmpty) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "erro aqui";
        });
        UserModel userModel = UserModel();
        userModel.email = email;
        userModel.senha = senha;
        _logarUsuario(userModel);
      } else {
        setState(() {
          _mensagemErro = "preencha a senha";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "preencha o email";
      });
    }
  }

  _logarUsuario(UserModel userModel) {
    final contexts = myWidgetKey.currentContext;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(
            email: userModel.email, password: userModel.senha)
        .then((firebaseUser) {
      if (contexts != null && contexts.mounted) {
        Navigator.pushReplacement(
          contexts,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }).catchError((error) {
      setState(() {
        _mensagemErro = "falha ao autenticar";
      });
    });
  }

  Future<void> _verificaUsuarioLogado() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final contexts = myWidgetKey.currentContext;
    firebaseAuth.signOut();
    User? usuarioLogado = firebaseAuth.currentUser;
    if (usuarioLogado != null) {
      if (contexts != null && contexts.mounted) {
        Navigator.pushReplacement(
          contexts,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    _verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff075E54),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    'assets/imagens/logo.png',
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _validarCampos();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta ? cadastre-se",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.redAccent, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
