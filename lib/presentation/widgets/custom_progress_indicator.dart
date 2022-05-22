import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({this.isLineaner = true, Key key}) : super(key: key);

  final bool isLineaner;

  Widget _buildContent() {
    if(isLineaner) {
      return const LinearProgressIndicator(
        backgroundColor: Colors.white,
      color: Colors.amberAccent,
    );
    }else{
      return const CircularProgressIndicator(
        backgroundColor: Colors.white,
      color: Colors.amberAccent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(
    );
  }
}
