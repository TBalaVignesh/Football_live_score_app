import 'package:flutter/material.dart';
import 'package:football_app/models/football_model.dart';

class ComponentPage extends StatefulWidget {

  final FootballMatch match;
  const ComponentPage({super.key,required this.match});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        height: 250,
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.match.fixture.date.substring(0,10),
              style: TextStyle(
                fontSize: 18
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "${widget.match.fixture.status.elapsed}'",
                  ),
                  Text(
                    widget.match.fixture.status.long,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image(
                      image: NetworkImage(widget.match.home.logo)
                  ),
                ),
                Text(
                  widget.match.goal.home.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  ),
                ),
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Text(
                  widget.match.goal.away.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  child: Image(
                      image: NetworkImage(widget.match.away.logo),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.match.home.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.match.away.name,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
