
int startX, startY;
float length, radius, diameter;
float stretch = 0.5;
float colour;
color r=100, g=150, b=200, a=200;
 
void setup() {
  size(900, 600);
  frameRate(30);
  colorMode(HSB, width, 100, 100, 100);
  smooth();
}
 
void draw() {
  background(0);
  if(startX < width / 2) colour = startX + width / 2;
  else colour = startX - width / 2;
  g = color(colour,100,100);
  a = color(0,0,70);
  length=sqrt(sq(startX)+sq(startY));
  
  if(mousePressed) {
    if(radius != length) radius += length * ((length-radius) / length) * stretch;
    diameter = radius * 1;
    noStroke();
    fill(g);
    ellipse(mouseX, mouseY, diameter, diameter);
    ellipse(mouseX, mouseY, 5, 5);
    stroke(a);
    line(startX, startY, mouseX, mouseY);
    fill(a);
    rect (mouseX, mouseY, 20, 20);
    triangle (mouseX, mouseY, 20, 20, 20, 20);
  }
}
 
void mousePressed(){
  startX = mouseX;
  startY = mouseY;
}
 
void mouseReleased(){
  length = 0;
  radius = 0;
}

