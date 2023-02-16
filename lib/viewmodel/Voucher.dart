import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Voucher extends GetxController {
  var _dio = Dio();
  String? inputVoucher;
  int? nominalVoucher;
  String? kodeVoucherPuas;
  String? kodeVoucherHemat;
  Map<String, dynamic>? MapPuas;
  Map<String, dynamic>? MapHemat;

  String inputKodeVoucher(String pohcer) {
    if (pohcer == 'puas') {
      update();
      return kodeVoucherPuas = pohcer;
    } else{
      update();
      return kodeVoucherHemat = pohcer;
    }
  }

  Future hasilVoucherPuas({String? pocer}) async {
    var result =
        await _dio.get('https://tes-mobile.landa.id/api/vouchers?kode=puas');
    MapPuas = result.data;
    update();
    return result;
  }

  Future hasilVoucherHemat({String? pocer}) async {
    var result =
        await _dio.get('https://tes-mobile.landa.id/api/vouchers?kode=hemat');
    MapHemat = result.data;
    update();
    return result;
  }

  void SendNominalVoucher(var result) {
    nominalVoucher = result;
    update();
  }
}
