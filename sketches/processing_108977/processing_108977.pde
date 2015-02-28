
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW3 Course 60257

float x = 200;
float y = 200;

void setup()
{
  size (400, 400);
  background (255);
  smooth();
  frameRate(15);
  noStroke();
}

int value = 205;

void draw() {
  fill(value);
  
  fill(0, 0, random(0), 5);
beginShape(TRIANGLE_FAN);
vertex(x, y);
vertex(x, mouseY); 
vertex(mouseX, y); 
vertex(x, mouseY); 
vertex(mouseX, y); 
vertex(x, mouseY); 
endShape();
}

void mousePressed() {
  background(255);
  
}


