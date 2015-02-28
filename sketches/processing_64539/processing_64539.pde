
PImage img_02;
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  img_02 = loadImage ("img_02.png"); //move this up here!
}

void draw() {
  background(0);   

  translate(width/2,height/2); //these two lines move the "whole" chunk of stuff
  rotate(frameCount/10.0);
  
  float xpos = mouseX/10.0;
  
  for (int i=0; i<360; i+= 30) { //this for loop makes the loop of images. i is used for the angle.
    pushMatrix(); //why do we need to do this? remove it and see!
    rotate(radians(i));
    //img_02 = loadImage ("img_02.png");
    //Yes you need to load the image, but not 60x a second!
    //What you mean to do here is display the image:
    image(img_02, xpos,0, 50,100);
    popMatrix();
  }
}

