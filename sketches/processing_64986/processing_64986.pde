
float X, Y;
float DIR_X1, DIR_Y1, DIR_X2, DIR_Y2;             //図形の位置
float Spx, Spy;         //図形のスピード
float Cx, Cy, Cx_t1, Cy_t1, Cx_t2;
float W;
float Angle, Angle1, Angle2, Angle3, Angle_t1, Angle_t2;
float R, R_t;
float Range;
int I;
Boolean Change = false;

float Rt1, Rt2;
float Ang1, Ang2;
float Rot1, Rot2;


void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(70, 99, 50);
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(15);
  
//neri()  
  DIR_Y1 = 3;
  DIR_X1 = 3;
  DIR_Y2 = 397;
  DIR_X2 = 397;
  Spy = 3;
  Spx = 3;
  Cx = width/2;
  Cy = height/2;
  Angle  = 180;
  Angle1 = 90;
  Angle2 = 0;
  Angle3 = 270;
  R = 150;
  Range = 2.5;
  
//ohayashi()  
  I = 0;
  
//tako()  
  W = width * sqrt(2);
  Cx_t1 = W / 4;
  Cy_t1 = 0;
  Cx_t2 = W * 3/4;
  R_t   = W / 4;
  Angle_t1 = 0;
  Angle_t2 = 180;
  
//tako2()
  Rt1 = 100;
  Rt2 = 30;
  Ang1 = Ang2 = 0;
  Rot1 = 5;
  Rot2 = 40;
  
}

void draw() {
  fadeOut();

  ohayashi();
  neri();
  tako();
  tako2();
}

void neri() {
  noStroke();
  int i, j;
  float x, y;

  fill(10, 99, 99);

  if (DIR_Y1 < 200) {
    DIR_Y1 += Spy;
    DIR_X1 += Spx;
    DIR_Y2 -= Spy;
    DIR_X2 -= Spx;
    //上・左・下・右
    for (i=0; i<15; i++) {
      ellipse(50 + i*10 + random(-Range, Range), DIR_Y1 + random(-Range, Range), 6, 6);
    }
    for (i=0; i<15; i++) {
      ellipse(DIR_X1 + random(-Range, Range), 210 + i*10 + random(-Range, Range), 6, 6);
    }
    for (i=0; i<15; i++) {
      ellipse(210 + i*10 + random(-Range, Range), DIR_Y2 + random(-Range, Range), 6, 6);
    }
    for (i=0; i<15; i++) {
      ellipse(DIR_X2 + random(-Range, Range), 50 + i*10 + random(-Range, Range), 6, 6);
    }
  }
  else {
    Angle -= 2;
    for (i=0; i<15; i++) {
      fill(14-i, 99, 99);
      x = Cx + ( (R-i*10) * cos(radians(Angle)) );
      y = Cy + ( (R-i*10) * sin(radians(Angle)) );
      ellipse(x + random(-Range, Range), y + random(-Range, Range), 6, 6);
    }
    Angle1 -= 2;
    for (i=0; i<15; i++) {
      fill(14-i, 99, 99);
      x = Cx + ( (R-i*10) * cos(radians(Angle1)) );
      y = Cy + ( (R-i*10) * sin(radians(Angle1)) );
      ellipse(x + random(-Range, Range), y + random(-Range, Range), 6, 6);
    }
    Angle2 -= 2;
    for (i=0; i<15; i++) {
      fill(14-i, 99, 99);
      x = Cx + ( (R-i*10) * cos(radians(Angle2)) );
      y = Cy + ( (R-i*10) * sin(radians(Angle2)) );
      ellipse(x + random(-Range, Range), y + random(-Range, Range), 6, 6);
    }
    Angle3 -= 2;
    for (i=0; i<15; i++) {
      fill(14-i, 99, 99);
      x = Cx + ( (R-i*10) * cos(radians(Angle3)) );
      y = Cy + ( (R-i*10) * sin(radians(Angle3)) );
      ellipse(x + random(-Range, Range), y + random(-Range, Range), 6, 6);
    }
  }
}

void ohayashi(){
  float px, py;
  noFill();
  
  px = width/2 + random(-200, 200);
  py = height/2 + random(-200, 200);
  
  if(I<10){
  I += 1;
  stroke(I*10, 99, 99, 20);
  strokeWeight(I*10);
  if(I%2 ==0) ellipse(px, py, 30, 30);
  else rect(px, py, 30, 30);
  }
  else I=0;
}

void tako() {
  pushMatrix();
  translate(width*5/4, height/2);
  rotate(radians(150));
  fill(55, 20, 99);

  if (Change) {
    Angle_t2 -= 8;
    X = Cx_t2 + R_t       * cos(radians(Angle_t2));
    Y = Cy_t1 + (R_t*3/4) * sin(radians(Angle_t2));
    rect(X, Y, 8, 12);
    if (Angle_t2 <= -180) {
      Change = false;
      Angle_t2 = 180;
    }
  }
  else {
    Angle_t1 += 8;
    X = Cx_t1 + R_t       * cos(radians(Angle_t1));
    Y = Cy_t1 + (R_t*3/4) * sin(radians(Angle_t1));
    rect(X, Y, 8, 12);
    if (Angle_t1 >= 360) {
      Change = true;
      Angle_t1 = 0;
    }
  }
  popMatrix();
}

void tako2(){
  Ang1 += Rot1;
  Ang2 += Rot2;
  float rx = 60 + Rt1 * cos(radians(-Ang1));
  float ry = 20 + Rt1 * sin(radians(-Ang1));
  X = rx + (Rt2 * cos(radians(-Ang2)));
  Y = ry + (Rt2 * sin(radians(-Ang2)));
  
  fill(0, 20, 99);
  rect(X, Y, 3, 5);
}

void fadeOut() {  //画面を白にフェードアウト
  noStroke();
  fill(70, 99, 50, 5);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
