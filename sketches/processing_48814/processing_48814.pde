
int lng = 2;

int x = 80;
int y = 80;

void setup() {
  size(430, 430);

  background(255);

  smooth();
}

void draw() {
  colorMode(RGB, 255, 255, 255);

  background(255);

  stroke(0, 200, 0);

  phase14(x, y, x+lng, y);

  phase18(x, y+lng*50, x+lng, y+lng*30);

  phase26(x+lng*30, y+lng*40, x+lng*40, y+lng*40);

  phase31(x-lng*40, y+lng*75, x-lng*40, y+lng*75);

  phase36(x+lng*40, y+lng*80, x+lng*40, y+lng*80);

  phase45(x+lng*100, y+lng*100, x+lng*100, y+lng*100);

  flowers();
}

//38きれい！！！！！！！！

//*************************************************1**

void phase1(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
}

void phase2(int x1, int y1, int x2, int y2) {
  phase1(x1, y1, x2, y2);

  pushMatrix();
  translate(x1, y1);
  rotate(PI/2);
  phase1(0, 0, lng, 0);
  popMatrix();
}

void phase3(int x1, int y1, int x2, int y2) {
  phase2(x1, y1, x2, y2);

  pushMatrix();
  translate(x1+lng, y2+lng);
  rotate(PI/2);
  phase2(0, 0, lng, 0);
  popMatrix();
}

void phase4(int x1, int y1, int x2, int y2) {
  phase3(x1, y1, x2, y2);

  pushMatrix();
  translate(x1+lng*3, y2+lng);
  rotate(PI/2);
  phase3(0, 0, lng, 0);
  popMatrix();
}

void phase5(int x1, int y1, int x2, int y2) {
  phase4(x1, y1, x2, y2);

  pushMatrix();
  translate(x1+lng*5, y2-lng);
  rotate(PI/2);
  phase4(0, 0, lng, 0);
  popMatrix();
}


void phase6(int x1, int y1, int x2, int y2) {
  phase5(x1, y1, x2, y2);

  pushMatrix();
  translate(x1+lng*5, y2-lng*5);
  rotate(PI/2);
  phase5(0, 0, lng, 0);
  popMatrix();
}


void phase7(int x1, int y1, int x2, int y2) {
  phase6(x1, y1, x2, y2);

  pushMatrix();
  translate(x1+lng*5, y2-lng*3);
  rotate(PI/2);
  phase6(0, 0, lng, 0);
  popMatrix();
}

void phase8(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase7(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*7, y2);
  rotate(PI/2);
  phase7(0, 0, lng, 0);
  popMatrix();
}


void phase9(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase8(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*5, y2+lng*5);
  rotate(PI/2);
  phase8(0, 0, lng, 0);
  popMatrix();
}

//この辺からあきらめ＼(^o^)／

void phase10(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase9(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*10, y2);
  rotate(PI/2);
  phase9(0, 0, lng, 0);
  popMatrix();
}

void phase11(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase10(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*20, y2+lng*3);
  rotate(PI/2);
  phase10(0, 0, lng, 0);
  popMatrix();
}

void phase12(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase11(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*40, y2+lng*10);
  rotate(PI);
  phase11(0, 0, lng, 0);
  popMatrix();
}

void phase13(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase12(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*80, y2+lng*10);
  rotate(PI);
  phase12(0, 0, lng, 0);
  popMatrix();
}

void phase14(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase13(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*120, y2+lng*10);
  rotate(PI);
  phase13(0, 0, lng, 0);
  popMatrix();
}

//*************************************************2**

void phase15(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase10(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*5, y2-lng*5);
  rotate(PI);
  phase10(0, 0, lng, 0);
  popMatrix();
}

void phase16(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase15(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*5, y2+lng*10);
  rotate(PI);
  phase15(0, 0, lng, 0);
  popMatrix();
}

void phase17(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase16(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1-lng*3, y2+lng*50);
  rotate(PI);
  phase16(0, 0, lng, 0);
  popMatrix();
}

void phase18(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase17(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1-lng*3, y2+lng*100);
  rotate(PI);
  phase17(0, 0, lng, 0);
  popMatrix();
}

//*****************************************

void phase19(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase8(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*10, y2+lng*5);
  rotate(PI/2);
  phase8(0, 0, lng, 0);
  popMatrix();
}

void phase20(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase19(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*5, y2);
  rotate(PI/2);
  phase19(0, 0, lng, 0);
  popMatrix();
}

void phase21(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase20(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*15, y2+lng*5);
  rotate(PI/2);
  phase20(0, 0, lng, 0);
  popMatrix();
}

void phase22(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase21(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*30, y2);
  rotate(PI/2);
  phase21(0, 0, lng, 0);
  popMatrix();
}

void phase23(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase21(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*30, y2);
  rotate(PI/2);
  phase21(0, 0, lng, 0);
  popMatrix();
}

void phase24(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase21(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*30, y2);
  rotate(PI/2);
  phase21(0, 0, lng, 0);
  popMatrix();
}

void phase25(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase24(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*60, y2+lng*10);
  rotate(PI);
  phase24(0, 0, lng, 0);
  popMatrix();
}

void phase26(int x1, int y1, int x2, int y2) {
  //stroke(0);
  //phase25(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*70, y2+lng*5);
  rotate(PI);
  phase25(0, 0, lng, 0);
  popMatrix();
}

//***********************************************

void phase27(int x1, int y1, int x2, int y2) {
  //stroke(0);
  //phase25(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*70, y2+lng*5);
  rotate(PI);
  phase9(0, 0, lng, 0);
  popMatrix();
}

void phase28(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase27(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*65, y2-lng*70);
  rotate(PI/2);
  phase27(0, 0, lng, 0);
  popMatrix();
}

void phase29(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase28(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*80, y2-lng*70);
  rotate(PI/2);
  phase28(0, 0, lng, 0);
  popMatrix();
}

void phase30(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase29(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*180, y2-lng*5);
  rotate(PI);
  phase29(0, 0, lng, 0);
  popMatrix();
}

void phase31(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase30(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*220, y2-lng*5);
  rotate(PI);
  phase30(0, 0, lng, 0);
  popMatrix();
}

//**************************************************

void phase32(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase10(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1, y2);
  rotate(PI);
  phase10(0, 0, lng, 0);
  popMatrix();
}

void phase33(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase32(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*10, y2+lng*15);
  rotate(PI);
  phase32(0, 0, lng, 0);
  popMatrix();
}

void phase34(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase33(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*15, y2+lng*40);
  rotate(PI);
  phase33(0, 0, lng, 0);
  popMatrix();
}

void phase35(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase34(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*17, y2+lng*60);
  rotate(PI);
  phase34(0, 0, lng, 0);
  popMatrix();
}

void phase36(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase35(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*40, y2+lng*65);
  rotate(PI);
  phase10(0, 0, lng, 0);
  popMatrix();
}

void phase37(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase8(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1, y2);
  rotate(PI);
  phase8(0, 0, lng, 0);
  popMatrix();
}

void phase38(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase37(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1, y2);
  rotate(PI/2);
  phase37(0, 0, lng, 0);
  popMatrix();
}

void phase39(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase38(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1-lng*10, y2-lng*5);
  rotate(PI/2);
  phase38(0, 0, lng, 0);
  popMatrix();
}

void phase40(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase39(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1-lng*20, y2-lng*15);
  rotate(PI/2);
  phase39(0, 0, lng, 0);
  popMatrix();
}

void phase41(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase40(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*20, y2+lng*30);
  rotate(0);
  phase40(0, 0, lng, 0);
  popMatrix();
}

void phase42(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase41(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*30, y2+lng*30);
  rotate(PI/2);
  phase38(0, 0, lng, 0);
  popMatrix();
}

void phase43(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase42(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*40, y2+lng*30);
  rotate(PI);
  phase37(0, 0, lng, 0);
  popMatrix();
}

void phase44(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase43(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*20, y2-lng*5);
  rotate(PI/2);
  phase10(0, 0, lng, 0);
  popMatrix();
}

void phase45(int x1, int y1, int x2, int y2) {
  //stroke(0);
  phase44(x1, y1, x2, y2);

  //stroke(255,0,0);
  pushMatrix();
  translate(x1+lng*15, y2-lng*13);
  rotate(0);
  phase9(0, 0, lng, 0);
  popMatrix();
}

void flowers() {
  colorMode(HSB, 360, 100, 100);

  for (int i = 0; i < 6;i++) {
    stroke(60*i, 100, 100);
    phase38(250+i*30, 30+i*20, 250+i*30, 30+i*20);
    phase38(30+i*30, 300+i*20, 30+i*30, 300+i*20);
  }
}

void mousePressed() {
  lng++;
}

void keyPressed() {
  lng = 2;
}


