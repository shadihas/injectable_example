import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable_example/application/Home/screen.dart';
import 'package:injectable_example/application/auth/auth_page.dart';
import 'package:injectable_example/application/page_one/page_one.dart';
import 'package:injectable_example/application/splash/presentation/pages/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RoutesManager {
  RoutesManager() {
    _appRouter = 
    
    GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutesNames.splash,
          pageBuilder: (context, state) => CupertinoPage(
            child: const SplashPage(),
            key: state.pageKey,
            name: state.name,
          ),
        ),
        
        GoRoute(
          path: '/home',
          name: AppRoutesNames.home,
          pageBuilder: (context, state) => CupertinoPage(
            child: const HomePage(),
            key: state.pageKey,
            name: state.name,
          ),
          routes: [
             GoRoute(
          path: 'page_one',
          name: AppRoutesNames.pageOne,
          pageBuilder: (context, state) => CupertinoPage(
            child: const PageOne(),
            key: state.pageKey,
            name: state.name,
          ),
        ),
          ]
        ),
        GoRoute(
          path: '/auth_page',
          name: AppRoutesNames.auth,
          pageBuilder: (context, state) => CupertinoPage(
            child: const AuthPage(),
            key: state.pageKey,
            name: state.name,
          ),
        ),
       
      ],
    );
  }

  late final GoRouter _appRouter;
  GoRouter get router => _appRouter;
}

class AppRoutesNames {
  AppRoutesNames._();

  static const String splash = 'splashRoute';
  static const String home = 'homeRoute';
  static const String auth = 'authRoute';
  static const String pageOne = 'pageOneRoute';
}