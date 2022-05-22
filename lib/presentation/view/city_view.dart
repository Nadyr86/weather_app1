import 'package:flutter/material.dart';
import 'package:weather_app1/presentation/widgets/container_with_bg_image.dart';

class CityView extends StatelessWidget {
  CityView({Key key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Find by city'.toUpperCase()),
        centerTitle: true,
      ),
      body: ContainerWithBgImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textController,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.orangeAccent, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Write your city',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                  style: outlineButtonStyle,
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context, _textController.text);
                    }
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                    child: Text(
                      'Show weather',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
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
