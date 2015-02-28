
float angle = 0.0; // Current angle 32-02
float speed = 5; // Speed of motion 
float radius = 60.0; // Range of motion 
float sx = 2.0;
float sy = 2.0;


void setup() { 
  size(600, 600); 
  smooth();
  noStroke();
  frameRate(20);
}

void draw() {
fill(0, 10);
rect(0, 0, width, height);
angle += speed; // Update the angle
float sinval = sin(angle);
float cosval = cos(angle);
// Set the position of the small circle based on new // values from sine and cosine
float x = mouseX + (cosval * radius);
float y = mouseY + (sinval * radius);
if (keyPressed) {
  if (key == 'a' || key == 'A')
  fill(255,0,0); 
  if (key == 's' || key == 'S') 
  fill(0,0,255); 
  if (key == 'd' || key == 'D')
  fill(0,255,0); 
  if (key == 'f' || key == 'F') 
  fill(255,0,255);
  if (key == 'j' || key == 'J')
  fill(255,255,0); 
  if (key == 'k' || key == 'K') 
  fill(0,255,255); 
  if (key == 'l' || key == 'L')
  fill(127,150,0); 
  if (key == ';' || key == ':') 
  fill(127,0,150);
} else fill(255);
ellipse(x, y, 20, 20); // Draw smaller circle
// Set the position of the large circles based on the // new position of the small circle
float x2 = x + cos(angle * sx) * radius/2;
float y2 = y + sin(angle * sy) * radius/2; ellipse(x2, y2, 10, 10); // Draw larger circle
}




