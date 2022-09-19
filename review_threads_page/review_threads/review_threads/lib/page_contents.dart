import 'package:flutter/material.dart';
import 'package:review_threads/comment.dart';
import 'package:review_threads/review.dart';

class PageContents extends StatelessWidget {
  const PageContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 100),
            Review(),
            SizedBox(height: 50,),
            Comment(),
            SizedBox(height: 100)
          ]),
        ),
      ),
    );
  }
}
