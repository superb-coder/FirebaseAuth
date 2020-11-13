import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoList extends StatefulWidget {
  final String uid;
  UserInfoList({Key key, this.uid}) : super(key: key);

  @override
  _UserInfoListState createState() => _UserInfoListState();
}

class _UserInfoListState extends State<UserInfoList> {
  String uid;

  @override
  void initState() {
    uid = widget.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.data().length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return ListTile(
                    title: Text("CompanyName"),
                    subtitle: Text(snapshot.data.data()["CompanyName"]),
                  );
                } else if (index == 1) {
                  return ListTile(
                    title: Text("OwnerName"),
                    subtitle: Text(snapshot.data.data()["OwnerName"]),
                  );
                } else if (index == 2) {
                  return ListTile(
                    title: Text("PhoneNumber"),
                    subtitle: Text(snapshot.data.data()["PhoneNumber"]),
                  );
                } else if (index == 3) {
                  return ListTile(
                    title: Text("TownCity"),
                    subtitle: Text(snapshot.data.data()["TownCity"]),
                  );
                } else if (index == 4) {
                  return ListTile(
                    title: Text("District"),
                    subtitle: Text(snapshot.data.data()["District"]),
                  );
                } else if (index == 5) {
                  return ListTile(
                    title: Text("PinCode"),
                    subtitle: Text(snapshot.data.data()["PinCode"]),
                  );
                } else {
                  return null;
                }
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
