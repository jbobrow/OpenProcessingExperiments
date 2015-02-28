
float x = 200;         // x-coordinate 
float y = 200;         // y-coordinate 
int leglength = 30;    // Body Height 
int neckHeight = 50;   // Neck Height 
int radius = 45;       // Head Radius 
float angle = 0.0;     // Angle for motion

void setup() { 
  size(800, 400);
  smooth();
  strokeWeight(2);
  background(204, 4, 0);
  ellipseMode(RADIUS);
}

void draw() { 
  
  //change position by small amount
  x+= random (-4, 4);
  y += random(-1, 1); 
  
  
     

 float ny = y - leglength - neckHeight - radius;
 //background(204);



// Head 
noStroke();                                    // Disable stroke 
fill(0);                                       // Set fill to black 
ellipse(x, y - 35 - neckHeight, 60, 35);       // Head 
fill(0, 0, 1000);                              // Set fill to blue 
ellipse(x + 13, y - 40 - neckHeight, 14, 14);  // Large eye 
ellipse(x - 11, y - 40 - neckHeight, 12, 12);  // Small eye
fill(0);                                       // Set fill to black 
ellipse(x + 13, y - 38 - neckHeight, 6, 6);    // Pupil large eye 
ellipse(x - 11, y - 38 - neckHeight, 6, 6);    // Pupil small eye 

// Neck
stroke(102);                                    // Set stroke to gray
line(x - 10, y  - 30, x - 10, y - neckHeight);  // Left
line(x, y -30, x, y - neckHeight);              // Middle
line(x + 10, y - 30, x + 10, y - neckHeight);   // Right

// Body 
noStroke();                           // Disable stroke 
fill(0);                              // Set fill to black 
arc(x, y + 50, 80, 80, PI, TWO_PI);   // Main body TOP
fill(250, 300, 0);                    // Set fill to yellow
rect(x - 80, y + 50, 161, 6);         // Gray stripe 

// Legs
noStroke();                                         // Disable stroke 
fill(102);                                          // Set fill to gray 
ellipse(x - 10.5, y + 56 + leglength, 4.5, 4.5);    // Left Antigravity orb 
ellipse(x + 10.5, y + 56 + leglength, 4.5, 4.5);    // Right Antigravity orb 
fill(0);                                            // Set fill to black 
rect(x - 15, y + 56, 10, leglength);                // Leftleg
rect(x + 5, y + 56, 10, leglength);                 // Rightleg

// Arms  
noStroke();                       // Disable stroke
fill(0);                          // Set fill to black 
rect(x - 75, y - 20, 40, 5);      // Left arm
rect(x + 35, y - 20, 40, 5);      // Right arm
fill(1000, 0, 0);                 // Set fill to red
rect(x - 80, y - 20, 5, 5);       // Right arm dec
rect(x + 75, y - 20, 5, 5);       // Left arm dec

}


