import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_example/injection.config.dart';
final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)
Future<void> configureDependencies() async {
  getIt.init(); 
}