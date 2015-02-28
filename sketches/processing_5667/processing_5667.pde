
import gifAnimation.*;

PImage[] animation1; 
PImage[] animation2;
boolean pause = false;

void setup() {
  size(980, 360);
  frameRate(100);
  // create the PImage array for the interactive display
animation1 = Gif.getPImages(this, "mapa1.gif");
animation2 = Gif.getPImages(this, "mapa2.gif");
}

void draw() {
  background(255);
  imageMode(CORNERS);
  image(animation1[(int) (animation1.length / (float) (width) * mouseX)], 0, 0);
  image(animation2[(int) (animation2.length / (float) (height) * mouseY)], 0, 0);

}


