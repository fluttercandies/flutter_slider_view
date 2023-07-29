// Copyright 2018 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:slider_view/slider_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'slider_view example',
      home: DemoPage(title: 'slider_view example'),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late List<String> characters = <String>[String.fromCharCode(_counter)];
  int _counter = 65;

  void _incrementCounter() {
    setState(() {
      ++_counter;
      characters.add(String.fromCharCode(_counter));
    });
  }

  void _removeCharacter() {
    if (_counter == 65) {
      return;
    }

    setState(() {
      --_counter;
      characters.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SliderView(
              config: SliderViewConfig<String>(
                aspectRatio: 16 / 9,
                models: characters,
                viewportFraction: 0.9, // Set to 1.0 to occupy the full viewport
                itemBuilder: (String e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(e,
                        style: Theme.of(context).textTheme.headlineLarge),
                  ),
                ),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text(
                    'Increment Counter',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _removeCharacter,
                  child: Text(
                    'Remove Character',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
