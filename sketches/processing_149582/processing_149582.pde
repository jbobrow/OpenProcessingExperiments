
PImage img;
PFont font;
PShape circles;
int x=100;
int y;

void setup() {
  size(800,528);
  smooth();
  font=loadFont("Volupia-100.vlw");
  circles=loadShape("unicircle.svg");
  textFont(font);
}

void draw() {
  background(loadImage("universe.jpg"));
  textSize(100);
  text("Universe", (50+0.15*x), 300);
  x = mouseX;
  y = mouseY;
  shapeMode(CENTER);
  float diameter=map(x,0,0.4*width,200,800);
  shape(circles,400,250,diameter,1.4*diameter);
  
}


