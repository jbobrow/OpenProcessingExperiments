
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
int r = 400;
 
// used to create font
PFont myFont;
 
void setup() {
  size(600, 600);
  background(127);
} 
 
void draw() {
  background(#FFFFFF);
  stroke(255);
  fill(#00E1FF);
  // This part is what rotates the rectangle around the cirlce. 
  stroke(150);
  fill(255);
  px = width/2 + cos(radians(angle))*(radius*3);//The radius parts you can turn into ellipses. 
  py = width/2 + sin(radians(angle))*(radius*2);
  ellipseMode(CENTER);
  fill(#07A1B5);
  ellipse(px, py, 15, 15);
  stroke(0);
  //This statement below is what makes it run continuously 
  angle += frequency;
   
} 



