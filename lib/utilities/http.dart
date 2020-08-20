import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recscanner/utilities/globals.dart';

Future<dynamic> httpPost({String endPoint, String data, bool auth}) async {
  try {
    var header;
    if (auth && gAuthToken != null) {
      header = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + gAuthToken,
      };
    } else {
      header = <String, String>{
        'Content-Type': 'application/json',
      };
    }

    final http.Response response = await http
        .post(
          gBackEndUrl + endPoint,
          headers: header,
          body: data,
        )
        .timeout(Duration(seconds: 15));

    switch (response.statusCode) {
      case 400:
        {
          throw 'Erreur, veuillez réessayer plus tard.';
        }
        break;
      case 401:
        {
          throw 'Erreur d\'authentification.';
        }
        break;
      case 404:
        {
          throw 'Erreur 404, veuillez réessayer plus tard.';
        }
        break;
      case 500:
        {
          throw 'Erreur serveur, veuillez réessayer plus tard.';
        }
        break;
    }

    return jsonDecode(response.body);
  } on TimeoutException catch (e) {
    throw 'Timeout';
  } on SocketException catch (e) {
    throw 'No internet connection.';
  } catch (e) {
    throw e;
  }
}

Future<dynamic> httpGet({String endPoint, String params, bool auth}) async {
  //data can be '/85' or '?userId=85'
  try {
    var header;
    if (auth && gAuthToken != null) {
      header = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + gAuthToken,
      };
    } else {
      header = <String, String>{
        'Content-Type': 'application/json',
      };
    }

    final http.Response response = await http
        .get(
          gBackEndUrl + endPoint + params,
          headers: header,
        )
        .timeout(Duration(seconds: 15));

    switch (response.statusCode) {
      case 400:
        {
          throw 'Erreur, merci de réessayer plus tard.';
        }
        break;
      case 401:
        {
          throw 'Erreur d\'authentification.';
        }
        break;
      case 404:
        {
          throw 'Erreur 404, merci de réessayer plus tard.';
        }
        break;
      case 500:
        {
          throw 'Erreur serveur, merci de réessayer plus tard.';
        }
        break;
    }

    return jsonDecode(response.body);
  } on TimeoutException catch (e) {
    throw 'Serveur non joignable, merci de vérifier ta connexion internet.';
  } on SocketException catch (e) {
    throw 'Serveur non joignable, merci de vérifier ta connexion internet.';
  } catch (e) {
    throw e;
  }
}

Future<dynamic> httpPut({String endPoint, String params, String data, bool auth}) async {
  try {
    var header;
    if (auth && gAuthToken != null) {
      header = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + gAuthToken,
      };
    } else {
      header = <String, String>{
        'Content-Type': 'application/json',
      };
    }

    final http.Response response = await http
        .put(
          gBackEndUrl + endPoint + params,
          headers: header,
          body: data,
        )
        .timeout(Duration(seconds: 15));

    switch (response.statusCode) {
      case 400:
        {
          throw 'Erreur, veuillez réessayer plus tard.';
        }
        break;
      case 401:
        {
          throw 'Erreur d\'authentification.';
        }
        break;
      case 404:
        {
          throw 'Erreur 404, veuillez réessayer plus tard.';
        }
        break;
      case 500:
        {
          throw 'Erreur serveur, veuillez réessayer plus tard.';
        }
        break;
    }

    return jsonDecode(response.body);
  } on TimeoutException catch (e) {
    throw 'Timeout';
  } on SocketException catch (e) {
    throw 'No internet connection.';
  } catch (e) {
    throw e;
  }
}
