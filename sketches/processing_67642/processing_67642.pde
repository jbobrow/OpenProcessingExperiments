
PImage img;


void setup() {
  size(225,225);
  img = loadImage ("smiley face.jpg");
  stroke(random(255),random(255),random(255));
  strokeWeight(225);
  frameRate(1999999999);
}


void draw() {
  stroke(random(255),random(255),random(255));
  line(random(225),random(225),random(225),random(255));
   image (img, 0, 0);

 
line(random(225),random(225),random(225),random(225));
}

