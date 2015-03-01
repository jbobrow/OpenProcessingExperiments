
PImage img;  // Declare variable "a" of type PImage
 import processing.video.*;
 
 Movie imagineJustice;
 
void setup() {
  size(640, 360);
  img = loadImage("mlk.jpg");  // Load the image into the program  

  imagineJustice = new Movie(this, "imaginemp4.mp4");
  imagineJustice.loop(); 
}

//void movieEvent(Movie imagineJustice) {
//  imagineJustice.read();
//}

void draw() {
if (imagineJustice.available()) {
    imagineJustice.read();
  }  
  background(0);
  imageMode(CENTER);
  image(imagineJustice, width/2, height/2, 720,480);
}
 void mousePressed() {
  PImage img;
  img = loadImage("mlk.jpg");
  image(img, mouseX, mouseY);
 }
