
float [] x = new float [50];
float [] y = new float [50];
boolean drop = false;
float speed = 0.09;
int w = 5;

// set up the squares
void setup() {
  size (800, 600);
  background(255);
  noStroke();
  for (int i=0; i<y.length; i++) {
    for (int j=0; j<x.length; j++) {
      x[j] = j*20+10;
      y[i] = i*20+10;
      fill (random (0,255),random (0,255),random (0,255));
      rect (x[j], y[i], w, w);
    }
  }
}

// make the squares drop if mouse pressed
void draw() {
  if (drop == true){
  dropSquare();
  }
}

// redefine mousePressed function
void mousePressed() {
  drop = true;
}

// make the squares drop if mouse pressed
void dropSquare() {
  if (drop == true) {
    background(255);
    for (int i=0; i<y.length; i++) {
      for (int j=0; j<x.length; j++) {
        y[i] = y[i] + speed;
        fill (random (0,255),random (0,255),random (0,255));
        rect (x[j], y[i], w, w);
      }
    }
  }
}





