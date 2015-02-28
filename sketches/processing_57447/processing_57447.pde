
PImage img;

float x = 60;            // x-coordinate 
float y = 420;           // y-coordinate 
float bodyHeight = 110;  // Body Height 
float neckHeight = 60;  // Neck Height 
float radius = 45;       // Head Radius 
float ny = y - bodyHeight - neckHeight - radius;  // Neck Y 
 float easing = 0.02;
 float angle = 0.0; 
void setup() {
 background(255);
 size(720, 540);
 smooth ();
 
 img = loadImage("space.jpg"); 
 strokeWeight(3);
 ellipseMode(RADIUS);
}
void draw() {
 background(255); 
// Change position by a small random amount 
  x += random(-4, 4); 
  y += random(-1, 1);
 // Change height of neck 
  neckHeight = 80 + sin(angle) *  30; 
  angle += 0.05;  
 image(img, 0, 0); 
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 20;
    bodyHeight = 90;
  } else {
    neckHeight = 60;
    bodyHeight = 110;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
   
//background(204);
 

// Neck 
stroke(102); 
line(x+2, y-bodyHeight, x+2, ny); 
line(x+12, y-bodyHeight, x+12, ny); 
 
// Antennae 
stroke(10); //thick
line(x+12, ny, x-18, ny-99); 
line(x+12, ny, x+42, ny-99); 

// Body 
noStroke(); 
fill(102); 
ellipse(x, y-33, 33, 33); 
fill(0); 
rect(x-45, y-bodyHeight, 90, bodyHeight-33); 
fill(102); 
rect(x-45, y-bodyHeight+17, 90, 6); 

// Head 
fill(0);                           //set fill to black
ellipse(x+12, ny, radius, radius); //head
fill(255);                         //set fill to white
ellipse(x+28, ny-7, 20, 20); //large white eye
fill(0, 0, 255);             //set fill to blue
ellipse(x+24, ny-7, 10, 10); //pupil
}


