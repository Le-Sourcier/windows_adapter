// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:windows_adapter/windows_adapter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future _getWindowSize() async {
    var size = await WindowsAdapter.getWindowSize();
    setState(() {
      _windowSize = '${size.width} x ${size.height}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('windows_adapter example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_windowSize\n'),
              ElevatedButton(
                onPressed: _getWindowSize,
                child: const Text("getWindowSize"),
              ),
              ElevatedButton(
                child: const Text("setMinWindowSize(300,400)"),
                onPressed: () async {
                  await WindowsAdapter.setMinWindowSize(const Size(300, 400));
                },
              ),
              ElevatedButton(
                child: const Text("setMaxWindowSize(800,800)"),
                onPressed: () async {
                  await WindowsAdapter.setMaxWindowSize(const Size(800, 800));
                },
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text("Smaller"),
                    onPressed: () async {
                      var size = await WindowsAdapter.getWindowSize();
                      await WindowsAdapter.setWindowSize(
                          Size(size.width - 50, size.height - 50));
                      await _getWindowSize();
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Larger"),
                    onPressed: () async {
                      var size = await WindowsAdapter.getWindowSize();
                      await WindowsAdapter.setWindowSize(
                          Size(size.width + 50, size.height + 50));
                      await _getWindowSize();
                    },
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text("toggleFullScreen"),
                    onPressed: () async {
                      await WindowsAdapter.resetMaxWindowSize();
                      await WindowsAdapter.toggleFullScreen();
                    },
                  ),
                  Builder(builder: (ctx) {
                    return ElevatedButton(
                      child: const Text("getFullScreen"),
                      onPressed: () async {
                        final isFullScreen =
                            await WindowsAdapter.getFullScreen();
                        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                            content: Text('getFullScreen = $isFullScreen'),
                            duration: const Duration(seconds: 1)));
                      },
                    );
                  }),
                  ElevatedButton(
                    child: const Text("setFullScreen(true)"),
                    onPressed: () async {
                      await WindowsAdapter.setFullScreen(true);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("setFullScreen(false)"),
                    onPressed: () async {
                      await WindowsAdapter.setFullScreen(false);
                    },
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text("toggleBorders"),
                    onPressed: () async {
                      await WindowsAdapter.toggleBorders();
                    },
                  ),
                  Builder(builder: (ctx) {
                    return ElevatedButton(
                      child: const Text("setBorders(true)"),
                      onPressed: () async {
                        await WindowsAdapter.setBorders(true);
                      },
                    );
                  }),
                  ElevatedButton(
                    child: const Text("setBorders(false)"),
                    onPressed: () async {
                      await WindowsAdapter.setBorders(false);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("hasBorders"),
                    onPressed: () async {
                      debugPrint(
                          'hasBorders: ${await WindowsAdapter.hasBorders ? 'true' : 'false'}');
                    },
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text("focus"),
                    onPressed: () {
                      Timer(const Duration(seconds: 3), () async {
                        debugPrint('focus!!!');
                        await WindowsAdapter.focus();
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text("stayOnTop(true)"),
                    onPressed: () async {
                      debugPrint('stayOnTop(true)');
                      await WindowsAdapter.stayOnTop(true);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("stayOnTop(false)"),
                    onPressed: () async {
                      debugPrint('stayOnTop(false)');
                      await WindowsAdapter.stayOnTop(false);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
