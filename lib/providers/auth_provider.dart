import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippied_app/api/auth_api.dart';
import 'package:zippied_app/models/otp_model.dart';
import 'package:zippied_app/models/user_model.dart';
import 'package:zippied_app/utiles/constants.dart';

class AuthProvider with ChangeNotifier {
  final AuthApi _authApi = AuthApi();
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;

  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> initAuth() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(AppConstants.TOKEN);
    notifyListeners();
  }

  Future<OtpModel?> sendOtp(String mobile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await _authApi.sendOtp(mobile);
      if (response.status == true) {
        return response;
      } else {
        _errorMessage = response.msg ?? 'Failed to send OTP';
        return null;
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserModel?> login(String mobile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await _authApi.userLogin(mobile);
      print('login provider ddddd ${response.status} ${response.data}');
      if (response.status == true && response.data?.profile?.accessToken != null) {
        _token = response.data!.profile!.accessToken;
        final prefs = await SharedPreferences.getInstance();
        print('prefs ${_token}');
        await prefs.setString(AppConstants.TOKEN, _token!);
        return response;
      } else {
        _errorMessage = response.msg ?? 'Login failed';
        return null;
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup(String name, String mobile, String livingType) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await _authApi.userSignup(name, mobile, livingType);
      if (response.status == true && response.data?.profile?.accessToken != null) {
        _token = response.data!.profile!.accessToken;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppConstants.TOKEN, _token!);
        return true;
      } else {
        _errorMessage = response.msg ?? 'Signup failed';
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.TOKEN);
    notifyListeners();
  }
}
