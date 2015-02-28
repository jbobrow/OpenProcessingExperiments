
PImage chud;
PImage crunch;
PImage HROKK;
PImage KABLAM;
PImage KLUGG;
PImage KRAK;
PImage PO2; 
PImage PO;
PImage BADOOM;
PImage BKOW;
PImage CHOK;
PImage Schrakk;
PImage Shizit;
PImage KRASH;
PImage THOOM;
PImage THUM;
PImage THWAKKK;
PImage THWUMP;
PImage WAK;
PImage WHAM;
PImage WHAPO;
PImage WHOKK;
PImage WHOOM;

void setup() {
  size(600, 300);
  colorMode(HSB, 360, 100, 100, 255);
  chud = loadImage("CHUD.png");
  crunch = loadImage("CRUNCH.png");
  HROKK = loadImage("HROKK.png");
  KABLAM = loadImage("KABLAM.png");
  KLUGG = loadImage("KLUGG.png");
  KRAK = loadImage("KRAK.png");   
  PO2 = loadImage("PO2.png");
  PO = loadImage("PO.png");
  BADOOM = loadImage("BADOOM.png");
  BKOW = loadImage("BKOW.png");
  CHOK = loadImage("CHOK.png");
  Schrakk = loadImage("Schrakk.png");
  Shizit = loadImage("Shizit.png");
  KRASH = loadImage("KRASH.png");
  THOOM = loadImage("THOOM.png");
  THUM = loadImage("THUM.png");
  THWAKKK = loadImage("THWAKKK.png");
  THWUMP = loadImage("THWUMP.png");
  WAK = loadImage("WAK.png");
  WHAM = loadImage("WHAM.png");
  WHAPO = loadImage("WHAPO.png");
  WHOKK = loadImage("WHOKK.png");
  WHOOM = loadImage("Whoom.png");
  
  frameRate(1);
  imageMode(CENTER);
  tint(200,100);
}
 
void draw() {
  //random values 
  float ro = random(0, radians(360));  //random rotation
  

  
 

  float x = random(width);
  float y = random(height);
  float d = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(chud, x, y, d, d);
  //popMatrix();
  
  float x2 = random(width);
  float y2 = random(height);
  float d2 = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(crunch, x2, y2, d2, d2);
  //popMatrix();
  
  float x3 = random(width);
  float y3 = random(height);
  float d3 = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(HROKK, x3, y3, d3, d3);
  //popMatrix();
  
  float x4 = random(width);
  float y4 = random(height);
  float d4 = random(50, 200);
  image(KABLAM, x4, y4, d4, d4);
  
  float x5 = random(width);
  float y5 = random(height);
  float d5 = random(50, 200);
  image(KLUGG, x5, y5, d5, d5);
  
  float x6 = random(width);
  float y6 = random(height);
  float d6 = random(50, 200);
  image(KRAK, x6, y6, d6, d6);
  
  float x7 = random(width);
  float y7 = random(height);
  float d7 = random(50, 200);
  image(PO, x7, y7, d7, d7);
  
  float x8 = random(width);
  float y8 = random(height);
  float d8 = random(50, 200);
  image(PO2, x8, y8, d8, d8);
  
  float x9 = random(width);
  float y9 = random(height);
  float d9 = random(50, 200);
  image(BADOOM, x9, y9, d9, d9);
  
  float x10 = random(width);
  float y10 = random(height);
  float d10 = random(50, 200);
  image(BKOW, x10, y10, d10, d10);
  
  float x11 = random(width);
  float y11 = random(height);
  float d11 = random(50, 200);
  image(CHOK, x11, y11, d11, d11);
  
  float x12 = random(width);
  float y12 = random(height);
  float d12 = random(50, 200);
  image(Schrakk, x12, y12, d12, d12);
  
  float x13 = random(width);
  float y13 = random(height);
  float d13 = random(50, 200);
  image(Shizit, x13, y13, d13, d13);
  
  float x14 = random(width);
  float y14 = random(height);
  float d14 = random(50, 200);
  image(KRASH, x14, y14, d14, d14);
  
  float x15 = random(width);
  float y15 = random(height);
  float d15 = random(50, 200);
  image(THOOM, x15, y15, d15, d15);
  
  float x16 = random(width);
  float y16 = random(height);
  float d16 = random(50, 200);
  image(THUM, x16, y16, d16, d16);
  
  float x17 = random(width);
  float y17 = random(height);
  float d17 = random(50, 200);
  image(THWAKKK, x17, y17, d17, d17);
  
  float x18 = random(width);
  float y18 = random(height);
  float d18 = random(50, 200);
  image(THWUMP, x18, y18, d18, d18);
  
  float x19 = random(width);
  float y19 = random(height);
  float d19 = random(50, 200);
  image(WAK, x19, y19, d19, d19);
  
  float x20 = random(width);
  float y20 = random(height);
  float d20 = random(50, 200);
  image(WHAM, x20, y20, d20, d20);
  
  float x21 = random(width);
  float y21 = random(height);
  float d21 = random(50, 200);
  image(WHAPO, x21, y21, d21, d21);
  
  float x22 = random(width);
  float y22 = random(height);
  float d22 = random(50, 200);
  image(WHOKK, x22, y22, d22, d22);
  
  float x23 = random(width);
  float y23 = random(height);
  float d23 = random(50, 200);
  image(WHOOM, x23, y23, d23, d23);
  
  //REPEATS
  
  float x24 = random(width);
  float y24 = random(height);
  float d24 = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(chud, x24, y24, d24, d24);
  //popMatrix();
  
  float x25 = random(width);
  float y25 = random(height);
  float d25 = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(crunch, x25, y25, d25, d25);
  //popMatrix();
  
  float x26 = random(width);
  float y26 = random(height);
  float d26 = random(50, 200);
  //pushMatrix ();
  //rotate(ro);
  image(HROKK, x26, y26, d26, d26);
  //popMatrix();
  
  float x27 = random(width);
  float y27 = random(height);
  float d27 = random(50, 200);
  image(KABLAM, x27, y27, d27, d27);
  
  float x28 = random(width);
  float y28 = random(height);
  float d28 = random(50, 200);
  image(KLUGG, x28, y28, d28, d28);
  
  float x29 = random(width);
  float y29 = random(height);
  float d29 = random(50, 200);
  image(KRAK, x29, y29, d29, d29);
  
  float x30 = random(width);
  float y30 = random(height);
  float d30 = random(50, 200);
  image(PO, x30, y30, d30, d30);
  
  float x31 = random(width);
  float y31 = random(height);
  float d31 = random(50, 200);
  image(PO2, x31, y31, d31, d31);
  
  float x32 = random(width);
  float y32 = random(height);
  float d32 = random(50, 200);
  image(BADOOM, x32, y32, d32, d32);
  
  float x33 = random(width);
  float y33 = random(height);
  float d33 = random(50, 200);
  image(BKOW, x33, y33, d33, d33);
  
  float x34 = random(width);
  float y34 = random(height);
  float d34 = random(50, 200);
  image(CHOK, x34, y34, d34, d34);
  
  float x35 = random(width);
  float y35 = random(height);
  float d35 = random(50, 200);
  image(Schrakk, x35, y35, d35, d35);
  
  float x38 = random(width);
  float y38 = random(height);
  float d38 = random(50, 200);
  image(Shizit, x38, y38, d38, d38);
  
  float x36 = random(width);
  float y36 = random(height);
  float d36 = random(50, 200);
  image(KRASH, x36, y36, d36, d36);
  
  float x37 = random(width);
  float y37 = random(height);
  float d37 = random(50, 200);
  image(THOOM, x37, y37, d37, d37);
  
  float x39 = random(width);
  float y39 = random(height);
  image(THUM, x39, y39, d, d);
  
  float x40 = random(width);
  float y40 = random(height);
  image(THWAKKK, x40, y40, d17, d17);
  
  float x41 = random(width);
  float y41 = random(height);
  image(THWUMP, x41, y41, d18, d18);
  
  float x42 = random(width);
  float y42 = random(height);
  image(WAK, x42, y42, d19, d19);
  
  float x43 = random(width);
  float y43 = random(height);
  image(WHAM, x43, y43, d20, d20);
  
  float x44 = random(width);
  float y44 = random(height);
  image(WHAPO, x44, y44, d21, d21);
  
  float x45 = random(width);
  float y45 = random(height);
  image(WHOKK, x45, y45, d22, d22);
  
  float x46 = random(width);
  float y46 = random(height);
  image(WHOOM, x46, y46, d23, d23);
  
  //REPEAT AGAIN
  
  float x47 = random(width);
  float y47 = random(height);
  image(THUM, x47, y47, d, d);
  
  float x48 = random(width);
  float y48 = random(height);
  image(THWAKKK, x48, y48, d17, d17);
  
  float x49 = random(width);
  float y49 = random(height);
  image(THWUMP, x49, y49, d18, d18);
  
  float x50 = random(width);
  float y50 = random(height);
  image(WAK, x50, y50, d19, d19);
  
  float x51 = random(width);
  float y51 = random(height);
  image(WHAM, x51, y51, d20, d20);
  
  float x52 = random(width);
  float y52 = random(height);
  image(WHAPO, x52, y52, d21, d21);
  
  float x53 = random(width);
  float y53 = random(height);
  image(WHOKK, x53, y53, d22, d22);
  
  float x54 = random(width);
  float y54 = random(height);
  image(WHOOM, x54, y54, d23, d23);
  
  float x55 = random(width);
  float y55 = random(height);
  image(chud, x55, y55, d24, d24);
  
  float x56 = random(width);
  float y56 = random(height);
  image(crunch, x56, y56, d25, d25);
  
  float x57 = random(width);
  float y57 = random(height);
  image(HROKK, x57, y57, d26, d26);
  
  float x58 = random(width);
  float y58 = random(height);
  image(KABLAM, x58, y58, d27, d27);
  
  float x59 = random(width);
  float y59 = random(height);
  image(KLUGG, x59, y59, d28, d28);
  
  float x60 = random(width);
  float y60 = random(height);
  image(KRAK, x60, y60, d29, d29);
  
  float x61 = random(width);
  float y61 = random(height);
  image(PO, x61, y61, d30, d30);
  
  float x62 = random(width);
  float y62 = random(height);
  image(PO2, x62, y62, d31, d31);
  
  float x63 = random(width);
  float y63 = random(height);
  image(BADOOM, x63, y63, d32, d32);
  
  float x64 = random(width);
  float y64 = random(height);
  image(BKOW, x64, y64, d33, d33);
  
  float x65 = random(width);
  float y65 = random(height);
  image(CHOK, x65, y65, d34, d34);
  
  float x66 = random(width);
  float y66 = random(height);
  image(Schrakk, x66, y66, d35, d35);
  
  float x67 = random(width);
  float y67 = random(height);
  image(Shizit, x67, y67, d38, d38);
  
  float x68 = random(width);
  float y68 = random(height);
  image(KRASH, x68, y68, d36, d36);
  
  //REPEAT THIRD TIME
  
  float x69 = random(width);
  float y69 = random(height);
  image(THUM, x69, y69, d, d);
  
  float x70 = random(width);
  float y70 = random(height);
  image(THWAKKK, x70, y70, d17, d17);
  
  float x71 = random(width);
  float y71 = random(height);
  image(THWUMP, x71, y71, d18, d18);
  
  float x72 = random(width);
  float y72 = random(height);
  image(WAK, x72, y72, d19, d19);
  
  float x73 = random(width);
  float y73 = random(height);
  image(WHAM, x73, y73, d20, d20);
  
  float x74 = random(width);
  float y74 = random(height);
  image(WHAPO, x74, y74, d21, d21);
  
  float x75 = random(width);
  float y75 = random(height);
  image(WHOKK, x75, y75, d22, d22);
  
  float x76 = random(width);
  float y76 = random(height);
  image(WHOOM, x76, y76, d23, d23);
  
  float x77 = random(width);
  float y77 = random(height);
  image(chud, x77, y77, d24, d24);
  
  float x78 = random(width);
  float y78 = random(height);
  image(crunch, x78, y78, d25, d25);
  
  float x79 = random(width);
  float y79 = random(height);
  image(HROKK, x79, y79, d26, d26);
  
  float x80 = random(width);
  float y80 = random(height);
  image(KABLAM, x80, y80, d27, d27);
  
  float x81 = random(width);
  float y81 = random(height);
  image(KLUGG, x81, y81, d28, d28);
  
  float x82 = random(width);
  float y82 = random(height);
  image(KRAK, x82, y82, d29, d29);
  
  float x83 = random(width);
  float y83 = random(height);
  image(PO, x83, y83, d30, d30);
  
  float x84 = random(width);
  float y84 = random(height);
  image(PO2, x84, y84, d31, d31);
  
  float x85 = random(width);
  float y85 = random(height);
  image(BADOOM, x85, y85, d32, d32);
  
  float x86 = random(width);
  float y86 = random(height);
  image(BKOW, x86, y86, d33, d33);
  
  float x87 = random(width);
  float y87 = random(height);
  image(CHOK, x87, y87, d34, d34);
  
  float x88 = random(width);
  float y88 = random(height);
  image(Schrakk, x88, y88, d35, d35);
  
  float x89 = random(width);
  float y89 = random(height);
  image(Shizit, x89, y89, d38, d38);
  
  float x90 = random(width);
  float y90 = random(height);
  image(KRASH, x90, y90, d36, d36);
  
  //FOURTH TIME
  
  float x91 = random(width);
  float y91 = random(height);
  image(THUM, x91, y91, d, d);
  
  float x92 = random(width);
  float y92 = random(height);
  image(THWAKKK, x92, y92, d17, d17);
  
  float x93 = random(width);
  float y93 = random(height);
  image(THWUMP, x93, y93, d18, d18);
  
  float x94 = random(width);
  float y94 = random(height);
  image(WAK, x94, y94, d19, d19);
  
  float x95 = random(width);
  float y95 = random(height);
  image(WHAM, x95, y95, d20, d20);
  
  float x96 = random(width);
  float y96 = random(height);
  image(WHAPO, x96, y96, d21, d21);
  
  float x97 = random(width);
  float y97 = random(height);
  image(WHOKK, x97, y97, d22, d22);
  
  float x98 = random(width);
  float y98 = random(height);
  image(WHOOM, x98, y98, d23, d23);
  
  float x99 = random(width);
  float y99 = random(height);
  image(chud, x99, y99, d24, d24);
  
  float x100 = random(width);
  float y100 = random(height);
  image(crunch, x100, y100, d25, d25);
  
  float x101 = random(width);
  float y101 = random(height);
  image(HROKK, x101, y101, d26, d26);
  
  float x102 = random(width);
  float y102 = random(height);
  image(KABLAM, x102, y102, d27, d27);
  
  float x103 = random(width);
  float y103 = random(height);
  image(KLUGG, x103, y103, d28, d28);
  
  float x104 = random(width);
  float y104 = random(height);
  image(KRAK, x104, y104, d29, d29);
  
  float x105 = random(width);
  float y105 = random(height);
  image(PO, x105, y105, d30, d30);
  
  float x106 = random(width);
  float y106 = random(height);
  image(PO2, x106, y106, d31, d31);
  
  float x107 = random(width);
  float y107 = random(height);
  image(BADOOM, x107, y107, d32, d32);
  
  float x108 = random(width);
  float y108 = random(height);
  image(BKOW, x108, y108, d33, d33);
  
  float x109 = random(width);
  float y109 = random(height);
  image(CHOK, x109, y109, d34, d34);
  
  float x110 = random(width);
  float y110 = random(height);
  image(Schrakk, x110, y110, d35, d35);
  
  //AGAIN WITH ROTATION
  
  float x111 = random(width);
  float y111 = random(height);
  pushMatrix ();
  rotate(ro);
  image(chud, x111, y111, d, d);
  popMatrix();
  
  float x112 = random(width);
  float y112 = random(height);
  pushMatrix ();
  rotate(ro);
  image(crunch, x112, y112, d2, d2);
  popMatrix();
  
  float x113 = random(width);
  float y113 = random(height);
  pushMatrix ();
  rotate(ro);
  image(HROKK, x113, y113, d3, d3);
  popMatrix();
  
  float x114 = random(width);
  float y114 = random(height);
  pushMatrix ();
  rotate(ro);
  image(KABLAM, x114, y114, d4, d4);
  popMatrix();
  
  float x115 = random(width);
  float y115 = random(height);
  pushMatrix ();
  rotate(ro);
  image(KLUGG, x115, y115, d5, d5);
  popMatrix();
  
  float x116 = random(width);
  float y116 = random(height);
  pushMatrix ();
  rotate(ro);
  image(KRAK, x116, y116, d6, d6);
  popMatrix();
  
  float x117 = random(width);
  float y117 = random(height);
  pushMatrix ();
  rotate(ro);
  image(PO, x117, y117, d7, d7);
  popMatrix();
  
  float x118 = random(width);
  float y118 = random(height);
  pushMatrix ();
  rotate(ro);
  image(PO2, x118, y118, d8, d8);
  
  float x119 = random(width);
  float y119 = random(height);
  pushMatrix ();
  rotate(ro);
  image(BADOOM, x119, y119, d9, d9);
  popMatrix();
  
  float x120 = random(width);
  float y120 = random(height);
  pushMatrix ();
  rotate(ro);
  image(BKOW, x120, y120, d10, d10);
  popMatrix();
  
  float x121 = random(width);
  float y121 = random(height);
  pushMatrix ();
  rotate(ro);
  image(CHOK, x121, y121, d11, d11);
  popMatrix();
  
  float x122 = random(width);
  float y122 = random(height);
  pushMatrix ();
  rotate(ro);
  image(Schrakk, x122, y122, d12, d12);
  popMatrix();
  
} 








