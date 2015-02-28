
PImage landscape;
PFont font;
float radius = 40;
float x = 350;
float y = 350;
float speed = 2.5;
int diameter = 20;
float bodyHeight = 105;
float neckHeight = 5;

float ny = y - bodyHeight - neckHeight - radius; // ny = 95

void setup() {
  size(720, 480);
  landscape = loadImage("alpine.png");
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(landscape);
    
 x += random(-speed, speed);
 y += random(-speed, speed);
 ellipse(x, y, diameter, diameter);
 
 float ny = y - bodyHeight - neckHeight - radius; // ny = 95

  
//Antannae
stroke(153);
line(x-5, ny-55, x-5, ny-40);
noStroke();
fill(250, 255, 0); // Yellow
ellipse(x-5, ny-65, 2, 2); // Small circle
noFill();
stroke(255, 252, 167); // Light yellow
strokeWeight(3);
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
noStroke();
fill(167, 30, 30);
arc(x-5, y, 40, 40, TWO_PI, PI+TWO_PI); // Rounded half
noFill();
stroke(255);
strokeWeight(2);
arc(x-5, y, 36, 36, 0, radians(110));
noStroke();
fill(124, 0, 0);  // Red
quad(x-50, y+5, x+40, y+5, x+25, y-bodyHeight, x-35, y-bodyHeight);

}

