
float r = 100;
float g = 150;
float b = 200;
float a = 200;

float diam = 20;
float x = 50;
float y = 100;

int colour = 100;

void setup() {
size(600, 600);
frameRate(15);
smooth();
}

void draw() {
  // Body
background(random(255),random(255),random(255));
rectMode(CENTER);
fill(x, y, x, y);
rect(mouseX, mouseY, 80, 200);
strokeWeight(3);
  fill(mouseX, colour, mouseY);
  
//Head
ellipseMode(CENTER);
fill(255);
ellipse(mouseX, mouseY-170, 185, 185);

// Legs
line(mouseX-40, mouseY+100, mouseX-67.5, mouseY+130); 
line(mouseX+40, mouseY+100, mouseX+65, mouseY+130);

// Eyes
fill(0);
fill(r, g, b, a);
ellipse(mouseX-60, mouseY-170, 45, 100);
ellipse(mouseX+60, mouseY-170, 45, 100);

// Buttons
fill (0);
fill(r, g, b, a);
ellipse(mouseX, mouseY-40, 10, 10);
ellipse(mouseX, mouseY-10, 10, 10);
ellipse(mouseX, mouseY+20, 10, 10);
}

void mousePressed(){
fill(0);
  fill(r, g, b, a);
  r = int (random (0, 200));
  g = int (random (0, 200));
  b = int (random (0, 200));
  
  x = int(random(0, 200));
  y = int(random(0, 200));
 
println(RGB);
}


