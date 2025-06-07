import 'package:flutter/material.dart';

import '../../models/covnersa_model.dart';

class TabConversas extends StatefulWidget {
  const TabConversas({super.key});

  @override
  State<TabConversas> createState() => _TabConversasState();
}

class _TabConversasState extends State<TabConversas> {
  List<CovnersaModel> listConversas = [
    //CovnersaModel("luiz", "mensagem",""),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 40,
      itemBuilder: (context, index) {},
    );
  }
}
