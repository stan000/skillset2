import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/user.dart';

import 'cached_image.dart';
import 'stars.dart';

class ProfileShort extends StatelessWidget {
  final User user;

  const ProfileShort({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ]),
      child: ListTile(
        leading: cachedNetworkImage(user.profilePicture),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Theme.of(context).accentColor),
                Text(
                  '${user.city}, ${user.country}',
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ],
            ),
            starsRating(rating: user.stars),
          ],
        ),
        onTap: () => print('Navigate to profile page'),
        tileColor: Colors.white,
      ),
    );
  }
}
