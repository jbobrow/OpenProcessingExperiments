
PFont font;
//hour
float hangle = 0.0;
float hoffsetx = 120;
float hoffsety = 100;
float hscalarx = 50;
float hspeed = 0.001;
//minute
float mangle = 0.0;
float moffsetx = 250;
float moffsety = 400;
float mscalarx = 50;
float mspeed = 0.005;
//second
float sangle = 0.0;
float soffsetx = 380;
float soffsety = 150;
float sscalarx = 50;
float sspeed = 0.1;

void setup () {
  size (600,600);
  smooth();
  font = loadFont ("LucidaConsole-48.vlw");
  textFont (font);
}

void draw() {
  // background (138, 162, 142);
  //fill (210,245,183,30); green background
  fill (0, 50);
  rect (0,0,width, height); 
  float h = hour();
  float m = minute();
  float s = second();

  if (h > 12) {
    h -= 12;
  }

  String hour = nf(int(h), 2);
  String minute = nf(int(m), 2);
  String second = nf(int(s), 2);

  fill(200);//font color
  //fill() = map (fill(), 0, 255, 0, TWO_PI);
  //float fill = map (fill(), 0, 255, 0, TWO_PI);
  textSize(70);

  //hour ellipse
  float hx = hoffsetx + cos(hangle) * hscalarx;
  float hy = hoffsety + sin(hangle) * hscalarx/2;
  text(hour, hx, hy, 120, 100);
  hangle = map (minute(), 0, 59, 0, TWO_PI);
  strokeWeight (.5);
  smooth ();
  noFill ();
  //ellipse (170, 130, 120, 60);
  for (int i = 0; i < hour (); i += 1) {
    stroke (18+3*i, 190-6*i, 255-2*i);
    ellipse (170, 130, 10*i+ 120, 60 + 10*i);
  }

  //minute ellipse
  float mx = moffsetx + cos(mangle) * mscalarx;
  float my = moffsety + sin(mangle) * mscalarx/2;
  text(minute, mx, my, 250,400);
  mangle = map (second(), 0, 59, 0, TWO_PI);
  strokeWeight (.5);
  smooth ();
  noFill ();
  //ellipse (300, 430, 120, 60); 
  for (int i = 0; i < minute (); i += 1) {
    stroke (260, 15+2*i, 15);
    ellipse (300, 430, 10*i+ 120, 60 + 10*i);
  }
  //ellipse (moffsetx+mscalarx/4, moffsety+mscalarx/2, 2.2*mscalarx, 2.2*mscalarx/2);

  //second ellipse
  float sx = soffsetx + cos(sangle) * sscalarx;
  float sy = soffsety + sin(sangle) * sscalarx/2;
  text(second,sx,sy, 380, 150);
  float mil = millis() % 1000;
  sangle = map (mil, 0, 999, 0, TWO_PI);
  strokeWeight (.5);
  smooth ();
  noFill ();
  //ellipse (430, 180, 120, 60);
  for (int i = 0; i < second (); i += 1) {
    stroke (250-5*i, 239-2*i, 20+i);
    ellipse (430, 180, 10*i+ 120, 60 + 10*i);
  }
}


