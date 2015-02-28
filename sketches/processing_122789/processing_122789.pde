
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
  
  background(255);
  
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

