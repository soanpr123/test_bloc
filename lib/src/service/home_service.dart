import 'package:testbloc/src/model/test_model.dart';
import 'package:testbloc/src/shared/base/base_service.dart';

class HomeService {
    getAllList({Function successBlock(object), Function error(err)}) async {
    var url = "https://jsonplaceholder.typicode.com/posts";

    await BaseService().getRequest(
        contentUrl: url,
        successBlock: (object) {
          List<TestModel> listData = [];

          for (var item in object) {
            listData.add(TestModel(
              id: item['id'],
              userId: item['userId'],
              title: item['title'],
              body: item['body'],
            ));
          }
          return successBlock(listData);
        },
        error: (error) {
          print(error);
          return;
        });
  }
}
