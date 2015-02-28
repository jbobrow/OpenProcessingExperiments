
/* 
 Daniel C. Young
 Microsoft Logo Animation
 10/13/2011
 */

PImage bg;
float x1, y1, x2, y2;
float ypos1, ypos2, ypos3;
float radius=60;
float ang = 221;
float easing = 0.01;

void setup() {
  size(800, 800);
  smooth();
  bg = loadImage("mountain.jpg");
  randomPos();
}

void draw() {
  image(bg,0,0);
  tint(255, 60);
  strokeWeight(50);

  if (ang<=220 || ang>=320) {
    easing = easing * -1;
  }
  ang -= (ang-100) * easing;
  
  pushMatrix();
  translate(0,150);
  drawFigure(width/2-150, ypos1, ang);
  drawFigure(width/2, ypos2, ang);
  drawFigure(width/2+150, ypos3, ang);
  popMatrix();
}

void drawFigure(float _xpos, float _ypos, float _ang) {
  float xpos=_xpos;
  float ypos=_ypos;
  float rad1=radians(_ang);
  float rad2=radians(_ang-180);

  x1=xpos+(radius*cos(rad1));
  y1=ypos+(radius*sin(rad1));
  x2=xpos+(radius*cos(rad2));
  y2=ypos+(radius*sin(rad2));

  stroke(251,80);
  line(xpos, 50, x1, y1);
  stroke(252,80);
  line(x1, y1, x2, y2);
  stroke(253,80);
  line(x2, y2, xpos, 450);
}

void randomPos() {
  ypos1=random(180, 320);
  ypos2=random(180, 320);
  ypos3=random(180, 320);
}

void mousePressed() {
  randomPos();
}


