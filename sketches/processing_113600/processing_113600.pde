
PImage cow;
PImage dex;
PImage john;
PImage ed;
PImage girls;





void setup() {
  background(255);
  size (400, 600);
  frameRate(1);
  
  cow = loadImage("cow.gif");
  dex = loadImage("dexter.jpg");
  john = loadImage("johnny03.jpg");
  ed = loadImage("ed.jpg");
  girls = loadImage("girls.jpeg");
}

void draw() {
  float x = random(width);
  float y = random(height);
  float a = random(width/2);
  float b = random(height/2);
  float c = random(400, 400);
  float d = random(300, 600);
  image( cow, x, y, 150, 130);
  image(ed, a, b, 150, 150);
  image(john, x, d, 175, 150);
  image(girls, x, y, 250, 200);
  image(dex, y, x);
}



