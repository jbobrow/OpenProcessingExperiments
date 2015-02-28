
int baseAngle;
color bColor, FillCol;

void setup() {
  size(600,600); // Size of canvas
  colorMode(HSB, 360, 100,100); // Change the way Processing interprets color
}
 
void draw() {
  fill(0); // Color
  ellipse(mouseX, mouseY, 50,50); // Round brush
}

void mousePressed() { // Changes color when click
 setComplementary(); // Set up for color change
}

void setComplementary() {
  baseAngle = int(random(255));
  bColor = color(baseAngle, 180, 90+random(30)); // background color random
  background(bColor); // background color random
  noFill();
}

