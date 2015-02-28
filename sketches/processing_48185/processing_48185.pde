
int radius = 100;
int a = 100;

void setup() { 
  size(300, 300); 
  smooth();
  noStroke(); 
  ellipseMode(RADIUS);
}
void draw() { 
  background(204); 
  
  //increse or decrese opposite
  float d = mouseX + mouseY; 
  if (d < 300) {
    radius++;
  } 
  else {
    radius--;
  }
  fill(0);
  ellipse(0, 0, radius, radius);

  float b = mouseX + mouseY; 
  if (b > 300) {
    a++;
  } 
  else {
    a--;
  }
  fill(255, 255, 255);
  ellipse(300, 300, a, a);

  // click
  if (mousePressed) {
  fill(230, 0, 0, 50);
  ellipse(150, 150, mouseX, mouseY);
  }
}

