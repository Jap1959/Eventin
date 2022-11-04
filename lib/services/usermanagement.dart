import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class userdata {
  static bool showed = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get context => null;

  AddUseremail(String data, String datatype, context, String uid) async {
    FirebaseFirestore logineduser = FirebaseFirestore.instance;
    logineduser.collection('users').doc(uid).set({
      datatype: data,
    });
  }

  AddUserData(String data, String datatype, context, String uid) async {
    FirebaseFirestore logineduser = FirebaseFirestore.instance;
    logineduser.collection('users').doc(uid).update({
      datatype: data,
    });
  }

  Future<Map<String, String>> GetUserData(String uid) async {
    final Map<String, String> data = {};
    print('hii=========>${uid}');
    try {
      final Map<String, String> data1 = {};
      var results =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      results.data()?.forEach((key, value) {
        data1[key] = value;
      });
      print('result ====>${data1}');
      if (data1.isNotEmpty) {
        data.addAll(data1);
      }
      return data;
    } on FirebaseException catch (e) {
      print(e);
      return data;
    } catch (error) {
      print(error);
      return data;
    }
  }

  Future<Map<String, String>> GetclubsData(
      String Clubcategory, String dataname) async {
    Map<String, String> data = {};
    try {
      var results = await FirebaseFirestore.instance
          .collection(Clubcategory)
          .doc(dataname)
          .get();
      results.data()?.forEach((key, value) {
        data[key] = value;
      });
      if (data.length > 0) {
        return data;
      }
      return data;
    } on FirebaseException catch (e) {
      print(e);
      return data;
    } catch (error) {
      print(error);
      return data;
    }
  }

  Future<Map<String, String>> Getclubsmemberdata(String Clubname) async {
    Map<String, String> data = {
      '0': '',
    };

    try {
      var results = await FirebaseFirestore.instance
          .collection('Clubsmemberlist')
          .doc(Clubname)
          .get();
      results.data()?.forEach((key, value) {
        data[key] = value;
      });
      if (data.length > 0) {
        print("data==============>$data");
        return data;
      }
      return data;
    } on FirebaseException catch (e) {
      print(e);
      return data;
    } catch (error) {
      print(error);
      return data;
    }
  }

  Future<String> GetUserImage() async {
    String data = '';
    try {
      var results = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .get();
      results.docs.forEach((element) {
        print(element.data());
      });
      if (results.docs.length > 0) {
        data = results.docs[0]['image'];
      }
      return data;
    } on FirebaseException catch (e) {
      print(e);
      return data;
    } catch (error) {
      print(error);
      return data;
    }
  }

  Future<String> pickuploadimage(String uid) async {
    String url = '';
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("image---->$image");
    if (image == null) {
      return 'null';
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('userprofilephotos/profilepics${uid}.jpg');
    await ref.putFile(File(image.path));
    url = await ref.getDownloadURL();
    AddUserData(url, 'image', context, uid);
    return url;
  }
}
