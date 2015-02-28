
float  y = 380; // y-coordinate
float x = 266; // 
int radius = 45;
int neckHeight = 20;
int bodyHeight = 120;

float easing = 0.02;

void setup() {
  size(720, 480);
  smooth();
  strokeWeight(2);
 ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
  float ny = y - bodyHeight - neckHeight - radius;

background(204);


// Antennae
line(x + 10, 155, x + 10, 70); 
line(x + 10, 155, x +20, 70); 
line(x + 10, 155, x + 30, 70); 
line(x + 10, 155, x - 10 , 70);
line(x + 10, 155, x, 70);

// Body
noStroke(); // Disable stroke
fill(102); // Set fill to gray
ellipse(x + 45, y + 12, 19, 19); // Antigravity orb
ellipse(x + 10, y + 12, 19, 19); // Antigravity orb
ellipse(x - 26, y + 12, 19, 19); // Antigravity orb
fill(0); // Set fill to black
rect(x - 45, y-bodyHeight, 112, bodyHeight-5); // Main body
fill(102); // Set fill to gray
arc(x + 65, y-bodyHeight, 35, 35, 0, HALF_PI);

// Head
fill(0); // Set fill to black
rect(x - 24, 120, 65, 75); // Head
fill(255); // Set fill to white
ellipse(x + 9, 140, 10, 10); // eye
fill(255); // Set fill to white
ellipse(x + 9, 165, 10, 10); //eye

// Neck
stroke(102); // Set stroke to gray
line(x, y-bodyHeight, x, 195); // Left
line(x + 20, y-bodyHeight, x + 20, 195); // Right


}

