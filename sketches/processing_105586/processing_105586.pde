
// declaration
float [] x = new float [20];
float [] y = new float [20];
boolean drop = false;
float speed = 0;
float gravity = 0.02;
int w = 10;

// set up the squares
void setup() {
  size (800, 600);
  background(255);
  noStroke();
  for (int i=0; i<x.length; i++) {
    x[i] = i+random (0, 800);
    for (int j=0; j<y.length; j++) {
      y[j] = j+random (0, 600);
      fill (random (0, 255), random (0, 255), random (0, 255));
      ellipse (x[i], y[j], w, w);
    }
  }
}

// make the squares drop if mouse pressed
void draw() {
  if (drop == true) {
    dropBall();
  }
}

// redefine mousePressed function
void mousePressed() {
  drop = true;
}

// make the squares drop if mouse pressed
void dropBall() {
  if (drop == true) {
    background(255);        
    speed = speed + gravity;
    for (int i=0; i<y.length; i++) {
      for (int j=0; j<x.length; j++) {
        y[j]+=1;
        fill (random (0, 255), random (0, 255), random (0, 255));
        ellipse (x[i], y[j], w, w);
      }
    }
  }
}



