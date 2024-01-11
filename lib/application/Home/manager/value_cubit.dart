import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_example/application/Home/repo.dart';

part 'value_state.dart';
part 'value_cubit.freezed.dart';

@injectable
class ValueCubit extends Cubit<ValueState> {
  ValueCubit(this.repository) : super(const ValueState.loading());
  final RepositoryImp repository;
  Future<void> getFakeValue() async {
    emit(const ValueState.loading());
    final response = await repository.getFakeInt();
    response.fold(
      (errorMessage) => emit(ValueState.error(errorMessage)),
      (fakeValue) {
        emit(
          ValueState.success(fakeValue: fakeValue),
        );
      },
    );
  }
}
