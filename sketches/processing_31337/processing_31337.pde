
int len = 500;
PVector[] spd = new PVector[len];
PVector[] pos = new PVector[len];
float[] gravity = new float [len];
color [] cols = new color[len];
int w = 10; 
int h = 10;

void setup() {
  size(800, 800);
  background(255);


  for (int i=0; i<len; i++) {
    spd[i] = new PVector(random(.2, .8), random(.5, .9));
    pos[i] = new PVector(width-600, height-500);
    //gravity[i] = (.09);
    cols[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  //background(255);
  smooth();
  noStroke();

  for (int i=0; i<len; i++) {
    pos[i].add(spd[i]);
    fill (cols[i]);
    ellipse(pos[i].x, pos[i].y, w, h);

    if (pos[i].x > width) {
      pos[i].x = width- w;
      spd[i].x*=-1;
    }
    if (pos[i].x<0) {
      pos[i].x =0+ w;
      spd[i].x*=-1;
    }
    if (pos[i].y > height) {
      pos[i].y = height- h;
      spd[i].y*=-1;
    }
    if (pos[i].y < 0) {
      pos[i].y = 0 + h;
      spd[i].y *= -1;
    }
  }

  if (mousePressed) {
    for (int i = 0; i < len; i++) {
      spd[i].x *= random(-1.5, -0.5);
      spd[i].y *= random(0.5, 1.5);
    }
  }
}
