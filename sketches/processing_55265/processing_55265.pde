
float x =60;
float y =420;  
int radius = 45;
int bodyHeight = 160;
int neckHeight = 70;

float easing = 0.02;

void setup() {
size(360, 480); 
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
  
 // Neck 
 stroke(102);  
 line(x+12, y-bodyHeight, x+12, ny);  // Middle

 // Antennae                  
 line(x+12, ny, x-18, ny-43);  // Small 
 line(x+12, ny, x+42, ny-99);   // Tall
 line(x+12, ny, x+78, ny+15);  // Medium

 // Body
 noStroke();                // Disable stroke
 fill(102);                 // Set fill to gray 
 ellipse(x, y-33, 33, 33); // Antigravity orb
 fill(0);                   // Set fill to black 
 rect(x-45, y-bodyHeight, 90, bodyHeight -33);   // Main body 

 // Head 
 fill(0);                   // Set fill to black 
 ellipse(x+12, ny, radius, radius); // Head
 fill(255);                 // Set fill to white 
 ellipse(x+24, ny-6, 14, 14); // Large eye 
 fill(0);                   // Set fill to black 
 ellipse(x+24, ny-6, 3, 3);   // Pupil 
}
    

