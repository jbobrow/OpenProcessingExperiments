
//lazy way to GreenGreenGrass,Hello Mies!!
//by Xinhan Yen, Email:archi730@hotmail.com
int r=random(5, 12);
void setup() {
  size(480, 200);
  background(151, 185, 200+second()/2);
  fill(48, 83, 164-second()/2);
  drawVilla();
}
void draw() {
  drawGGRSYG();
  drawGGRSYG2();
  drawGGRSYG3();
  drawGGRSLG();
  drawGGRSLG2();
  drawGGRSDG();
  drawGGRSDG2();
}
//yellowgreen
void drawGGRSYG() {
  frameRate(1);
  strokeWeight(1);
  stroke(180-random(20), 213, 22, 50+random(10));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=140+noise(ynoise)*100;
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
//yellowgreen2
void drawGGRSYG2() {
  frameRate(1);
  strokeWeight(1);
  stroke(180-random(20), 213, 22, 50+random(10));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=117+noise(ynoise)*100;
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
//yellowgreen3
void drawGGRSYG3() {
  frameRate(1);
  strokeWeight(1);
  stroke(180-random(20), 213, 22, 50+random(10));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=133+noise(ynoise)*100;
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
//darkgreen
void drawGGRSDG() {
  frameRate(1);
  strokeWeight(1);
  stroke(36, 89, 11, 20+random(5));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=152+noise(ynoise)*80;
    if (lastx>-999) {
      line(x+1, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
//darkgreen2
void drawGGRSDG2() {
  frameRate(1);
  strokeWeight(1);
  stroke(36, 89, 11, 20+random(5));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=127+noise(ynoise)*80;
    if (lastx>-999) {
      line(x+1, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
  noFill();
  stroke(100);
  strokeWeight(12);
  rect(width/2, height/2, 480, 200);
}

//lightgreen
void drawGGRSLG() {
  frameRate(12);
  strokeWeight(1);
  stroke(67, 145, 23, 30+random(50));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=143+noise(ynoise)*80;
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
//lightgreen2
void drawGGRSLG2() {
  frameRate(12);
  strokeWeight(1);
  stroke(67, 145, 23, 30+random(50));
  int step=r;
  float nlevel=0.2;
  float lastx=-999;
  float lasty=-999;
  float ynoise=random(10);
  float y;
  int border=5;
  for (int x=0;x<=width;x+=step) {
    y=128+noise(ynoise)*80;
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
    ynoise+=nlevel;
  }
}
void drawVilla() {
  rectMode(CENTER);
  strokeWeight(1);
  stroke(147, 178, 199, 80);
  fill(220, 235, 230);
  rect(width/2, height/2+18, 280, 60);
  strokeWeight(4);
  stroke(150);
  line(width/2-145, 90, width/2+145, 90);
  line(width/2-145, 146, width/2+145, 146);
  for (int x=50;x<=190;x+=35)
  {
    line(2*x, 90, 2*x, 146);
  }
  strokeWeight(3);
  line(95, 95, width/2, 95);

}

