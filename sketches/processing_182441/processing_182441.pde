
// openprocessing.org/user/46418
// github.com/rlag
// Ross Lagoy
// A0, BCB 502
// 01/25/15

// Settings
PFont f; // For font
float red, green, blue, radius, angle, ballX, ballY; // For dynamic circle shape fill
int stim = 255; // For stimulus hover fade
boolean click = false; // Clicked mouse is false unless true when called
float Xdir = random(7,7); // For initial ball x-direction on click
float Ydir = random(-7,7); // For initial ball y-direction on click

// Runs once
void setup() {
  size(1000, 500);  // Canvas size
  f = createFont("Arial", 16, true); // Arial, 16 point, anti-aliasing on  
}

// Runs once a frame
void draw() {
  // Set background to white everytime frame is updated
  background(255);
 
  // Draw bullet points for the lower canvas text
  point(10,215);
  point(10,235);
  
  // No image outline
  noStroke();
  
  // Use frameCount and noise to change the red color component
  red = noise(frameCount * 0.01) * 255;
  
  // Use frameCount to change the green color component
  green = frameCount % 255;
  
  // Use frameCount and noise to change the blue color component
  blue = 255 - noise(1 + frameCount * 0.025) * 255;
  
  color c = color(red, green, blue); // Provide color with above settings

  // Mouse hover to fill hexagon logo, with fading 
  if (mouseY < 170 && mouseY > 30) {
    stim = 200;
    textFont(f, 16);
    text("You highlighted the logo!", 500, 220);
  }
  
  // Fill hexagon logo shading with fade decreasing by 1 each frame 
  stim = stim + 1;
  fill(stim);
  polygon(100, 100, 70, 6);
  
  // Bouncing ball appears when user clicks in the white space; x,y position updates each frame
  ballX = ballX + Xdir;
  ballY = ballY + Ydir;
  
  if(click) {
    fill(c);
    ellipse(ballX,ballY,25,25);
  }
  
  // Ball changes direction as it bounces off the walls
  if (ballX >= 990) {
    Xdir = -Xdir;
  }
  if (ballX <= 10) {
    Xdir = -Xdir;
  }
  if (ballY <= 210) {
    Ydir = -Ydir;
  }
  if (ballY >= 490) {
    Ydir = -Ydir;
  }
  
  // Logo positioning with color switching, circles in hexagon position points
  fill(c);
  
  // Center circle  
  ellipse(100, 100, 25, 25);
  // Left circle
  ellipse(50, 100, 25, 25);
  // Top right circle
  ellipse(125, 56.7, 25, 25);
  // Bottom right circle
  ellipse(125, 143.3, 25, 25);
  
  fill(c + 100);

  // Top left circle
  ellipse(75, 56.7, 25, 25);
  // Right circle
  ellipse(150, 100, 25, 25);
  // Bottom left circle
  ellipse(75, 143.3, 25, 25);
  
  // Text formatting on the canvas
  textFont(f,75);
  fill(0);
  text("QNTL", 180, 100);
  textFont(f, 50);
  fill(0);
  text("quantitative neurotechnology lab", 180, 150);
  textFont(f, 16);
  text("Hover anywhere over the logo to see what happens!", 15, 220);
  textFont(f, 16);
  text("Click in this white space to see what happens!", 15, 240);
  
  // Text response to mouse-click activity on the canvas
  if (click == true) {
    textFont(f, 16);
    text("You made a moving ball!", 500, 240);
  }
 
  // Initials "RL" logo, bottom right
  noStroke();
  fill(0);
  rect(970,470,10,20);
  rect(970,480,20,10);
  rect(945,470,10,20);
  rect(945,470,20,10);
  
  // Line seperator
  stroke(50);
  line(10,200,990,200); 
}

// Mouse click event makes ball appear at mouse x,y position
void mouseClicked() {
  if (mouseY > 200) {
  ballX = mouseX;
  ballY = mouseY;
  click = true;
  }
}

// Mouse drag allows user to drag the ball across the screen before releasing when mouse x,y position stops
void mouseDragged() {
  if (mouseY > 200) {
  ballX = mouseX;
  ballY = mouseY;
  click = true;
  }
}

// Make a polygon with x,y position, n points, and radius
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

//Sources
//https://processing.org/tutorials/color/
//https://processing.org/tutorials/drawing/
//https://processing.org/examples/regularpolygon.html
//https://processing.org/tutorials/pshape/
//https://processing.org/tutorials/text/
