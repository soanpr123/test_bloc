import 'package:rxdart/rxdart.dart';

import 'package:testbloc/src/model/test_model.dart';
import 'package:testbloc/src/service/home_service.dart';

class HomeBloc {
  HomeService _homeService = HomeService();
    final _dataList = PublishSubject<List<TestModel>>();

  Stream<List<TestModel>> get dataList => _dataList.stream;

  dispose() {
    _dataList.close();
  }

  getAllData() async {
    await _homeService.getAllList(successBlock: (data) {
      _dataList.sink.add(data);
      return;
    }, error: (err) {
      print(err);
      return;
    });
  }

}
