import 'dart:collection';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Clubmanagement {
  Future<Map<String, String>> Eventdata(String eventname) async {
    Map<String, String> data = {};
    try {
      var results = await FirebaseFirestore.instance
          .collection('Events')
          .doc(eventname)
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

  Future<Map<String, String>> oneClubdetails(
      String cateogry, String clubname) async {
    print('------->$cateogry------------->$clubname');
    Map<String, String> data = {};
    try {
      var results = await FirebaseFirestore.instance
          .collection(cateogry)
          .doc(clubname)
          .get();
      results.data()?.forEach((key, value) {
        data[key] = value;
      });
      if (data.length > 0) {
        return data;
      }
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
    return data;
  }

  Future<List<Map<String, String>>> Clubdetails(String category) async {
    List<Map<String, String>> details = [];
    final Map<String, String> clubnames = await Clubname(category);
    for (int i = 0; i < clubnames.length; i++) {
      Map<String, String> data1 =
          await oneClubdetails(category, clubnames['$i']!);
      details.add(data1);
    }
    return details;
  }

  Future<Map<String, String>> EventTrensdata() async {
    Map<String, String> eventdata = {};
    Map<String, String> eventname1 = await Clubmanagement().Eventname();
    Map<String, String> eventdatatemp = {};
    for (var i = 0; i < eventname1.length; i++) {
      Map<String, String> eventdata1 =
          await Clubmanagement().Eventdata('${eventname1['$i']}');
      eventdata1.forEach((key, value) {
        if (key == 'dateformat') {
          eventdatatemp['${eventname1['$i']}'] = value;
        }
      });
    }
    print("eventdaaa====>$eventdatatemp");
    final sortedValuesDesc = SplayTreeMap<String, dynamic>.from(
        eventdatatemp,
        (keys1, keys2) =>
            eventdatatemp[keys2]!.compareTo(eventdatatemp[keys1]!));

    sortedValuesDesc.forEach((key, value) {
      print('key===>$key');
      print("value===>$value");
      eventdata[key] = value;
    });
    return eventdata;
  }

  Future<Map<String, String>> Clubname(String category) async {
    Map<String, String> clubnames = {};
    Map<String, String> club = {};
    print('-------------------------->$category');
    try {
      var results = await FirebaseFirestore.instance
          .collection(category)
          .doc('clubsnameslist')
          .get();
      results.data()?.forEach((key, value) {
        print('-$value');
        club[key] = value;
      });
      print(club);
      if (club.length > 0) {
        clubnames.addAll(club);
        print("data==============>$clubnames");
        return clubnames;
      }
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
    return clubnames;
  }

  Future<Map<String, String>> Eventname() async {
    Map<String, String> data = {};

    try {
      var results = await FirebaseFirestore.instance
          .collection('eventsname')
          .doc('names')
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
}
