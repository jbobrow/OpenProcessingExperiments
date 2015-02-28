
          int x, y;
int x1, y1;
int x2, y2;
int x3, y3;
int x4, y4;
int x5, y5;
int x6, y6;
int x7, y7;
int x8, y8;
int x9, y9;
int x10, y10;
int x11, y11;
int x12, y12;
int x13, y13;

int etape=0;

void setup() {
  frameRate(250);
  size(870,600);
  background(#888888);
  x = 21;
  y = 339;
  x1 = 141;
  y1 = 93;
  x2 = 144;
  y2 = 174;
  x3 = 303;
  y3 = 276;
  x4 = 303;
  y4 = 272;
  x5 = 462;
  y5 = 6;
  x6 = 217;
  y6 = 270;
  x7 = 405;
  y7 = 174;
  x8 = 435;
  y8 = 174;
  x9 = 507;
  y9 = 270;
  x10 = 711;
  y10 = 126;
  x11 = 711;
  y11 = 126;
  x12 = 219;
  y12 = 399;
  x13 = 348;
  y13 = 456;
}
void draw() {
  println(frameRate);
  smooth();
  strokeWeight(5);

  //ligne rouge

  if(etape == 0) {
    if(bouger(624,360)) {
      etape++;
    }
  }
  if(etape == 1) {
    if(bouger(759,369)) {
      etape++;
    }
  }
  if(etape == 2) {
    if(bouger(846,459)) {
      etape++;
    }
  }

  stroke(#CC0033);
  point(x,y);

  //ligne bleue

  if(etape == 3) {
    if(bouger1(216,93)) {
      etape++;
    }
  }
  if(etape == 4) {
    if(bouger1(216,270)) {
      etape++;
    }
  }
  if(etape == 5) {
    if(bouger1(348,270)) {
      etape++;
    }
  }
  if(etape == 6) {
    if(bouger1(348,510)) {
      etape++;
    }
  }

  stroke(#00CCFF);
  point(x1,y1);

  //ligne rose

  if(etape == 7) {
    if(bouger2(557,174)) {
      etape++;
    }
  }
  if(etape == 8) {
    if(bouger2(574,423)) {
      etape++;
    }
  }

  stroke(#FF0066);
  point(x2,y2);

  //ligne violette

  if(etape == 9) {
    if(bouger3(303,369)) {
      etape++;
    }
  }
  if(etape == 10) {
    if(bouger3(486,390)) {
      etape++;
    }
  }
  if(etape == 11) {
    if(bouger3(507,270)) {
      etape++;
    }
  }
  if(etape == 12) {
    if(bouger3(330,246)) {
      etape++;
    }
  }
  if(etape == 13) {
    if(bouger3(303,369)) {
      etape++;
    }
  }

  stroke(#6666FF);
  point(x3,y3);

  //ligne orange

  if(etape == 14) {
    if(bouger4(288,75)) {
      etape++;
    }
  }
  if(etape == 15) {
    if(bouger4(507,63)) {
      etape++;
    }
  }
  if(etape == 16) {
    if(bouger4(519,258)) {
      etape++;
    }
  }
  if(etape == 17) {
    if(bouger4(507,270)) {
      etape++;
    }
  }

  stroke(#ff6600);
  point(x4,y4);


  //ligne jaune

  if(etape == 18) {
    if(bouger5(462,492)) {
      etape++;
    }
  }
  if(etape == 19) {
    if(bouger5(678,540)) {
      etape++;
    }
  }

  stroke(#FFFF22);
  point(x5,y5);

  //ligne violette 2 

  if(etape == 20) {
    if(bouger6(219,402)) {
      etape++;
    }
  }
  if(etape == 21) {
    if(bouger6(168,540)) {
      etape++;
    }
  }

  stroke(#663399);
  point(x6,y6);

  //lignes vertes 1 et 2

  if(etape == 22) {
    if(bouger7(405,147)) {
      etape++;
    }
  }
  if(etape == 23) {
    if(bouger8(405,90)) {
      etape++;
    }
  }

  stroke(#66CC33);
  point(x7,y7);
  point(x8,y8);

  //lignes marrons 1, 2 et 3  
  if(etape == 24) {
    if(bouger9(540,270)) {
      etape++;
    }
  }
  if(etape == 25) {
    if(bouger9(555,201)) {
      etape++;
    }
  }
  if(etape == 26) {
    if(bouger9(690,175)) {
      etape++;
    }
  }
  if(etape == 27) {
    if(bouger9(711,126)) {
      etape++;
    }
  }
  if(etape == 28) {
    if(bouger10(711,69)) {
      etape++;
    }
  }  
  if(etape == 28) {
    if(bouger11(753,69)) {
      etape++;
    }
  }

  stroke(#CC6600);
  point(x9,y9);
  point(x10,y10);
  point(x11,y11);

  //lignes grises 1 et 2

  if(etape == 29) {
    if(bouger12(480,399)) {
      etape++;
    }
  }  
  if(etape == 30) {
    if(bouger12(486,390)) {
      etape++;
    }
  }
  if(etape == 31) {
    if(bouger13(615,456)) {
      etape++;
    }
  }
  if(etape == 32) {
    if(bouger13(678,540)) {
      etape++;
    }
  }
  if(etape == 33) {
    if(bouger13(860,540)) {
      etape++;
    }
  }

  stroke(#CCCCCC);
  point(x12,y12);
  point(x13,y13);
}

boolean bouger(int x_destination, int y_destination) {
  boolean fini = true;
  if(x<x_destination) {
    fini = false;
    x = x + 1;
  }
  if(x>x_destination) {
    fini = false;
    x = x - 1;
  }
  if(y<y_destination) {
    fini =  false;
    y = y + 1;
  }
  if(y>y_destination) {
    fini =  false;
    y = y - 1;
  }
  return fini;
}

boolean bouger1(int x1_destination, int y1_destination) {
  boolean fini = true;
  if(x1<x1_destination) {
    fini = false;
    x1 = x1 + 1;
  }
  if(x1>x1_destination) {
    fini = false;
    x1 = x1 - 1;
  }
  if(y1<y1_destination) {
    fini =  false;
    y1 = y1 + 1;
  }
  if(y1>y1_destination) {
    fini =  false;
    y1 = y1 - 1;
  }
  return fini;
}

boolean bouger2(int x2_destination, int y2_destination) {
  boolean fini = true;
  if(x2<x2_destination) {
    fini = false;
    x2 = x2 + 1;
  }
  if(x2>x2_destination) {
    fini = false;
    x2 = x2 - 1;
  }
  if(y2<y2_destination) {
    fini =  false;
    y2 = y2 + 1;
  }
  if(y2>y2_destination) {
    fini =  false;
    y2 = y2 - 1;
  }
  return fini;
}

boolean bouger3(int x3_destination, int y3_destination) {
  boolean fini = true;
  if(x3<x3_destination) {
    fini = false;
    x3 = x3 + 1;
  }
  if(x3>x3_destination) {
    fini = false;
    x3 = x3 - 1;
  }
  if(y3<y3_destination) {
    fini =  false;
    y3 = y3 + 1;
  }
  if(y3>y3_destination) {
    fini =  false;
    y3 = y3 - 1;
  }
  return fini;
}

boolean bouger4(int x4_destination, int y4_destination) {
  boolean fini = true;
  if(x4<x4_destination) {
    fini = false;
    x4 = x4 + 1;
  }
  if(x4>x4_destination) {
    fini = false;
    x4 = x4 - 1;
  }
  if(y4<y4_destination) {
    fini =  false;
    y4 = y4 + 1;
  }
  if(y4>y4_destination) {
    fini =  false;
    y4 = y4 - 1;
  }
  return fini;
}

boolean bouger5(int x5_destination, int y5_destination) {
  boolean fini = true;
  if(x5<x5_destination) {
    fini = false;
    x5 = x5 + 1;
  }
  if(x5>x5_destination) {
    fini = false;
    x5 = x5 - 1;
  }
  if(y5<y5_destination) {
    fini =  false;
    y5 = y5 + 1;
  }
  if(y5>y5_destination) {
    fini =  false;
    y5 = y5 - 1;
  }
  return fini;
}

boolean bouger6(int x6_destination, int y6_destination) {
  boolean fini = true;
  if(x6<x6_destination) {
    fini = false;
    x6 = x6 + 1;
  }
  if(x6>x6_destination) {
    fini = false;
    x6 = x6 - 1;
  }
  if(y6<y6_destination) {
    fini =  false;
    y6 = y6 + 1;
  }
  if(y6>y6_destination) {
    fini =  false;
    y6 = y6 - 1;
  }
  return fini;
}

boolean bouger7(int x7_destination, int y7_destination) {
  boolean fini = true;
  if(x7<x7_destination) {
    fini = false;
    x7 = x7 + 1;
  }
  if(x7>x7_destination) {
    fini = false;
    x7 = x7 - 1;
  }
  if(y7<y7_destination) {
    fini =  false;
    y7 = y7 + 1;
  }
  if(y7>y7_destination) {
    fini =  false;
    y7 = y7 - 1;
  }
  return fini;
}

boolean bouger8(int x8_destination, int y8_destination) {
  boolean fini = true;
  if(x8<x8_destination) {
    fini = false;
    x8 = x8 + 1;
  }
  if(x8>x8_destination) {
    fini = false;
    x8 = x8 - 1;
  }
  if(y8<y8_destination) {
    fini =  false;
    y8 = y8 + 1;
  }
  if(y8>y8_destination) {
    fini =  false;
    y8 = y8 - 1;
  }
  return fini;
}

boolean bouger9(int x9_destination, int y9_destination) {
  boolean fini = true;
  if(x9<x9_destination) {
    fini = false;
    x9 = x9 + 1;
  }
  if(x9>x9_destination) {
    fini = false;
    x9 = x9 - 1;
  }
  if(y9<y9_destination) {
    fini =  false;
    y9 = y9 + 2;
  }
  if(y9>y9_destination) {
    fini =  false;
    y9 = y9 - 1;
  }
  return fini;
}

boolean bouger10(int x10_destination, int y10_destination) {
  boolean fini = true;
  if(x10<x10_destination) {
    fini = false;
    x10 = x10 + 1;
  }
  if(x10>x10_destination) {
    fini = false;
    x10 = x10 - 1;
  }
  if(y10<y10_destination) {
    fini =  false;
    y10 = y10 + 1;
  }
  if(y10>y10_destination) {
    fini =  false;
    y10 = y10 - 1;
  }
  return fini;
}

boolean bouger11(int x11_destination, int y11_destination) {
  boolean fini = true;
  if(x11<x11_destination) {
    fini = false;
    x11 = x11 + 1;
  }
  if(x11>x11_destination) {
    fini = false;
    x11 = x11 - 1;
  }
  if(y11<y11_destination) {
    fini =  false;
    y11 = y11 + 1;
  }
  if(y11>y11_destination) {
    fini =  false;
    y11 = y11 - 1;
  }
  return fini;
}

boolean bouger12(int x12_destination, int y12_destination) {
  boolean fini = true;
  if(x12<x12_destination) {
    fini = false;
    x12 = x12 + 1;
  }
  if(x12>x12_destination) {
    fini = false;
    x12 = x12 - 1;
  }
  if(y12<y12_destination) {
    fini =  false;
    y12 = y12 + 1;
  }
  if(y12>y12_destination) {
    fini =  false;
    y12 = y12 - 1;
  }
  return fini;
}

boolean bouger13(int x13_destination, int y13_destination) {
  boolean fini = true;
  if(x13<x13_destination) {
    fini = false;
    x13 = x13 + 1;
  }
  if(x13>x13_destination) {
    fini = false;
    x13 = x13 - 1;
  }
  if(y13<y13_destination) {
    fini =  false;
    y13 = y13 + 1;
  }
  if(y13>y13_destination) {
    fini =  false;
    y13 = y13 - 1;
  }
  return fini;
}               
