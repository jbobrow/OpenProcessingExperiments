
//This program is built on example 7-14 from the Getting started book
float anglew = 0.0;//angle for white circle
float angleb = 0.0;//angle for black circle
float offset = 150;//centre of window
float scalar = 75;//distance from centre of window
float speedw = 0.05;//speed for white circle
float speedb = 0.025;//speed for black circle
void setup() {
size(300, 300);
smooth();
}
void draw() {
  background(0);//setting black background
float x = offset + cos(anglew) * scalar;
float y = offset + sin(anglew) * scalar;
float x1 = offset + cos(angleb) * scalar;
float y1 = offset + sin(angleb) * scalar;
fill(255);//white circle
ellipse( x, y, 75, 75);//white circle
fill(0);//black circle
ellipse( x1, y1, 90, 90);//black circle
anglew += speedw;//setting new angle for placement of white circle
angleb += speedb;//for black circle


}

