
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable_example/application/splash/presentation/manager/splash_cubit.dart';
import 'package:injectable_example/router.dart'; 
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SplashCubit>(
        create: (context) => SplashCubit(),
        child: Builder(
          builder: (context) => BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              state.whenOrNull(
                timeToNavigateToAuth: () =>
                    context.pushReplacementNamed(AppRoutesNames.auth),
              );
            },
            child: Scaffold(
              body: Center(
                child: FlutterLogo(
                  size: MediaQuery.of(context).size.width/2,
                ),
              ),
            ),
          ),
        ),
      );
}
