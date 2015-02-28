

PImage img1;
PImage img2;
PImage img3;

PFont font;

void setup() {
  size (360,600);
  img1 = loadImage("clo1.png");
  img2 = loadImage("clo2.png");
  img3 = loadImage("clo3.png");
  smooth();
  font = loadFont("HYgtrE-60.vlw");
  textFont(font);
}

void draw() {
  background(255);

  float s = map(second(),0,60,0,TWO_PI);
  float s1 = map(second(),0,60,0,TWO_PI) - HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI);
  float m1 = map(minute(),0,60,0,TWO_PI) - HALF_PI;
  float h = map(hour(),0,60,0,TWO_PI);
  float h1 = map(hour(),0,60,0,TWO_PI) - HALF_PI;

 pushMatrix();
     translate(50,310);
  imageMode(CENTER);
  rotate(-s);
  image(img1,0,0,538,538);
  popMatrix();
 pushMatrix();
     translate(50,310);
  imageMode(CENTER);
  rotate(-m);
  image(img2,0,0,360,360);
  popMatrix();
  pushMatrix();  
  translate(50,310);
  imageMode(CENTER);
  rotate(-h);
  image(img3,0,0,148,148);
  popMatrix();
  
  pushMatrix();
   noStroke();
     fill(255);
  ellipse(90,300,100,100);
  ellipse(190,300,100,100);
  ellipse(290,300,100,100);
 stroke(0);
  int se = second();
  int mi = minute();
  int ho = hour();
  String t = nf(ho,2) + ":" + nf(mi,2) + ":" + nf(se,2);
   fill(76,13,121);
 text(t, 55,320);
 popMatrix();
}


