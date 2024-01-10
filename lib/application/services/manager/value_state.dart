part of 'value_cubit.dart';

@freezed
class ValueState with _$ValueState {
  const factory ValueState.loading() = _Loading;
  const factory ValueState.success({
    required int fakeValue,
  }) = _Success;
  const factory ValueState.error(String exception) = _Error;
}
