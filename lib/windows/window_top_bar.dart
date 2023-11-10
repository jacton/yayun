import 'package:flutter/material.dart';
import 'windows_adapter.dart';
import 'window_buttons.dart';

class WindowsTopBar extends StatefulWidget {
  const WindowsTopBar({Key? key}) : super(key: key);
  @override
  State<WindowsTopBar> createState() => _WindowsTopBarState();
}

class _WindowsTopBarState extends State<WindowsTopBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragToMoveAreaNoDouble(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        // color: Colors.white,
        child: Row(
          children: [
            Text(
              "雅韵",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Container(
              height: 30,
              width: 400,
            ),
            const SizedBox(
              width: 20,
            ),
            WindowButtons(),
          ],
        ),
      ),
    );
  }
}
