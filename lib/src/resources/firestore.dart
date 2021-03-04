import 'package:cafe_apps2go/src/models/PrefferenceModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/prefference.dart';
import 'auth.dart';

class FirestoreApi {
  Auth auth = Auth();

  CollectionReference coffees =
      FirebaseFirestore.instance.collection('coffees');

  saveUser(String name, String email) {
    coffees.add({'name': name, 'email': email});
  }

  updateCoffeePrefference(String name, String typeSugar, String typeCoffee, int cantSugar) async {
    DateTime now = DateTime.now();
    String email = auth.logedUser().email;
    String userId;
    final code = await coffees.where("email", isEqualTo: email).get();
    code.docs.forEach((element) {userId = element.id;});
    await coffees.doc(userId).update({
      'name': name,
      'typeSugar': typeSugar,
      'typeCoffee': typeCoffee,
      'cantSugar': cantSugar,
      'lastModified': now,
      'email': email,
    }).catchError((error) => print('Failed to update'));
  }

  Future<List<Prefference>> getCoffeePrefferences() async {
    List<Prefference> prefferences = [];
    QuerySnapshot query = await coffees.get();
    query.docs.forEach((doc) {
      Prefference userPrefference = null;
      if ((doc['email'] == auth.logedUser().email) & (doc.data().containsKey('typeCoffee')))  {
        userPrefference = Prefference(PrefferenceModel(doc['name'],
            doc['typeCoffee'], doc['typeSugar'], doc['cantSugar']));
      } else if (doc.data().containsKey('typeCoffee')) {
        Prefference prefference = Prefference(PrefferenceModel(doc['name'],
            doc['typeCoffee'], doc['typeSugar'], doc['cantSugar']));
        prefferences.add(prefference);
      }
      if (userPrefference != null) {
        prefferences.insert(0, userPrefference);
      }
    });
    return prefferences;
  }

  Future<Map<String, dynamic>> getOnePrefference() async {
    String email = auth.logedUser().email;
    final res = await coffees.where("email", isEqualTo: email).get();
    return res.docs.first.data();
  }
}
