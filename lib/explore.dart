import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> _localImages = [
    'assets/test/two.png',
    'assets/test/three.jpg',
    'assets/test/four.png',
    'assets/test/one.jpg',
  ];

  final ScrollController _scrollController = ScrollController();

  double height = 0.0;
  int _index = 0;
  double _offset = 0.0;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _index = _scrollController.position.pixels ~/ height;
    _offset = _scrollController.offset;
    if(_offset > height) {
      _offset = _offset % height;
    }
    _offset = (_offset / height);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Trending Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _localImages.length,
          itemBuilder: (context, index) {
            var scale = 1.0;
            if(index == _index) {
              scale = 1 + _offset * 0.15;
            }
            return Transform.scale(
              scale: scale,
              child: Image.asset(
                _localImages[index],
                fit: BoxFit.cover,
                height: height,
                width: double.infinity,
              ),
            );
          },
        ),
      ),
    );
  }
}
