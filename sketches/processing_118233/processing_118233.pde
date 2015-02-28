
//Lin,Lien Ya 
//green,green,grass,home
//the shine sunlight & the waving/growing grass.

void setup() {
  size(500, 500);
  //noLoop();
  background(220, 220, 180);
  strokeWeight(1);
 }
void draw() {
  
  loop_();
  sun_();

}
void loop_() {
  for (int i=0;i<400;i=i+2) {
    line_(0,0,0,0);
    line_y(0,0,0,0);
    line_c(0,0,0,0);     
     // noLoop();
  }
}

void line_(float xstep, float ystep, float lastx, float lasty) {
  float a = random(90);
  float y = 0;
  stroke(20, 120, a, a);
  int border = 20;
  for (int x=0; x<=width;x+=20) {

    line(lastx, lasty, x, y);
    x += random(50);
    y += random(50);
    lastx=x;
    lasty=y;
  }
}

void line_y(float xstep, float ystep, float lastx, float lasty) {
  float a = random(90);
  float y = 0;
  stroke(150, 150, 60, a);
  int border = 20;
  for (int x=0; x<=width;x+=20) {

    line(lastx, lasty, x, y);
    x += random(50);
    y += random(50);
    lastx=x;
    lasty=y;
  }
}

void line_c(float xstep, float ystep, float lastx, float lasty) {
  float a = random(90);
  float y =50;
  stroke(50, 180, 60, a);
  int border = 20;
  lastx=0;
  lasty=50;
  for (int x=0; x<=width;x+=20) {

    line(lastx, lasty, x, y);
    x += random(50);
    y += random(50);
    lastx=x;
    lasty=y;
  }
}
void line_d(float xstep, float ystep, float lastx, float lasty) {
  float a = random(90);
  float y =90;
  stroke(100, 210, 160, a);
  int border = 20;
  lastx=0;
  lasty=90;
  for (int x=0; x<=width;x+=10) {

    line(lastx, lasty, x, y);
    x += random(50);
    y += random(50);
    lastx=x;
    lasty=y;
  }
}

/*void line_b(float xstep, float ystep, float lastx, float lasty) {
  float a = random(90);
  float y = 0;
  stroke(0, 0, 0, a);
  for (int x=500;x>=0;x-=20) {
    line(lastx, lasty, x, y);
    x -= random(50);
    y += random(50);
    lastx=x;
    lasty=y;
  }
}*/

void sun_() {
  float a =random(90, 500);
  float b =random(90, 500);
  float c =random(90, 500);
  float d =random(30);
  noStroke();
  fill(255, 255, 255, d);
  ellipse(a, b, c, d);
}



