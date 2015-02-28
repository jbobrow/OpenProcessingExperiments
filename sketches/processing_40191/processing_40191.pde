
//Adam Anzivino
/*have fun, move the mouse slow or fast and extract colors
from the swisher pumpkin*/

PImage img;

void setup() {
  size (300, 300);        //setup size
  img = loadImage("pumpkin.jpg");  //bring image in

  noStroke();
  smooth();
  background(255);

}
void draw() {
  float a = random(width); //setup randoms for the fill
  float b = random(height);

int x = mouseX;   //setup mouse variables
int y = mouseY;

  color f = img.get(x, y); //pull images from pixels in img
  stroke(f,100);                //stroke adopts color
  strokeWeight(2);
  line(a, 0, a, height);    //vertical lines
  line(0, b, width, b);     //horizontal lines
}


