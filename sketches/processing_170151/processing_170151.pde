
//Load two images and use copy() with mouseX &mouseY
//combine them in a way that reveals the relationship with two images

/* @pjs preload="sunset1.jpg,sunset2.jpg"; */
PImage img1, img2;
 
void setup() {
  size(600,700);
  img1= loadImage("sunset1.jpg");
  img2= loadImage("sunset2.jpg");
}
 
void draw() {
  background(255);
  image(img1, 0, 0);
  int my = constrain(mouseX, 0, 30);
  copy(img2, 0, my, 200, 400, 200, 200, 300, 60);
}






