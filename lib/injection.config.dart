// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:injectable_example/application/Home/api_consumer.dart' as _i3;
import 'package:injectable_example/application/Home/manager/value_cubit.dart'
    as _i5;
import 'package:injectable_example/application/Home/repo.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i3.ApiConsumer>(thirdPartyInjection.apiConsumer);
    gh.singleton<_i4.Repository>(_i4.RepositoryImp(gh<_i3.ApiConsumer>()));
    gh.factory<_i5.ValueCubit>(() => _i5.ValueCubit(gh<_i4.RepositoryImp>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i3.ThirdPartyInjection {}
