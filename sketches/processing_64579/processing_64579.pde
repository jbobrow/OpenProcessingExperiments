
PImage fry;
PImage p1;
PImage p2;
PImage p3;

float angle;
float rad = 100;
float cx, cy;
float a=0;
float b=0;

void setup() {

  size (500, 500);
  fry = loadImage ("fry.png");
  p1 = loadImage("pizza1.png");
  p2 = loadImage("pizza2.png");
  p3 = loadImage("pizza3.png");
  imageMode(CENTER);
  frameRate(60);
  cx = width/2;
  cy= height/2;
}

void draw() {
  float angle = frameCount/30.0;

  float x =cx + cos(angle)*rad;
  float y =cy + sin(angle)*rad;

  angle = radians(45);
  background(299, 255, 62);

  pushMatrix();
  translate(0, 0);
  rotate(frameCount/30.0);
  image(fry,x,y, 600, 600);
  popMatrix();
  
  pushMatrix();
  translate(0, 20);
  image(fry, x, y, 300, 300);
  popMatrix();
 
  pushMatrix();
  translate(10,100);
  image(p3, x+50, sin(y),100, 100);
  popMatrix();

  pushMatrix();
  image(p2, random(x+y), random(y+40), 200, 200);
  popMatrix();

  pushMatrix();
  image(p1, x+300, y+200, 250, 250);
  popMatrix();
}


