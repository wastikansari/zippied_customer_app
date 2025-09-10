import 'package:flutter/material.dart';
import 'package:zippied_app/api/address_api.dart';
import 'package:zippied_app/models/address_model.dart';

class AddressProvider with ChangeNotifier {
  final AddressApi _addressApi = AddressApi();
  bool _isLoading = false;
  String? _errorMessage;
  List<AddressData> _addresses = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<AddressData> get addresses => _addresses;

  // Create a new address
  Future<void> createAddress(Map<String, dynamic> addressData) async {
    print('Creating address with data1: $addressData');
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await _addressApi.createAddress(addressData);
      if (response.status == true && response.data != null) {
        _addresses.add(response.data!);
      } else {
        _errorMessage = response.msg ?? 'Failed to create address';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch list of addresses
  Future<void> fetchAddresses() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final addresses = await _addressApi.getAddressList();
      _addresses = addresses;
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete an address
  Future<void> deleteAddress(String addressId) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _addressApi.deleteAddress(addressId);
      _addresses.removeWhere((address) => address.addressId == addressId);
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Set primary address
  Future<void> setPrimaryAddress(String addressId) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      // Call API to set default address
      await _addressApi.setDefaultAddress(addressId);

      // Update local state
      _addresses = _addresses.map((address) {
        address.isPrimary = address.addressId == addressId;
        return address;
      }).toList();
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create a new address
  Future<void> updateAddress(
      Map<String, dynamic> addressData, String addressId) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await _addressApi.updateAddress(addressData, addressId);
      if (response.status == true && response.data != null) {
        _addresses.add(response.data!);
      } else {
        _errorMessage = response.msg ?? 'Failed to update address';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
