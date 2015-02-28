
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
void setup() {
  size(600, 600);
  background(150);
  colorMode(HSB, 600, 200, 200);
  fill(200);
  smooth();
}
 
void draw() {
  println(mouseX + " " + mouseY);
  stroke(mouseX, 400, mouseY);
  ellipse(random(400), random(300), mouseX, mouseY);
  r = random(500);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  noStroke();
  fill(r,g,b,a);
  
 
   
}
 
// clear bkg
void mousePressed()
{
background(150);
}


