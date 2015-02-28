
Charmander charmander;
Timer timer;        // One timer object
Drop[] drops;       // An array of drop objects
int totalDrops = 0; // totalDrops
int BG = 255;  // a changeable background color
int score = 0; // the player's score (time spent alive)
int highScore = 0;
PFont f;

void setup() {
  f = createFont("Arial", 13, true);
  size(1000, 750);
  background(255);
  smooth();
  charmander = new Charmander();
  drops = new Drop[1000];    // Create 1000 spots in the array
  timer = new Timer(300);   // Create a timer that goes off every 2 seconds
  timer.start();             // Starting the timer
}


void draw() {
  background(BG);
  charmander.display();
  charmander.keyPressed();
  keyPressed();
  if (BG == 255) {
    score = score + 1;  // if charmander is alive, increase the score over time
  }  // Check the timer
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
    if (charmander.dies(drops[i])) { //if Charmander gets hit by a rain drop
      drops[i].charmanderDied();
      BG = 100; //turn the screen grey
    }
  }
  fill(255, 0, 0); // print the score in red
  textFont(f, 40);
  text(score, 830, 50);  // print the score in the upper right
  fill(0, 255, 0);
  text(highScore, 40, 50); // print the previous score in the upper left after you die
}

class Charmander {  
  float charX = 50;
  float charY = 150;
  float xPos = width/2 - charX/2;
  float yPos = height - charY;
  void display() {
    fill(0);
    rect(xPos, yPos, charX, charY);  //Charmander's hitbox
  }
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {  //if you push the right arrow Charmander moves over by 10
        xPos = xPos + 10;
      }
      if (keyCode == LEFT) {  //if you push the left arrow Charmander moves over by 10
        xPos = xPos - 10;
      }
      if (keyCode == DOWN) {
        if(highScore < score) {
          highScore = score;
        }
        score = 0;
        BG = 255;
       // totalDrops = 1000;
      }
      keyCode = UP;  //removes the issue of the rectangle moving forever because the key is stored
    }
  }
  boolean dies(Drop d) {
    float dropX = d.x;
    float dropY = d.y;
    if (xPos < dropX && dropX < xPos + charX && yPos < dropY) {
      //if it's to the right of the left boundary of the hitbox and to the left of the right boundary
      //and below the top boundary
      //then it is intersecting Charmander's hitbox
      //kill him.
      return true;
    }
    else {
      return false;
    }
  }
}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-10: The raindrop catching game

class Drop {
  float x, y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  color c;
  float r;     // Radius of raindrop

  Drop() {
    r = 8;                 // All raindrops are the same size
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    speed = random(1, 5);   // Pick a random speed
    c = color(50, 100, 150); // Color
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
    } 
    else {
      return false;
    }
  }

  // Display the raindrop
  void display() {
    // Display the drop
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }

  // If the drop is caught
  void charmanderDied() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
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
    } 
    else {
      return false;
    }
  }
}



