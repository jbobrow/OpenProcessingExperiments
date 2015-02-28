
PImage light;
int rad;
int sunX;
int sunY;
int [] star1;
int [] star2;
int [] star3;
int [] star4;
int [] star5;
int [] star6;
int [] star7;
int [] star8;
int [] star9;
int [] star10;
int [] star11;
int [] star12;
int [] star13;
int [] star14;
int [] star15;
int [] star16;
int [] star17;
int [] star18;
int [] star19;
int [] star20;
int [] star21;
int [] star22;
int [] star23;
int [] star24;
int [] star25;
int [] star26;
int [] star27;
int [] star28;
int [] star29;
int [] star30;
int [] star31;
int [] star32;
int [] star33;
int [] star34;
int [] star35;
int [] star36;
int [] star37;
int [] star38;
int [] star39;
int [] star40;
int [] star41;
int [] star42;
int [] star43;
int [] star44;
int [] star45;
int [] star46;
int [] star47;
int [] star48;
int [] star49;
int [] star50;
int [] star51;
int [] star52;
int [] star53;
int [] star54;
int [] star55;
int [] star56;
int [] star57;
int [] star58;
int [] star59;
int [] star60;
int [] star61;
int [] star62;
int [] star63;
int [] star64;
int [] star65;
int [] star66;
int [] star67;
int [] star68;
int [] star69;
int [] star70;
int [] star71;
int [] star72;
int [] star73;
int [] star74;
int [] star75;
int [] star76;
int [] star77;
int [] star78;
int [] star79;
int [] star80;
int [] star81;
int [] star82;
int [] star83;
int [] star84;
int [] star85;
int [] star86;
int [] star87;
int [] star88;
int [] star89;
int [] star90;
int [] star91;
int [] star92;
int [] star93;
int [] star94;
int [] star95;
int [] star96;
int [] star97;
int [] star98;
int [] star99;
int [] star100;
int [] star101;
int [] star102;
int [] star103;
int [] star104;
int [] star105;
int [] star106;
int [] star107;
int [] star108;
int [] star109;
int [] star110;
int [] star111;
int [] star112;
int [] star113;
int [] star114;
int [] star115;
int [] star116;
int [] star117;
int [] star118;
int [] star119;
int [] star120;
int [] star121;
int [] star122;
int [] star123;
int [] star124;
int [] star125;
int [] star126;
int [] star127;
int [] star128;
int [] star129;
int [] star130;
int [] star131;
int [] star132;
int [] star133;
int [] star134;
int [] star135;
int [] star136;
int [] star137;
int [] star138;
int [] star139;
int [] star140;
int [] star141;
int [] star142;
int [] star143;
int [] star144;
int [] star145;
int [] star146;
int [] star147;
int [] star148;
int [] star149;
int [] star150;
int [] star151;
int [] star152;
int [] star153;
int [] star154;
int [] star155;
int [] star156;
int [] star157;
int [] star158;
int [] star159;
int [] star160;
int [] star161;
int [] star162;
int [] star163;
int [] star164;


boolean sun = false;

void setup() {
  size(1078, 793);
  rad = 100;
  light = loadImage("light.jpg");
  sunX = 548;
  sunY = 252;
  
  star1 = new int [] {
    63, 70
  };
  star2 = new int [] {
    58, 106
  };
  star3 = new int [] {
    3, 104
  };
  star4 = new int [] {
    24, 132
  };
  star5 = new int [] {
    102, 97
  };
  star6 = new int [] {
    132, 100
  };
  star7 = new int [] {
    78, 126
  };
  star8 = new int [] {
    64, 157
  };
  star9 = new int [] {
    41, 160
  };
  star10 = new int [] {
    17, 192
  };
  star11 = new int [] {
    20, 214
  };
  star12 = new int [] {
    52, 216
  };
  star13 = new int [] {
    40, 246
  };
  star14 = new int [] {
    42, 285
  };
  star15 = new int [] {
    118, 276
  };
  star16 = new int [] {
    93, 314
  };
  star17 = new int [] {
    6, 395
  };
  star18 = new int [] {
    20, 400
  };
  star19 = new int [] {
    72, 500
  };
  star20 = new int [] {
    102, 515
  };
  star21 = new int [] {
    122, 499
  };
  star22 = new int [] {
    117, 578
  };
  star23 = new int [] {
    76, 558
  };
  star24 = new int [] {
    31, 602
  };
  star25 = new int [] {
    170, 65
  };
  star26 = new int [] {
    177, 128
  };
  star27 = new int [] {
    135, 169
  };
  star28 = new int [] {
    168, 188
  };
  star29 = new int [] {
    206, 158
  };
  star30 = new int [] {
    237, 134
  };
  star31 = new int [] {
    293, 136
  };
  star32 = new int [] {
    302, 132
  };
  star33 = new int [] {
    233, 184
  };
  star34 = new int [] {
    181, 319
  };
  star35 = new int [] {
    173, 332
  };
  star36 = new int [] {
    211, 344
  };
  star37 = new int [] {
    217, 338
  };
  star38 = new int [] {
    239, 247
  };
  star39 = new int [] {
    268, 290
  };
  star40 = new int [] {
    266, 263
  };
  star41 = new int [] {
    135, 374
  };
  star42 = new int [] {
    171, 411
  };
  star43 = new int [] {
    199, 501
  };
  star44 = new int [] {
    278, 428
  };
  star45 = new int [] {
    325, 434
  };
  star46 = new int [] {
    340, 363
  };
  star47 = new int [] {
    354, 342
  };
  star48 = new int [] {
    396, 323
  };
  star49 = new int [] {
    403, 425
  };
  star50 = new int [] {
    410, 414
  };
  star51 = new int [] {
    416, 414
  };
  star52 = new int [] {
    451, 405
  };
  star53 = new int [] {
    440, 481
  };
  star54 = new int [] {
    368, 454
  };
  star55 = new int [] {
    379, 594
  };
  star56 = new int [] {
    336, 635
  };
  star57 = new int [] {
    347, 674
  };
  star58 = new int [] {
    341, 674
  };
  star59 = new int [] {
    314, 703
  };
  star60 = new int [] {
    260, 767
  };
  star61 = new int [] {
    445, 598
  };
  star62 = new int [] {
    475, 624
  };
  star63 = new int [] {
    484, 667
  };
  star64 = new int [] {
    447, 713
  };
  star65 = new int [] {
    404, 718
  };
  star66 = new int [] {
    412, 764
  };
  star67 = new int [] {
    467, 776
  };
  star68 = new int [] {
    488, 485
  };
  star69 = new int [] {
    529, 515
  };
  star70 = new int [] {
    500, 395
  };
  star71 = new int [] {
    523, 416
  };
  star72 = new int [] {
    529, 965
  };
  star73 = new int [] {
    556, 395
  };
  star74 = new int [] {
    462, 354
  };
  star75 = new int [] {
    490, 348
  };
  star76 = new int [] {
    489, 339
  };
  star77 = new int [] {
    516, 349
  };
  star78 = new int [] {
    544, 358
  };
  star79 = new int [] {
    548, 470
  };
  star80 = new int [] {
    600, 449
  };
  star81 = new int [] {
    674, 485
  };
  star82 = new int [] {
    748, 416
  };
  star83 = new int [] {
    652, 363
  };
  star84 = new int [] {
    602, 364
  };
  star85 = new int [] {
    631, 331
  };
  star86 = new int [] {
    542, 601
  };
  star87 = new int [] {
    567, 611
  };
  star88 = new int [] {
    561, 665
  };
  star89 = new int [] {
    569, 699
  };
  star90 = new int [] {
    533, 753
  };
  star91 = new int [] {
    553, 790
  };
  star92 = new int [] {
    645, 656
  };
  star93 = new int [] {
    658, 669
  };
  star94 = new int [] {
    628, 725
  };
  star95 = new int [] {
    657, 785
  };
  star96 = new int [] {
    673, 624
  };
  star97 = new int [] {
    780, 650
  };
  star98 = new int [] {
    719, 699
  };
  star99 = new int [] {
    693, 742
  };
  star100 = new int [] {
    764, 624
  };
  star101 = new int [] {
    766, 636
  };
  star102 = new int [] {
    773, 702
  };
  star103 = new int [] {
    795, 729
  };
  star104 = new int [] {
    774, 778
  };
  star105 = new int [] {
    779, 787
  };
  star106 = new int [] {
    822, 764
  };
  star107 = new int [] {
    856, 748
  };
  star108 = new int [] {
    837, 666
  };
  star109 = new int [] {
    825, 592
  };
  star110 = new int [] {
    853, 541
  };
  star111 = new int [] {
    895, 557
  };
  star112 = new int [] {
    879, 580
  };
  star113 = new int [] {
    931, 644
  };
  star114 = new int [] {
    942, 657
  };
  star115 = new int [] {
    968, 636
  };
  star116 = new int [] {
    975, 616
  };
  star117 = new int [] {
    1012, 678
  };
  star118 = new int [] {
    971, 734
  };
  star119 = new int [] {
    979, 746
  };
  star120 = new int [] {
    1032, 754
  };
  star121 = new int [] {
    894, 451
  };
  star122 = new int [] {
    986, 472
  };
  star123 = new int [] {
    993, 444
  };
  star124 = new int [] {
    955, 399
  };
  star125 = new int [] {
    885, 392
  };
  star126 = new int [] {
    909, 311
  };
  star127 = new int [] {
    985, 249
  };
  star128 = new int [] {
    997, 272
  };
  star129 = new int [] {
    1022, 269
  };
  star130 = new int [] {
    941, 238
  };
  star131 = new int [] {
    1003, 227
  };
  star132 = new int [] {
    1059, 233
  };
  star133 = new int [] {
    979, 152
  };
  star134 = new int [] {
    1056, 349
  };
  star135 = new int [] {
    1042, 410
  };
  star136 = new int [] {
    1057, 541
  };
  star137 = new int [] {
    904, 113
  };
  star138 = new int [] {
    968, 81
  };
  star139 = new int [] {
    893, 134
  };
  star140 = new int [] {
    1025, 66
  };
  star141 = new int [] {
    1052, 23
  };
  star142 = new int [] {
    958, 2
  };
  star143 = new int [] {
    901, 36
  };
  star144 = new int [] {
    847, 58
  };
  star145 = new int [] {
    802, 97
  };
  star146 = new int [] {
    796, 30
  };
  star147 = new int [] {
    733, 96
  };
  star148 = new int [] {
    758, 182
  };
  star149 = new int [] {
    789, 217
  };
  star150 = new int [] {
    737, 234
  };
  star151 = new int [] {
    707, 276
  };
  star152 = new int [] {
    733, 214
  };
  star153 = new int [] {
    667, 219
  };
  star154 = new int [] {
    704, 184
  };
  star155 = new int [] {
    707, 18
  };
  star156 = new int [] {
    808, 2
  };
  star157 = new int [] {
    684, 28
  };
  star158 = new int [] {
    695, 9
  };
  star159 = new int [] {
    626, 68
  };
  star160 = new int [] {
    517, 109
  };
  star161 = new int [] {
    978, 360
  };
  star162 = new int [] {
    850, 205
  };
  star163 = new int [] {
    738, 379
  };
  star164 = new int [] {
    523, 117
  };
}

void draw() {
  image(light, 0, 0);
  noStroke();
  noCursor();
  //controls hovering glow over sun
  if (dist(mouseX, mouseY, sunX, sunY)<rad) {
    for (int i=0;i<200;i+=5) {
      fill(255, 255, 0, 5);
      ellipse(sunX, sunY, 200-i, 200-i);
      fill(255, 255, 255, 15);
      ellipse(sunX, sunY, -40+i, -40+i);
      ellipse(sunX, sunY, i/2, i/2);
      ellipse(sunX, sunY, i/3, i/3);
      ellipse(sunX, sunY, i/4, i/4);
    }
  } //controls sun on/off
  if (sun) {
    for (int i=0;i<275;i+=5) {
      fill(255, 255, 0, 5);
      ellipse(sunX, sunY, 275-i, 275-i);
      fill(255, 255, 255, 15);
      ellipse(sunX, sunY, -60+i, -60+i);
      ellipse(sunX, sunY, i/2, i/2);
      ellipse(sunX, sunY, i/3, i/3);
      ellipse(sunX, sunY, i/4, i/4);
    }
  }
  lightTwinkle(star1[0],star1[1]);
  lightTwinkle(star2[0],star2[1]);
  lightTwinkle(star3[0],star3[1]);
  lightTwinkle(star4[0],star4[1]);
  lightTwinkle(star5[0],star5[1]);
  lightTwinkle(star6[0],star6[1]);
  lightTwinkle(star7[0],star7[1]);
  lightTwinkle(star8[0],star8[1]);
  lightTwinkle(star9[0],star9[1]);
  lightTwinkle(star10[0],star10[1]);
  lightTwinkle(star11[0],star11[1]);
  lightTwinkle(star12[0],star12[1]);
  lightTwinkle(star13[0],star13[1]);
  lightTwinkle(star14[0],star14[1]);
  lightTwinkle(star15[0],star15[1]);
  lightTwinkle(star16[0],star16[1]);
  lightTwinkle(star17[0],star17[1]);
  lightTwinkle(star18[0],star18[1]);
  lightTwinkle(star19[0],star19[1]);
  lightTwinkle(star20[0],star20[1]);
  lightTwinkle(star21[0],star21[1]);
  lightTwinkle(star22[0],star22[1]);
  lightTwinkle(star23[0],star23[1]);
  lightTwinkle(star24[0],star24[1]);
  lightTwinkle(star25[0],star25[1]);
  lightTwinkle(star26[0],star26[1]);
  lightTwinkle(star27[0],star27[1]);
  lightTwinkle(star28[0],star28[1]);
  lightTwinkle(star29[0],star29[1]);
  lightTwinkle(star30[0],star30[1]);
  lightTwinkle(star31[0],star31[1]);
  lightTwinkle(star32[0],star32[1]);
  lightTwinkle(star33[0],star33[1]);
  lightTwinkle(star34[0],star34[1]);
  lightTwinkle(star35[0],star35[1]);
  lightTwinkle(star36[0],star36[1]);
  lightTwinkle(star37[0],star37[1]);
  lightTwinkle(star38[0],star38[1]);
  lightTwinkle(star39[0],star39[1]);
  lightTwinkle(star40[0],star40[1]);
  lightTwinkle(star41[0],star41[1]);
  lightTwinkle(star42[0],star42[1]);
  lightTwinkle(star43[0],star43[1]);
  lightTwinkle(star44[0],star44[1]);
  lightTwinkle(star45[0],star45[1]);
  lightTwinkle(star46[0],star46[1]);
  lightTwinkle(star47[0],star47[1]);
  lightTwinkle(star48[0],star48[1]);
  lightTwinkle(star49[0],star49[1]);
  lightTwinkle(star50[0],star50[1]);
  lightTwinkle(star51[0],star51[1]);
  lightTwinkle(star52[0],star52[1]);
  lightTwinkle(star53[0],star53[1]);
  lightTwinkle(star54[0],star54[1]);
  lightTwinkle(star55[0],star55[1]);
  lightTwinkle(star56[0],star56[1]);
  lightTwinkle(star57[0],star57[1]);
  lightTwinkle(star58[0],star58[1]);
  lightTwinkle(star59[0],star59[1]);
  lightTwinkle(star60[0],star60[1]);
  lightTwinkle(star61[0],star61[1]);
  lightTwinkle(star62[0],star62[1]);
  lightTwinkle(star63[0],star63[1]);
  lightTwinkle(star64[0],star64[1]);
  lightTwinkle(star65[0],star65[1]);
  lightTwinkle(star66[0],star66[1]);
  lightTwinkle(star67[0],star67[1]);
  lightTwinkle(star68[0],star68[1]);
  lightTwinkle(star69[0],star69[1]);
  lightTwinkle(star70[0],star70[1]);
  lightTwinkle(star71[0],star71[1]);
  lightTwinkle(star72[0],star72[1]);
  lightTwinkle(star73[0],star73[1]);
  lightTwinkle(star74[0],star74[1]);
  lightTwinkle(star75[0],star75[1]);
  lightTwinkle(star76[0],star76[1]);
  lightTwinkle(star77[0],star77[1]);
  lightTwinkle(star78[0],star78[1]);
  lightTwinkle(star79[0],star79[1]);
  lightTwinkle(star80[0],star80[1]);
  lightTwinkle(star81[0],star81[1]);
  lightTwinkle(star82[0],star82[1]);
  lightTwinkle(star83[0],star83[1]);
  lightTwinkle(star84[0],star84[1]);
  lightTwinkle(star85[0],star85[1]);
  lightTwinkle(star86[0],star86[1]);
  lightTwinkle(star87[0],star87[1]);
  lightTwinkle(star88[0],star88[1]);
  lightTwinkle(star89[0],star89[1]);
  lightTwinkle(star90[0],star90[1]);
  lightTwinkle(star91[0],star91[1]);
  lightTwinkle(star92[0],star92[1]);
  lightTwinkle(star93[0],star93[1]);
  lightTwinkle(star94[0],star94[1]);
  lightTwinkle(star95[0],star95[1]);
  lightTwinkle(star96[0],star96[1]);
  lightTwinkle(star97[0],star97[1]);
  lightTwinkle(star98[0],star98[1]);
  lightTwinkle(star99[0],star99[1]);
  lightTwinkle(star100[0],star100[1]);
  lightTwinkle(star101[0],star101[1]);
  lightTwinkle(star102[0],star102[1]);
  lightTwinkle(star103[0],star103[1]);
  lightTwinkle(star104[0],star104[1]);
  lightTwinkle(star105[0],star105[1]);
  lightTwinkle(star106[0],star106[1]);
  lightTwinkle(star107[0],star107[1]);
  lightTwinkle(star108[0],star108[1]);
  lightTwinkle(star109[0],star109[1]);
  lightTwinkle(star110[0],star110[1]);
  lightTwinkle(star111[0],star111[1]);
  lightTwinkle(star112[0],star112[1]);
  lightTwinkle(star113[0],star113[1]);
  lightTwinkle(star114[0],star114[1]);
  lightTwinkle(star115[0],star115[1]);
  lightTwinkle(star116[0],star116[1]);
  lightTwinkle(star117[0],star117[1]);
  lightTwinkle(star118[0],star118[1]);
  lightTwinkle(star119[0],star119[1]);
  lightTwinkle(star120[0],star120[1]);
  lightTwinkle(star121[0],star121[1]);
  lightTwinkle(star122[0],star122[1]);
  lightTwinkle(star123[0],star123[1]);
  lightTwinkle(star124[0],star124[1]);
  lightTwinkle(star125[0],star125[1]);
  lightTwinkle(star126[0],star126[1]);
  lightTwinkle(star127[0],star127[1]);
  lightTwinkle(star128[0],star128[1]);
  lightTwinkle(star129[0],star129[1]);
  lightTwinkle(star130[0],star130[1]);
  lightTwinkle(star131[0],star131[1]);
  lightTwinkle(star132[0],star132[1]);
  lightTwinkle(star133[0],star133[1]);
  lightTwinkle(star134[0],star134[1]);
  lightTwinkle(star135[0],star135[1]);
  lightTwinkle(star136[0],star136[1]);
  lightTwinkle(star137[0],star137[1]);
  lightTwinkle(star138[0],star138[1]);
  lightTwinkle(star139[0],star139[1]);
  lightTwinkle(star140[0],star140[1]);
  lightTwinkle(star141[0],star141[1]);
  lightTwinkle(star142[0],star142[1]);
  lightTwinkle(star143[0],star143[1]);
  lightTwinkle(star144[0],star144[1]);
  lightTwinkle(star145[0],star145[1]);
  lightTwinkle(star146[0],star146[1]);
  lightTwinkle(star147[0],star147[1]);
  lightTwinkle(star148[0],star148[1]);
  lightTwinkle(star149[0],star149[1]);
  lightTwinkle(star150[0],star150[1]);
  lightTwinkle(star151[0],star151[1]);
  lightTwinkle(star152[0],star152[1]);
  lightTwinkle(star153[0],star153[1]);
  lightTwinkle(star154[0],star154[1]);
  lightTwinkle(star155[0],star155[1]);
  lightTwinkle(star156[0],star156[1]);
  lightTwinkle(star157[0],star157[1]);
  lightTwinkle(star158[0],star158[1]);
  lightTwinkle(star159[0],star159[1]);
  lightTwinkle(star160[0],star160[1]);
  lightTwinkle(star161[0],star161[1]);
  lightTwinkle(star162[0],star162[1]);
  lightTwinkle(star163[0],star163[1]);
  lightTwinkle(star164[0],star164[1]);
  

}
void lightTwinkle(int X, int Y) {
  if (dist(mouseX, mouseY, X, Y) < rad) {
    for (int i=0; i<50; i += 5) {
      fill(255, 255, 0, 5);
      ellipse(X, Y, 75-i, 75-i);
      fill(255, 250, 255, 10);
      ellipse(X, Y, i/2, i/2);
    }
  }
}


void mousePressed() {
  if (dist(mouseX, mouseY, sunX, sunY)<rad) {
    sun = !sun;
  }
}



