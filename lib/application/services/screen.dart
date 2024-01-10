import 'package:flutter/material.dart';
import 'package:injectable_example/application/services/manager/value_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable_example/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValueCubit>(
      create: (context) => getIt<ValueCubit>()..getFakeValue(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Injectable Example"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: BlocBuilder<ValueCubit, ValueState>(
                builder: (context, state) => state.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (fakeValue) => Text(fakeValue.toString()),
                    error: (error) => Text(error))),
          ),
        ),
      ),
    );
  }
}
