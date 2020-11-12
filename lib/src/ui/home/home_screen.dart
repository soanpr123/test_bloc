import 'package:flutter/material.dart';
import 'package:testbloc/src/bloc/home/home_bloc.dart';
import 'package:testbloc/src/model/test_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Bloc"),
      ),
      body: Container(
        child: StreamBuilder(
            stream: _homeBloc.dataList,
            builder: (context, snapshot) {
              List<TestModel> listSnap = [];

              if (snapshot.hasData) {
                listSnap = snapshot.data;
                return ListView.builder(
                    itemCount: listSnap.length,
                    itemBuilder: (context, index) {
                      TestModel data = listSnap[index];
                      return Container(
                        width: size.width,
                        height: 30,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: Text(
                          data.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    });
              } else {
                return Container(width: size.width, height: size.height, alignment: Alignment.center, child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
