
 //Practice Sketch
//code to play the “imagine justice” video in processing
//project #1 materials

 import processing.video.*;

Movie imagineJustice;

void setup() {
  size(720,480);
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
  img = loadImage("MLKQuote2");
  image(img, mouseX, mouseY);
}
