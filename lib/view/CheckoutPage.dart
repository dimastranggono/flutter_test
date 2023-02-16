import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:test_flutter/view/widget/VoucherWidget.dart';
import 'package:test_flutter/viewmodel/GetMenu.dart';

class CheckOutPage extends StatefulWidget {
  
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final Xmenu = Get.put(GetMenu());
  @override
  void initState() {
    Xmenu.getDataMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMenu>(
      builder: (Xmenu) {
        return Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 51, 12, 0),
              child: Column(
                children: [
                  Container(
                    width: 390,
                    height: 300,
                    child: ListView.builder(
                      itemCount: Xmenu.dataMenu?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 378,
                          height: 89,
                          margin: EdgeInsets.only(bottom: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff6f6f6),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff2E2E2E).withOpacity(0.3),
                                    blurRadius: 0.5,
                                    offset: Offset(5, 3))
                              ]),
                          child: Container(
                            margin: EdgeInsets.all(7),
                            child: Row(
                              children: [
                                Image.network(
                                  '${Xmenu.dataMenu?['datas'][index]['gambar']}',
                                  width: 75,
                                  height: 75,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(12, 0, 23, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          Xmenu.dataMenu?["datas"][index]
                                              ['nama'],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                        'Rp ${Xmenu.dataMenu?["datas"][index]['harga']}',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff009AAD)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.notes),
                                          Text(
                                            '${Xmenu.dataMenu?["datas"][index]['tipe']}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Xmenu.kurangBarang(id: Xmenu.dataMenu?['datas'][index]['id']);
                                        Xmenu.kurangTotalHargaMakanan(
                                            Xmenu.dataMenu?['datas'][index]
                                                ["harga"]);
                                      },
                                      child: Image.asset(
                                        'assets/decrease_icon.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '${Xmenu.jumlahBarang}',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Xmenu.tambahBarang();
                                        Xmenu.totalHargaMakanan(
                                            Xmenu.dataMenu?['datas'][index]
                                                ['harga']);
                                      },
                                      child: Image.asset(
                                        'assets/add_icon.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 428,
                height: 191,
                padding: EdgeInsets.fromLTRB(22, 24, 23, 0),
                margin: EdgeInsets.only(top: 300),
                decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Pesanan (${Xmenu.totalMenu}) : ',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rp ${Xmenu.totalHarga}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff009AAD)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/voucher.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                  Text(
                                    'Voucher',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async{
                                      var result = await Get.to(VoucherWidget());
                                    },
                                    child: Text(
                                      (Xmenu.diskon == null)? 'Input Voucher' : 'Voucher ${Xmenu.diskon}',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff2E2E2E)),
                                    ),
                                  ),
                                  Icon(Icons.arrow_right_sharp)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                      margin: EdgeInsets.only(top: 60),
                      width: 440,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(14)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/checkout_icon.png',
                            height: 30,
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Pembayaran'),
                              Text(
                                'Rp ${Xmenu.totalHarga}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(
                                      0xff009AAD,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff009AAD),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              child: Text(
                                'Pesan Sekarang',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    )
                  ],
                ))
          ]),
        );
      },
    );
  }
}
