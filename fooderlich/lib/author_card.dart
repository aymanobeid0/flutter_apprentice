import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                ],
              ),
              // todo add icon button
            ],
          ),
          IconButton(
              iconSize: _isFavorited ? 40 : 30,
              color: Colors.red[500],
              onPressed: () {
                // const snackBar = SnackBar(
                //   backgroundColor: Color.fromARGB(255, 163, 159, 159),
                //   content: Text('Favorite Pressed'),
                //   duration: Duration(milliseconds: 2000),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              },
              icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border))
        ],
      ),
    );
  }
}
