import 'package:flutter/material.dart';
import 'package:vanguard_frontend/serialized/competition.dart';

class CompetitionSelectScreen extends StatefulWidget {
  const CompetitionSelectScreen({Key? key, required this.competitions})
      : super(key: key);

  @override
  State<CompetitionSelectScreen> createState() =>
      _CompetitionSelectScreenState();

  final List<Competition> competitions;
}

class _CompetitionSelectScreenState extends State<CompetitionSelectScreen> {
  late Competition _selectedCompetition = widget.competitions.first;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                "Vanguard",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: _selectedCompetition,
                  items: widget.competitions.map<DropdownMenuItem<Competition>>(
                    (value) {
                      return DropdownMenuItem<Competition>(
                        value: value,
                        child: Text(
                          '${value.name} - ${DateTime.parse('${value.startdate}').year}',
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _selectedCompetition = newValue as Competition;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Select'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}