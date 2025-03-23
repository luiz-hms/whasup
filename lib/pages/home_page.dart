import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              text: "Conversar",
            ),
            Tab(
              text: "Contatos",
            ),
          ],
        ),
        title: const Text('whasupp'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("Conversar"),
          Text("Contatos"),
        ],
      ),
    );
  }
}
