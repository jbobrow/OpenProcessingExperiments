

PImage hair;
PImage water;
PImage url;
PImage blue;
PImage orange;

PImage then; // size(560, 768);
PImage now;

PImage then1; // size(560, 768);
PImage now1;

PImage then2; // size(510, 768):
PImage now2;

PImage then3; // size(490, 768);
PImage now3;

PImage haysol1; // siz

void setup() {
  size(560, 768);
  then = loadImage("then.jpg"); 
  hair = loadImage("hair.jpg");
  water = loadImage("water.jpg");
  url = loadImage("url.jpeg");
  blue = loadImage("blue.jpeg");
  orange = loadImage("orange.jpeg");
  now = loadImage("now.jpg");
  then1 = loadImage("then1.jpg");
  now1 = loadImage("now1.jpg");
  then2 = loadImage("then2.jpg");
  now2 = loadImage("now2.jpg");
  then3 = loadImage("then3.jpg");
  now3 = loadImage("now3.jpg");
  haysol1 = loadImage("haysol1.jpg");
  image(then, 0, 0);
  frameRate(240);
  noStroke();
}

void draw() {
  color c = now.get(mouseX, mouseY);
  stroke(c, 30);
  strokeWeight(15);
  fill(c, 30);
  float r = random(1, 200);
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX+1, mouseY+15);
  vertex(mouseX+1, mouseY+21+r);
  vertex(mouseX+2, mouseY+23+r);
  vertex(mouseX+3, mouseY+25+r);
  vertex(mouseX+4, mouseY+26+r);
  vertex(mouseX+3, mouseY+27+r);
  vertex(mouseX+3, mouseY+28+r);
  vertex(mouseX+2, mouseY+29+r);
  vertex(mouseX+2, mouseY+30+r);
  vertex(mouseX+1, mouseY+30+r);
  vertex(mouseX-1, mouseY+31+r);
  vertex(mouseX-3, mouseY+30+r);
  vertex(mouseX-3, mouseY+30+r);
  vertex(mouseX-4, mouseY+30+r);
  vertex(mouseX-4, mouseY+29+r);
  vertex(mouseX-5, mouseY+28+r);
  vertex(mouseX-5, mouseY+27+r);
  vertex(mouseX-6, mouseY+26+r);
  vertex(mouseX-5, mouseY+25+r);
  vertex(mouseX-4, mouseY+23+r);
  vertex(mouseX-3, mouseY+21+r);
  vertex(mouseX-2, mouseY+15);
  endShape(CLOSE);
}



