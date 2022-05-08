import 'package:firebase_auth/firebase_auth.dart';

class ComplainSuggestModel {
  ComplainSuggestModel({
      this.id, 
      this.title, 
      this.desc, 
      this.firstTime,
      this.affectedTerminals,
      this.dateTime, 
      this.userId,
    this.type,
      this.status,});

  ComplainSuggestModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    firstTime = json['first_time'];
    affectedTerminals = json['affected_terminals'];
    dateTime = json['date_time'];
    userId = json['user_id'];
    status = json['status'];
    type = json['type'];
  }
  String? id;
  String? type;
  String? title;
  String? desc;
  String? firstTime;
  String? affectedTerminals;
  String? dateTime;
  String? userId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = DateTime.now().day.toString()+DateTime.now().month.toString()+FirebaseAuth.instance.currentUser!.uid.substring(0,3);
    map['type'] = type??"";
    map['title'] = title??"";
    map['desc'] = desc??"";
    map['first_time'] = firstTime??"";
    map['affected_terminals'] = affectedTerminals??"";
    map['date_time'] = DateTime.now();
    map['user_id'] = FirebaseAuth.instance.currentUser!.uid;
    map['status'] = status??"";
    return map;
  }

}