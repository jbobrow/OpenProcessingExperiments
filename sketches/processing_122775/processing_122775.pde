
import gifAnimation.*;
Gif loopingGif2; 
Gif loopingGif;
Catcher catcher;
Timer timer;        // One timer object
Drop[] drops;       // An array of drop objects
int totalDrops = 0; // totalDrops
int[] xpos = new int[50]; 
int[] ypos = new int[50];

void setup() {
  size(800,600);
  loopingGif  = new Gif(this, "ship.gif");
  loopingGif2 = new Gif(this, "astroid.gif");
  loopingGif.loop();
  loopingGif2.loop();
  catcher = new Catcher(32); // Create the catcher with a radius of 32
  drops = new Drop[1000];    // Create 1000 spots in the array
  timer = new Timer(300);   // Create a timer that goes off every 2 seconds
  timer.start();             // Starting the timer
  smooth();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw() {
  
  background(230);
  
  catcher.setLocation(mouseX,mouseY);
  catcher.display();
  catcher.keyPressed();
  // Check the timer
  if (timer.isFinished()) {
    // Deal with raindrops
    // Initialize one drop
    drops[totalDrops] = new Drop();
    // Increment totalDrops
    totalDrops ++ ;
    // If we hit the end of the array
    if (totalDrops >= drops.length) {
      totalDrops = 0; // Start over
    }
    timer.start();
  }
  // Move and display all drops
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    if (catcher.intersect(drops[i])) {
      drops[i].caught();
    }
  }
    
}


class Drop {
  float x,y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  color c;
  float r;     // Radius of raindrop

  Drop() {
    r = random(5,15);                 // All raindrops are the same size
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    speed = random(1,5);   // Pick a random speed
    c = color(100); // Color
  }

  // Move the raindrop down
  void move() {
    // Increment by speed
    y += speed; 
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  // Display the raindrop
  void display() {
    // Display the drop
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x,y,40,40);
      image(loopingGif2,x-32,y-70);
    }
  }

  // If the drop is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
  }
}

class Catcher {
  
  float r;   // radius

  int[] xpos = new int[50];
  int[] ypos = new int[50];
  int radius = 10, directionX = 1, directionY = 0;
  int x = 20, y = 20, speed = 1;
  
  
  
  Catcher(float tempR) {
    r = tempR;
    x = 400;
    y = 500;
  }
  
  void setLocation(float tempX, float tempY) {
    x = x+speed*directionX;
    y = y+speed*directionY;
    
    if ((x>width-radius) || (x<radius)) {
      directionX=-directionX;
    }
    if ((y>height-radius) || (y<radius)) {
      directionY=-directionY;
    }
  }
    
  void keyPressed() {
      if(key == CODED)
      {
        if(keyCode==LEFT)
        {
          directionX=-4;
          directionY=0;
         
        }
        else if (keyCode == RIGHT)
        {
          directionX=4;
          directionY=0;
          
        }
        else if (keyCode == UP)
        {
          directionY=-4;
          directionX=0;
        }
        else if (keyCode == DOWN) {
        directionY=4;
        directionX=0;
        }
  }
    }
  void display() {
    for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    
  }
  
  // New location
  
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(255-i*5);
    
    stroke(0);
    fill(220);
    ellipse(x,y,r*2,r*2);
    image(loopingGif, x-50,y-50);
  }
  // A function that returns true or false based on
  // if the catcher intersects a raindrop
  }
  boolean intersect(Drop d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
  }


// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if "totalTime" has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


