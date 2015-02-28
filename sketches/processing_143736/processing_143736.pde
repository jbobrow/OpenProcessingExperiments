
import netscape.javascript.*;


PImage img1, img2;

void setup() {
  size(1000, 800);
  imageMode(CENTER);
  img1 = loadImage("butt1.png");
  img2 = loadImage("butt2.png");
}

void draw() {
  background(0);

  fill(255, 204, 0);
  rect(400, 200, 70, 120);
  rect(473, 200, 120, 70);
  rect(400, 323, 120, 70);
  rect(523, 279, 70, 114);

  textAlign(CENTER);
  textSize(50);
  text("I", width/2, 490);
  text("BREAK YOUR BACK", width/2, 550);
  text("MAKE YOU HUMBLE", width/2, 610);

  image(img1, width/6, height/2);
  image(img2, width/6*5, height/2);
}


