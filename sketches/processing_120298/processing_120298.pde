
 /*   Homework Sevem - Mouse and Keyboard Composition
     Sabrina Pardus 
*/

// Variables for mouse input
boolean overWord = false;
boolean locked = false;

// Variables for font
PFont f;
float xcoord, ycoord;
float xOffSet = 0.0;
float yOffSet = 0.0;

// Variables for pentagon
Pentagon pentagon;

// Variales for balls
Ball ball1;
Ball ball2;


// Arrays of x2 position of pentagon
int [] xTopPentagon = {80, 60, 170, 98, 180, 220, 320, 330, 255, 300};
int [] xLeftPentagon = {18, 50, 135, 130, 220, 60, 260, 80, 150, 80};
int [] xRightPentagon = {330, 253, 390, 340, 340, 161, 160, 162, 300, 310};
int [] xBottomLeftPentagon = {15, 8, 60, 95, 180, 130, 245, 180};
int [] xBottomRightPentagon = {220, 100, 260, 160, 230, 320, 375, 365};

// Arrays of y2 position of pentagon
int [] yTopPentagon = {50, 150, 45, 345, 90, 195, 170, 140, 48, 30};
int [] yLeftPentagon = {25, 75, 40, 101, 130, 160, 230, 205, 350, 310};
int [] yRightPentagon = {45, 35, 125, 150, 250, 153, 170, 325, 245, 330};
int [] yBottomLeftPentagon = {325, 215, 225, 170, 240, 345, 310, 390};
int [] yBottomRightPentagon = {360, 225, 340, 160, 120, 210, 230, 315};

void setup() {
  size (400,400);
  smooth();
  
  xcoord = 100;
  ycoord = 200;
  
  // Initalize font
  f = loadFont("SegoePrint-Bold-35.vlw");
  
  // Initialize pentagon
  pentagon = new Pentagon(0, 4, 390, 4, xTopPentagon, xLeftPentagon, xRightPentagon, xBottomLeftPentagon, 
    xBottomRightPentagon, yTopPentagon, yLeftPentagon, yRightPentagon, yBottomLeftPentagon, yBottomRightPentagon);
  
  // Initalize balls
  ball1 = new Ball(64);
  ball2 = new Ball(32);
}

void draw() {
  background(0);
  smooth();
  stroke(255);
  
  // Move and display balls
  ball1.move();
  ball2.move();
  if (ball1.intersect(ball2)) {
    ball1.highlight();
    ball2.highlight();
  }
  ball1.display();
  ball2.display();
   
  // Tracks WOOHOO's coordinates
  
  textFont (f, 45);
  fill(255, 20, 147);
  text("Woohooo", xcoord, ycoord);
  
  // Key Pressed
  if (keyPressed) {
    // When 'g' is pressed, WOOHOO's color changes to green
    if (key == 'g') {
      fill(154, 205, 50);
      text("Woohooo", xcoord, ycoord);
    }
    // When 'b' is pressed, WOOHOO's color changes to blue
    else if (key == 'b') {
      fill (100, 138, 237);
      text("Woohooo", xcoord, ycoord);
    }
  } 
      
  if(mousePressed) {
    if (overWord) {
      locked = true;
      fill(255);
      text("Woohooo", xcoord, ycoord);
    } else {
      locked = false;
    }
  }
  
  // When the mouse is hovering over WOOHOO, the color changes to white 
  // When the mouse is pressed over WOOOHOO, the color changes back to blue
  if (mouseX > xcoord - 200 && mouseX < xcoord + 200 &&
      mouseY > ycoord - 13 && mouseY < ycoord + 13) {
      overWord = true;
      if (!locked) {
        fill(255, 105, 180);
        text("Woohooo", xcoord, ycoord);
      } else {
        overWord = false;
      }
  }
  
  strokeWeight(3);
  // Operator Composition Objects
  pentagon.createTopPentagon(xTopPentagon, yTopPentagon);
  pentagon.createRightPentagon(xRightPentagon, yRightPentagon);
  pentagon.createLeftPentagon(xLeftPentagon, yLeftPentagon);
  pentagon.createBottomLeftPentagon(xBottomLeftPentagon, yBottomLeftPentagon);
  pentagon.createBottomRightPentagon(xBottomRightPentagon, yBottomRightPentagon);    
  
}   





class Ball {
  float r;
  float x, y;
  float xspeed, yspeed;
  color c = color(100,50);
  
  // Constructor
  Ball (float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random(5, 15);
    yspeed = random(5, 15);
  }
  
  void move() {
    x += xspeed;  // Increment x
    y += yspeed;   // Increment y
    
    // Check horizontal edges
    if (x >= width || x <= 0) {
      xspeed *= -1;
    }
    
    // Check vertical edges 
    if (y >= height || y <= 0) {
      yspeed *= -1;
    }
  }
  
  color randColors() {
     float r = random(55,220);
     float g = random(55,220);
     float b = random(55,220);
     return color(r,g,b);
  }
  
  void highlight() {
      c = color (randColors());
  }
  
  // Draw the ball 
  void display() {
    fill (c);
    ellipse(x, y, r*2, r*2);
  }
  
  // Checks for intersection
  boolean intersect (Ball b) {
    float distance = dist(x, y, b.x, b.y);    // Calculate distance
    if (distance < r + b.r) {                 // Compare distance to sum of radii
      return true;
    }
    else {
      return false;
    }
  }
}

class Pentagon {
  // Variables to move rectangles across the screen
  int x;
  int xSpeed;
  int y;
  int ySpeed;
  
  // Arrays of x2 positions to draw top, left, right, bottom-left, and bottom-right of pentagon
  int [] xTopPentagon;
  int [] xRightPentagon;
  int [] xLeftPentagon;
  int [] xBottomLeftPentagon;
  int [] xBottomRightPentagon;
  
  // Arrays of y2 positions to draw top, left, right, bottom-left, and bottom-right of pentagon
  int [] yTopPentagon;
  int [] yRightPentagon;
  int [] yLeftPentagon;
  int [] yBottomLeftPentagon;
  int [] yBottomRightPentagon;
  
 
  Pentagon(int tempX, int tempXSpeed, int tempY, int tempYSpeed, int [] tempXTopPentagon, int [] tempXLeftPentagon,
     int [] tempXRightPentagon, int [] tempXBottomLeftPentagon, int [] tempXBottomRightPentagon, int [] tempYTopPentagon, 
     int [] tempYLeftPentagon, int [] tempYRightPentagon, int [] tempYBottomLeftPentagon, int [] tempYBottomRightPentagon) {
     x = tempX;
     xSpeed = tempXSpeed;
     y = tempY;
     ySpeed = tempYSpeed;
     xTopPentagon = tempXTopPentagon;
     xLeftPentagon = tempXLeftPentagon;
     xRightPentagon = tempXRightPentagon;
     xBottomLeftPentagon = tempXBottomLeftPentagon;
     xBottomRightPentagon = tempXBottomRightPentagon;  
     yTopPentagon = tempYTopPentagon;
     yLeftPentagon = tempYLeftPentagon;
     yRightPentagon = tempYRightPentagon;
     yBottomLeftPentagon = tempYBottomLeftPentagon;
     yBottomRightPentagon = tempYBottomRightPentagon;    
   }
   
   // Create the pentagon
   void createTopPentagon(int[] x2, int[] y2) {
     for (int i = 0; i < x2.length; i++) {      
       line (200, 0, x2[i], y2[i]);
     }
   }
   
   void createRightPentagon (int[] x2, int[] y2) {
     for (int i = 0; i < x2.length; i++) {      
       line (400, 160, x2[i], y2[i]);
     }     
   }
   
   void createLeftPentagon (int[] x2, int[] y2) {
     for (int i = 0; i < x2.length; i++) {      
       line (0, 160, x2[i], y2[i]);
     }    
   }
   
   void createBottomLeftPentagon (int[] x2, int[] y2) {
     for (int i = 0; i < x2.length; i++) {      
       line (80, 400, x2[i], y2[i]);
     }  
   }
   
   void createBottomRightPentagon (int[] x2, int[] y2) {
     for (int i = 0; i < x2.length; i++) {      
       line (320, 400, x2[i], y2[i]);
     }
   }
}
     







