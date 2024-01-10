// lib/app/services/service_module.dart

import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyInjection {
  @singleton
  ApiConsumer get apiConsumer => ApiConsumer();
}

class ApiConsumer {
  Future<int> getRequest(String url) { 
    return Future.delayed(const Duration(seconds: 3), () => 3);
  }
}
