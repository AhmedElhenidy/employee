import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  
  static Future<void> login(String mail,String password,Function onSuccess, Function(String error) onError)async{
    try {
      QuerySnapshot users = await FirebaseFirestore.instance.collection("users")
          .where("mail", isEqualTo: mail)
          .get();
      log(users.docs.length.toString());
      if(users.docs.isNotEmpty){
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
        if(credential.user!=null){
          log(credential.user!.uid);
          users.docs.first.reference.update({
            "firebaseId":credential.user!.uid
          });
          onSuccess();
        }
        else{
          onError("حدث خطأ أثناء تسجيل الدخول");
        }
      }
      else{
        onError("هذا المستخدم غير موجود برجاء التواصل مع ادارة التطبيق");
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        onError('هذا البريد قيد الإستخدام');
      }
    } catch(e){
      onError(e.toString());
      log(e.toString());
    }
  }
}