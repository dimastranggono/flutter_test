import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetMenu extends GetxController {
  var _dio = Dio();
  Map<String, dynamic>? dataMenu;

  int jumlahBarang = 0;
  int totalHarga = 0;
  int totalMenu = 0;
  int counterItem = 0;

  int? diskon;
  String? inputVoucher;
  int? nominalVoucher;
  bool? StatusKodeVoucher;
  Map<String, dynamic>? MapPuas;
  Map<String, dynamic>? MapHemat;

  void tambahBarang({int? id}) {
    jumlahBarang++;
    totalMenu++;
    update();
  }

  void kurangBarang({int? id}) {//kasih parameter index
    jumlahBarang--;
    totalMenu--;

    if (jumlahBarang <= 0) {
      jumlahBarang = 0;
      totalMenu = 0;
    }
    update();
  }

  int kurangTotalHargaMakanan(int harga) {
    totalHarga = totalHarga - harga;
    if (totalHarga < 9000 ) {
      totalHarga = 0;
    }
    update();
    return totalHarga;
  }

  int totalHargaMakanan(int harga) {
    totalHarga = totalHarga + harga;
    update();
    return totalHarga;
  }

  Future<Map<String, dynamic>?> getDataMenu() async {
    var result = await _dio.get('https://tes-mobile.landa.id/api/menus');
    dataMenu = result.data;
    print(dataMenu);
    update();
    return dataMenu;
  }

  //function for Voucher
  bool inputKodeVoucher(String pohcer) {
    if (pohcer == 'puas') {
      update();
      return StatusKodeVoucher = true;
    } else {
      update();
      return StatusKodeVoucher = false;
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

}
