
// Ryan Lofgren
// ISTA 301
// Assignment 3 - Processing
// Title: Ever changing landscape
// Description: Representation of ever changing landscapes, mentally, physically, digiatlly. 
// Instructions: Move your mouse accros the screen to affect the color and shape of the landscape.

color c1 = color(random(0,255),random(0,255),random(0,255)); // Find initial color of moving box 1
color c2 = color(random(0,255),random(0,255),random(0,255)); // Find initial color of moving box 2
color c3 = color(random(0,255),random(0,255),random(0,255)); // Find initial color of moving box 3
color c4 = color(random(0,255),random(0,255),random(0,255)); // Find initial color of moving box 4

// Find x and y starting points
float x1 = random(0,800); 
float y1 = random(0,450);
float x2 = random(0,800);
float y2 = random(0,450);
float x3 = random(0,800);
float y3 = random(0,450);
float x4 = random(0,800);
float y4 = random(0,450);

float speed = 10; // set speed of moving boxes

void setup() {
  size(800,450); // set window to 800x450 or 16:9
  background(0,0,0); // set background to black
}

void draw() {
  move(); // call void move
  display(); // call display
}

void move() {
  
  /// ---------------------------  
  /// Down and right
  x1 = x1 + speed;
  y1 = y1 + speed;
  
  if (x1 > width) {
    x1 = 1;
    c1 = color(random(0,255),random(0,255),random(0,255));
    }
  if (x1 < 0) {
    x1 = 1;
    }
  
  if (y1 > height) {
    y1 = 1;
    c1 = color(random(0,255),random(0,255),random(0,255));
    }
  if (y1 < 0) {
    y1 = 1;
    }
    
  /// -----------------------------
  ///Down and left
  x2 = x2 - speed;
  y2 = y2 + speed;
  
  if (x2 > width) {
    x2 = 799;
    }
  if (x2 < 0) {
    x2 = 799;
    c2 = color(random(0,255),random(0,255),random(0,255));
    }
  
  if (y2 > height) {
    y2 = 0;
    c2 = color(random(0,255),random(0,255),random(0,255));
    }
  if (y2 < 0) {
    y2 = 0;
    }
  
    
  /// ------------------------------
  /// Up and left
  x3 = x3 - speed;
  y3 = y3 - speed;
  
  if (x3 > width) {
    x3 = 799;
    }
  if (x3 < 0) {
    x3 = 799;
    c3 = color(random(0,255),random(0,255),random(0,255));
    }
  
  if (y3 > height) {
    y3 = 0;
    }
  if (y3 <= 0) {
    y3 = 448;
    c3 = color(random(0,255),random(0,255),random(0,255));
    }
 
  /// ------------------------------
  /// Up and right
  x4 = x4 + speed;
  y4 = y4 - speed;
  
  if (x4 > width) {
    x4 = 0;
    c4 = color(random(0,255),random(0,255),random(0,255)); 
    }
  if (x4 < 0) {
    x4 = 799;
    }
  
  if (y4 > height) {
    y4 = 0;
    }
  if (y4 <= 0) {
    y4 = 448;
    c4 = color(random(0,255),random(0,255),random(0,255));
    }
 
}

void display() { // Display function draws the rectangles
  c1 = color(mouseX,mouseY,(mouseX + mouseY)); // Find initial color of moving box 1
  fill(c1);
  rect(x1,y1,mouseX / 2,mouseY / 2); // Adject the size of the moving boxes by half the x and y position of the mouse
  c2 = color(mouseX,mouseY,(mouseX / 2)); // Find initial color of moving box 1
  fill(c2);
  rect(x2,y2,mouseX / 2,mouseY / 2); // Adject the size of the moving boxes by half the x and y position of the mouse
  c3 = color(mouseY,mouseX,(mouseX * mouseY / 2)); // Find initial color of moving box 1
  fill(c3);
  rect(x3,y3,mouseX / 2,mouseY / 2); // Adject the size of the moving boxes by half the x and y position of the mouse
  c4 = color(mouseX,mouseY,mouseX * 2); // Find initial color of moving box 1
  fill(c4);
  rect(x4,y4,mouseX / 2,mouseY / 2); // Adject the size of the moving boxes by half the x and y position of the mouse
}

void mousePressed() { // Resets the screen on a mouse click
  background(0,0,0);
}
  


