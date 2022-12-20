import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationActived extends ChangeNotifier {
  double lat = 0.0, long = 0.0;
  String erro = '';
  LocationActived() {
    getPosicao();
  }
  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('LocationServiceEnable');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('locationAccessDenied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('locationAccessDenied');
    }
    return await Geolocator.getCurrentPosition();
  }
}
