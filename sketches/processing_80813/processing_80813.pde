
//Source:http://www.openprocessing.org/sketch/4532
PFont font1; 
PImage img1;
int var1;
int var2;
int int1;
int int2;
 
void setup() {
  size(360,270);
  smooth();
  frameRate(2);
  img1= loadImage("call.jpg");
  background(img1);
  font1 = loadFont("ArialRoundedMTBold-48.vlw");
}
 
void draw() {
   image(img1,0, 0);
  noStroke();
  int var1 = (int) (random(width));
  int var2 = (int) (random(height));
  int int1 = (int) (random(width));
  int int2 = (int) (random(height));
  int opac = (int) (random(255));
  fill(var2,var1,int2,opac);
  text("Hello",var1,var2,int1,int1);
  fill(0,0,0);
  text("Hello",var2,var1,opac/30,opac/30);
  fill(255,255,255,15); // the opacity @x makes a disappearing background
  rect(0,0,width,height);
}



