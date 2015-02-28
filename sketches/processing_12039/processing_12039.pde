
/*Segmented Caterpillar
By: Caroline Sievers
September 8th, 2010
http://www.insectpod.com/images/20080211_
steve_jackson_black_swallowtail_caterpillar_big.jpg*/

void setup(){
  size(600, 500);
  background(150, 175, 50);
  mainBranch();
  littleBall();
  Branch1();
  Branch2();
  middleSeg();
  middleEllipse();
  littleEllipse();
  middleEllipse2();
  littleEllipse2();
  seg1();
  middleEllipse3();
  littleEllipse3();
  middleEllipse4();
  littleEllipse4();
  seg2();
  middleEllipse5();
  littleEllipse5();
  middleEllipse6();
  littleEllipse6();
  seg3();
  middleEllipse7();
  littleEllipse7();
  middleEllipse8();
  littleEllipse8();
  seg4();
  middleEllipse9();
  littleEllipse9();
  middleEllipse10();
  littleEllipse10();
  seg5();
  middleEllipse11();
  littleEllipse11();
  middleEllipse12();
  littleEllipse12();
  seg6();
  middleEllipse13();
  littleEllipse13();
  middleEllipse14();
  littleEllipse14();
  seg7();
  middleEllipse15();
  littleEllipse15();
  middleEllipse16();
  littleEllipse16();
  }


//branch that caterpillar is on
void mainBranch(){
  fill(100, 140, 0);
  noStroke();
  smooth();
  int x1 = 525;
  int y1 = 100;
  int x2 = 550;
  int y2 = 120;
  int x3 = 220;
  int y3 = 500;
  int x4 = 180;
  int y4 = 500;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}

//little ball
void littleBall(){
  fill(120, 160, 0);
  noStroke();
  smooth();
  int x = 535;
  int y = 115;
  int w = 45;
  int h = 50;
  ellipse(x, y, w, h);
}

//branch1
void Branch1(){
  fill(110, 150, 0);
  noStroke();
  smooth();
  int x1 = 445;
  int y1 = 0;
  int x2 = 470;
  int y2 = 0;
  int x3 = 540;
  int y3 = 95;
  int x4 = 520;
  int y4 = 100;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}

//branch2
void Branch2(){
  fill(110, 150, 0);
  noStroke();
  smooth();
  int x1 = 590;
  int y1 = 0;
  int x2 = 570;
  int y2 = 0;
  int x3 = 530;
  int y3 = 95;
  int x4 = 550; 
  int y4 = 100;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}

//middle segment of caterpillar
void middleSeg(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 265;
  int y1 = 320;
  int x2 = 310;
  int y2 = 265;
  int x3 = 350;
  int y3 = 310;
  int x4 = 300;
  int y4 = 370;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse(){
  fill(0);
  noStroke();
  smooth();
  int x = 312;
  int y = 328;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 312;
  int y = 328;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse2(){
  fill(0);
  noStroke();
  smooth();
  int x = 295;
  int y = 305;
  int w = 24;
  int h = 24; 
  ellipse(x, y, w, h);
}
void littleEllipse2(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 295;
  int y = 305;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//first segment to the right of the middle segment
void seg1(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 310;
  int y1 = 265;
  int x2 = 350;
  int y2 = 215;
  int x3 = 390;
  int y3 = 265;
  int x4 = 350;
  int y4 = 310;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse3(){
  fill(0);
  noStroke();
  smooth();
  int x = 357;
  int y = 274;
  int w = 27;
  int h = 27; 
  ellipse(x, y, w, h);
} 
void littleEllipse3(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 357;
  int y = 274;
  int w = 17;
  int h = 17; 
  ellipse(x, y, w, h);
}
void middleEllipse4(){
  fill(0);
  noStroke();
  smooth();
  int x = 340;
  int y = 250;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse4(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 340;
  int y = 250;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//second segment to the right of the middle segment
void seg2(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 350;
  int y1 = 215;
  int x2 = 390;
  int y2 = 170;
  int x3 = 430;
  int y3 = 220;
  int x4 = 390;
  int y4 = 265;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse5(){
  fill(0);
  noStroke();
  smooth();
  int x = 397;
  int y = 229;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse5(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 397;
  int y = 229;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse6(){
  fill(0);
  noStroke();
  smooth();
  int x = 380;
  int y = 205;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse6(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 380;
  int y = 205;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//third segment to the right of the middle segment
void seg3(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 390;
  int y1 = 170;
  int x2 = 430;
  int y2 = 130;
  int x3 = 470;
  int y3 = 175;
  int x4 = 430;
  int y4 = 220;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse7(){
  fill(0);
  noStroke();
  smooth();
  int x = 437;
  int y = 185;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse7(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 437;
  int y = 185;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse8(){
  fill(0);
  noStroke();
  smooth();
  int x = 420;
  int y = 162;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse8(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 420;
  int y = 162;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//fourth segment to the right of the middle segment
void seg4(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 430;
  int y1 = 130;
  int x2 = 470;
  int y2 = 95;
  int x3 = 510;
  int y3 = 130;
  int x4 = 470;
  int y4 = 175;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse9(){
  fill(0);
  noStroke();
  smooth();
  int x = 475;
  int y = 142;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse9(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 475;
  int y = 142;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse10(){
  fill(0);
  noStroke();
  smooth();
  int x = 458;
  int y = 122;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse10(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 458;
  int y = 122;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//first segment to the left of the middle segment
void seg5(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 225;
  int y1 = 370;
  int x2 = 265;
  int y2 = 320;
  int x3 = 300;
  int y3 = 370;
  int x4 = 260;
  int y4 = 420;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse11(){
  fill(0);
  noStroke();
  smooth();
  int x = 268;
  int y = 381;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse11(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 268;
  int y = 381;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse12(){
  fill(0);
  noStroke();
  smooth();
  int x = 251;
  int y = 359;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse12(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 251;
  int y = 359;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//second segment to the left of the middle segment
void seg6(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 185;
  int y1 = 420;
  int x2 = 225;
  int y2 = 370;
  int x3 = 260;
  int y3 = 420;
  int x4 = 220;
  int y4 = 465;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse13(){
  fill(0);
  noStroke();
  smooth();
  int x = 230;
  int y = 429;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse13(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 230;
  int y = 429;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse14(){
  fill(0);
  noStroke();
  smooth();
  int x = 213;
  int y = 407;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse14(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 213;
  int y = 407;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

//third segment to the left of the middle segment
void seg7(){
  fill(255);
  stroke(0);
  smooth();
  int x1 = 155;
  int y1 = 460;
  int x2 = 185;
  int y2 = 420;
  int x3 = 220;
  int y3 = 465;
  int x4 = 190;
  int y4 = 495;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
void middleEllipse15(){
  fill(0);
  noStroke();
  smooth();
  int x = 194;
  int y = 467;
  int w = 27;
  int h = 27;
  ellipse(x, y, w, h);
}
void littleEllipse15(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 194;
  int y = 467;
  int w = 17;
  int h = 17;
  ellipse(x, y, w, h);
}
void middleEllipse16(){
  fill(0);
  noStroke();
  smooth();
  int x = 178;
  int y = 449;
  int w = 24;
  int h = 24;
  ellipse(x, y, w, h);
}
void littleEllipse16(){
  fill(240, 200, 80);
  stroke(0);
  smooth();
  int x = 178;
  int y = 449;
  int w = 14;
  int h = 14;
  ellipse(x, y, w, h);
}

