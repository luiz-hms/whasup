import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whasup/pages/tabs/tabContatos.dart';
import 'package:whasup/pages/tabs/tabConversas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _emailUsuario = "";
  Future _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = auth.currentUser;
    setState(() {
      _emailUsuario = usuarioLogado?.email;
    });
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text('whasupp'),
        bottom: TabBar(
            indicatorWeight: 4,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "CONVERSAS",
              ),
              Tab(
                text: "CONTATOS",
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TabConversas(),
          TabContatos(),
        ],
      ),
    );
  }
}
