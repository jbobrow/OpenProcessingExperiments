
// based on an example from the book 'algorithms for visual design'

// an array of 100 "Stick" objects
// see the bottom of the code for the Stick class definition 
Stick[] sticks = new Stick[100];

// a variable to control the animation
boolean paused = false;

void setup() {
  size(300, 300);  
  smooth();
  rectMode(CENTER);
 
  // create 100 new Stick objects
  for (int i=0; i < sticks.length; i++) {
    // using variables for clarity, but you could also put the 
    // calls to random() straight into the constructor
    float x = random(width);
    float y = random(height);
    float r = random(TWO_PI);
    // create a new Stick object with a specific set of parameters
    sticks[i] = new Stick(x, y, r);
  }  
}

void draw() {
  background(64);
  fill(255);
  
  // draw more or less sticks based on the value of mouseY
  int numRect = int(map(mouseY, 0, height, 1, sticks.length));
  
  for (int i=0; i < numRect; i++) {
    pushMatrix();
      sticks[i].display();
      if (paused == false) {
        sticks[i].animate();
      }
    popMatrix();
  }
}

void mousePressed() {
  // "toggle" pause
  paused = !paused;   // ie: pause = NOT pause
}    

///////////////////////////////////////////////////////////////////////
class Stick {
  float x;
  float y;
  float rotation;  

  // Constructor -- used when creating a new Stick
  Stick( float x, float y, float rotation ) {
    this.x = x;
    this.y = y;
    this.rotation = rotation;
  }  
  
  // Simple function to draw the stick
  void display() {
    rectMode(CENTER);
    pushMatrix(); // save the state of the canvas/origin
      translate(this.x, this.y);
      rotate(this.rotation);
      rect(0, 0, 5, 1000);
    popMatrix(); // restore the state pf the canvas/origin
  }
  
  // Call this to animate the stick
  void animate() {
     // in this case, animate means -> change the rotation
     this.rotation += 0.002;
  }
}

