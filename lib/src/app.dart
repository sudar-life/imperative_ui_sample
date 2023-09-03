import 'package:declarative_ui_sample_with_flutter/src/pages/declarative_ui.dart';
import 'package:declarative_ui_sample_with_flutter/src/pages/imperative_ui.dart';
import 'package:declarative_ui_sample_with_flutter/src/pages/imperative_ui_with_flutter_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('선언형 UI / 명령형 UI')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeclarativeUi()),
                  );
                },
                child: const Text('명령형 UI 예')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImperativeUi()),
                  );
                },
                child: const Text('선언형 UI 예')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ImperativeUiWithFlutterWidget()),
                  );
                },
                child: const Text('선언형 UI 플러터 위젯')),
          ],
        ),
      ),
    );
  }
}
