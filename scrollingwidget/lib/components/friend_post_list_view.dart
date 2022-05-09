import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({Key? key, required this.friendPosts})
      : super(key: key);
  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs ! ', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          // TODO: Add PostListView here
          ListView.separated(
            // 2
            primary: false, // 3
            physics: const NeverScrollableScrollPhysics(), // 4
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              // 6
              return const SizedBox(height: 16);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
