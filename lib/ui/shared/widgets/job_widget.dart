import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/ui/screens/freelancer/job/job.dart';
import 'package:newserverdemo/ui/shared/widgets/tag.dart';

class JobWidget extends StatelessWidget {
  final Posting posting;

  List<Widget> getSkills(context) {
    return posting.skills.map((skill) => tag(context, skill)).toList();
  }

  const JobWidget({Key key, this.posting}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, JobDetails.id),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    posting.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ),
                Text(
                  '\$${posting.pay.amount}',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                Text('${posting.pay.unit}'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(posting.description, maxLines: 3),
            SizedBox(height: 8.0),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runSpacing: 4,
              children: getSkills(context),
            ),
            SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: Text('Posted ${posting.postedOn}',
                      style: Theme.of(context).primaryTextTheme.caption),
                ),
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).accentColor,
                ),
                Text('${posting.location}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
