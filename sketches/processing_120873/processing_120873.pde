
PImage img;
PImage img1;
PImage img2;
PImage img3;
PFont f;

void setup() {
  size(360, 500);
  f =  loadFont ("Mangal-Bold-30.vlw");
  textFont(f);
  stroke(255);
  img = loadImage("sun.png");
  img1 = loadImage("ear.png");
  img2 = loadImage("vin.png");
  img3 = loadImage("muq.png");
}

void draw() {
  background(0);
  fill(0);
  smooth();
  stroke(130,100,100);
  ellipse(180, 180, 800, 800);
  ellipse(180, 180, 550, 550);
  ellipse(180, 180, 320, 320);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  ellipse(180, 180, 200, 200);
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  ellipse(180, 180, 130, 130);
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  image(img, 180, 180, 90,90);
  imageMode(CENTER);
  image(img1,cos(s)*160+180,sin(s)*160+180,40,40);
  image(img2,cos(m)*97+180,sin(m)*97+180,30,30);
  image(img3,cos(h)*65+180,sin(h)*65+180,20,20);
  int s2 = second();
  int m2 = minute();
  int h2 = hour();
  fill(130,100,100);
  String time  = nf( h2, 2)+ " : " + nf( m2, 2) +" : " + nf( s2, 2);
  textAlign(CENTER);
  text(time, 180, 430);
}

