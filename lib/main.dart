import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_out/models/note.dart';
import 'package:test_out/pages/home.dart';
import 'package:test_out/pages/note_details.dart';
import 'package:test_out/provider/provider_note.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NoteProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: "/note",
      builder: (context, state) {
        return NoteDetails(
          note: state.extra as Note,
        );
      },
    )
  ],
);
