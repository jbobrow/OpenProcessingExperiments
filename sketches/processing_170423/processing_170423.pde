

Ball[] allBalls = new Ball[100];
boolean isGrowing = true;

void setup() {
  size(400, 400);
  frameRate(30);
  smooth();
  noStroke();
  for (int i = 0; i < allBalls.length; i ++ ) { 
    allBalls[i] = new Ball(1);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < allBalls.length; i++ ) {
    if (isGrowing == true) {
      allBalls[i].grow();
    }
  }
  //Collision Detection
  for (int j = 0; j < allBalls.length; j++ ) { // Initialize each Car using a for loop.
    for (int z = 0; z < allBalls.length; z++) {
      if (j!=z) {
        if (allBalls[j].intersect(allBalls[z])) {
          color c = color(random(255), random(255), random(255));
          allBalls[j].resetMe(c);
          allBalls[z].resetMe(c);
        }
      }
    }
  }

  for (int k = 0; k < allBalls.length; k++ ) { 
    allBalls[k].display();
  }
}
void mousePressed(){
    if(isGrowing == true){
      isGrowing = false;
    }
    else{
      isGrowing = true; 
    }
  }
class Ball {

  float r; // radius
  float x, y;
  color c = color(random(255),random(255),random(255));
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
  }

  void grow() {
      r+=2;
  }

  void resetMe(color c_) { 
    c = c_;
    r = 0;
    x = random(width);
    y = random(height);
  }

  // Draw the ball
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r*2, r*2);
  }


  boolean intersect(Ball b) {

    // Objects can be passed into functions as arguments too! 
    float distance = dist(x, y, b.x, b.y); // Calculate distance

    // Compare distance to sum of radii
    if (distance < r + b.r) {
      return true;
    } 
    else {
      return false;
    }
  }
  
}



