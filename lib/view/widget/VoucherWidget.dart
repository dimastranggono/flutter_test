import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:test_flutter/view/CheckoutPageVoucher.dart';
import 'package:test_flutter/viewmodel/GetMenu.dart';
import 'package:test_flutter/viewmodel/Voucher.dart';

import '../CheckoutPage.dart';

class VoucherWidget extends StatefulWidget {
  const VoucherWidget({super.key});

  @override
  State<VoucherWidget> createState() => _VoucherWidgetState();
}

class _VoucherWidgetState extends State<VoucherWidget> {
  final MenuX = Get.put(Voucher());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMenu>(
      builder: (Xmenu) {
        return Scaffold(
          body: Container(
              width: 428,
              height: 330,
              padding: EdgeInsets.fromLTRB(22, 24, 23, 0),
              margin: EdgeInsets.only(top: 500),
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/voucher.png',
                        width: 28,
                        height: 35,
                      ),
                      Text(
                        'Punya Kupon Voucher?',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_rounded))
                    ],
                  ),
                  Text(
                    'Masukkan Kode Voucher disini',
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  TextField(
                    onChanged: (value) {
                      Xmenu.inputKodeVoucher(value);
                    },
                    decoration:
                        InputDecoration(hintText: 'Masukkan Kode Voucher anda'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff009AADA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: () async {
                          Navigator.pop(context, Xmenu.diskon);
                          if (Xmenu.StatusKodeVoucher == true) {
                            Xmenu.diskon = Xmenu.MapPuas?['datas']['nominal'] - Xmenu.totalHarga;
                          } else {
                            Xmenu.diskon = Xmenu.MapHemat?['datas']['nominal'] -Xmenu.totalHarga;
                          }
                        },
                        child: Text(
                          'Validasi Voucher',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              )),
        );
      },
    );
  }
}
