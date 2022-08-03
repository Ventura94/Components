import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addTen();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas"),
      ),
      body: Stack(children: [_listCreate(), _loadingCreate()]),
    );
  }

  Future<void> _firstPageObtain() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _addTen();
    });
    return Future.delayed(duration);
  }

  Widget _listCreate() {
    return RefreshIndicator(
      onRefresh: _firstPageObtain,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _numberList[index];
            return FadeInImage(
                placeholder: const AssetImage("jar-loading.gif"),
                image: NetworkImage(
                    "https://picsum.photos/500/300/?image=$image"));
          }),
    );
  }

  void _addTen() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _lastItem++;
        _numberList.add(_lastItem);
      }
    });
  }

  Future<Timer> fetchData() async {
    _isLoading = true;
    setState(() {});
    const duration = Duration(seconds: 2);
    return Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: const Duration(microseconds: 250),
        curve: Curves.fastOutSlowIn);
    _addTen();
  }

  Widget _loadingCreate() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    return Container();
  }
}
