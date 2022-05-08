import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee/domain/model/complain_sugget_model.dart';

class FirebaseCreateComplainSuggestion{
  static createComplainSuggestion(ComplainSuggestModel service,{required Function onSuccess , required Function(Object error) onError})async{
    FirebaseFirestore.instance.collection("ComplainAndSuggest").add(service.toJson()).then((value) {
      onSuccess();
    },onError: onError);
  }
}