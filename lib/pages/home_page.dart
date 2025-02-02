import 'package:flutter/material.dart';
import 'package:football_app/pages/no_match.dart';
import 'package:football_app/pages/widgets_page.dart';
import 'package:football_app/services/football_service.dart';
import '../models/football_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<FootballMatch>> _futureMatches;

  @override
  void initState() {
    super.initState();
    _futureMatches = FootballApi().getMatch();
  }

  Future<void> _refreshData() async {
    // Refresh the data by re-calling the API
    setState(() {
      _futureMatches = FootballApi().getMatch();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Football Live Score',
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w900
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<List<FootballMatch>>(
          future: _futureMatches,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while waiting for data.
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle errors in API call.
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              // Handle non-empty data.
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final match = snapshot.data![index];
                  return ComponentPage(match: match,);
                },
              );
            } else {
              return NoMatchFound();
            }
          },
        ),
      ),

    );
  }
}
