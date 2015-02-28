
int x = 250;
int y = 250; 
int radius = 125;
PFont gulim;
String word = "P";

void setup()
{
  size(500,500);
  gulim = loadFont("Gulim-21.vlw");
  smooth();
  ellipseMode(RADIUS);
}

void draw()
{
  background(0);
  float d = dist(x, y, mouseX, mouseY);
  if (d < radius) {
    fill(255,0,0,50);
  } else {
    fill(0);
  }
  stroke(255);
  strokeWeight(2);
  ellipse(x,y, radius,radius);
  
  textFont(gulim);
  textSize(60);
  fill(255);
  text(word, 235,210, 200,200);
}

