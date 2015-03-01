
/*
  MFADT BOOTCAMP Day03 HOMEWORK by Sherry Zhang
  This is a .gif inspired by the moment I woke up in my dorm. 
  It may take a moment to display the image. 
 */

PImage img;
float scale=1;
float scaleVel=0.01;

void setup() {
  size(800, 600);
  img = loadImage("dawn.jpg");
  img.resize(800, 600);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/2);
  if (scale < 0 || scale > 1) {
    scaleVel *= -1;
  }
  scale += scaleVel;
  scale(scale);
  imageMode(CENTER);
  image(img, 0, 0);
  popMatrix();

  fill(57, 54, 25);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("No Sleep Again!", width/2, height/2);
}



