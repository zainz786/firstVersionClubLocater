import 'package:flutter/material.dart';
import 'package:test2/data/club_data.dart';
import 'package:test2/data/club_model.dart';

class ClubDetails extends StatelessWidget {
  final ClubData clubDetail;
  ClubDetails({Key? key, required this.clubDetail}) : super(key: key);
  List<ClubModel> details = [];

  void check() {
    print(clubDetail.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asd'),
      ),
      body: Text('Some Details'),
    );
  }
}
