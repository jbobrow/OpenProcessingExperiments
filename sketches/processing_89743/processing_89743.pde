
PImage atwill;
PImage bg;
float roll;

void setup() {
  size(600, 400);
  atwill = loadImage("atwill.png");
  bg = loadImage("snowbg.jpg");


}

void draw() {
  background(bg);
  imageMode(CENTER);
  pushMatrix();
  translate(mouseX, mouseY); //follow mouse
  rotate(roll);
  fill(255);
  image(atwill, 10, 10);
  roll += 0.07;
  popMatrix();
}



