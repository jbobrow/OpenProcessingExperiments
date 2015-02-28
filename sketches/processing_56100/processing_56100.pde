
float x = 135;
float y = 250;
int bodyHeight = 105;
int neckHeight = 5;
int radius = 45;

float easing = 0.02;

void setup() {
  size(480, 480);
  smooth();
  strokeWeight(3);
  ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX-x) *easing;
  int targetY = mouseY;
  y += (targetY-y) *easing;
  
float ny = y - bodyHeight - neckHeight - radius;
  
background(224);

//Antannae
stroke(153); // Light gray
strokeWeight(3);
line(x-5, ny-55, x-5, ny-40);
noStroke();
fill(153);
ellipse(x-5, ny-65, 2, 2); // Small circle
noFill();
stroke(255, 252, 167); // Light yellow
strokeWeight(2);
ellipse(x-5, ny-65, 8, 8); // Big circle

// Head
noStroke();
fill(124, 0, 0); // Red
quad(x-40, ny-40, x+30, ny-40, x+25, y-bodyHeight-5, x-35, y-bodyHeight-5); // Head
fill(255);  // White
ellipse(x-20, ny-10, 12, 12);  // Large eye
fill(153);  // Light gray
ellipse(x-20, ny-10, 5, 5);  // Small eye left
ellipse(x+10, ny-10, 5, 5);  // Small eye right
stroke(153); // Light gray
strokeWeight(3);
line(x-25, ny+25, x+15, ny+25); //Mouth

// Neck
stroke(124, 0, 0); // Red
strokeWeight(18);
line(x-5, y-bodyHeight-5, x-5, y-bodyHeight);

// Arm
stroke(124, 0, 0); // Red 
strokeWeight(18);
line(x-65, y-10, x-50, y-bodyHeight+10); // Left arm
line(x+40, y-bodyHeight+10, x+55, y-10); // Right arm

// Body
noStroke ();
fill(124, 0, 0);  // Red
quad(x-50, y, x+40, y, x+25, y-bodyHeight, x-35, y-bodyHeight);
arc(x-5, y+4, 45, 45, TWO_PI, PI+TWO_PI); // Rounded half

if (mousePressed) {
  noFill();
  strokeWeight(3);
  stroke(250, 255, 124);
  bodyHeight = 150;
} else {
  noFill();
  stroke(153);
  strokeWeight(3);
  bodyHeight = 105;
}
ellipse(x-5, ny-65, 8, 8); // Big circle

}


