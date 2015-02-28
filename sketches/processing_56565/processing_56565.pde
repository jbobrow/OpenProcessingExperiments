
PShape bee1;
PImage landscape;
float speed = 2.5; 
int diameter = 20;
float x; float y;



void setup() 
{ size(250, 250);
bee1 = loadShape("BEE.svg");
landscape = loadImage("Honeycomb.gif");
smooth();
x = width/5;
y = height/30;

}
void draw() {
  background(landscape);
  x += random(-speed, speed); 
  y += random(-speed, speed);
  shape(bee1, x, y, 300, 300);
}

