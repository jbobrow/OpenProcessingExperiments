
/*   Homework Eight - Image Composition
     Sabrina Pardus 
*/

Pentagon pentagon;
Timer timer;
Pic pic1;
PVector location;
PVector velocity;


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
  frameRate(10);

  // Initialize pentagon
  pentagon = new Pentagon(0, 4, 390, 4, xTopPentagon, xLeftPentagon, xRightPentagon, xBottomLeftPentagon, 
    xBottomRightPentagon, yTopPentagon, yLeftPentagon, yRightPentagon, yBottomLeftPentagon, yBottomRightPentagon);
 
  // Initalize timer
  timer = new Timer(1000);
  timer.start();
  
  // Initalize balls
  pic1 = new Pic("http://teacupspuppies.com/images/HalloweenWitch3b.jpg");
  
}

void draw() {
  background(0);
  // Timed drawing of random colors
  if (timer.isFinished()) {
    stroke(timer.randColors());
    timer.start();
  }
  strokeWeight(3);
  

  
  // Operator Composition Objects
  pentagon.createTopPentagon(xTopPentagon, yTopPentagon);
  pentagon.createRightPentagon(xRightPentagon, yRightPentagon);
  pentagon.createLeftPentagon(xLeftPentagon, yLeftPentagon);
  pentagon.createBottomLeftPentagon(xBottomLeftPentagon, yBottomLeftPentagon);
  pentagon.createBottomRightPentagon(xBottomRightPentagon, yBottomRightPentagon);  
  
  
  // Move and display balls
  pic1.display();
  pic1.move(); 
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
     





class Pic {
  PImage pic;
  float x, y;
  float xspeed, yspeed;
  
  // Constructor
  Pic (String url) {
    pic = loadImage(url);
    xspeed = random(10, 20);
    yspeed = random(10, 20);
  }
  
  void move() {
    x += xspeed;  // Increment x
    y += yspeed;   // Increment y
    
    // Check horizontal edges
    if (x >= width-pic.width || x <= 0) {
      xspeed *= -1;
    }
    
    // Check vertical edges 
    if (y >= height-pic.height || y <= 0) {
      yspeed *= -1;
    }
  }
  
  void bounce() {
    xspeed *= -1;
    yspeed *= -1;
  }
  
  void display() {
    image(pic, x, y);
  }
}
class Timer {
  int savedTime;    // When Timer started
  int totalTime;    // How long Timer should last
  
  Timer (int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    savedTime = millis();
  }
  
  // Random colors
   color randColors() {
     float r = random(55,220);
     float g = random(55,220);
     float b = random(55,220);
     return color(r,g,b);
   }

  boolean isFinished () {
    // Check how much time has passed
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


