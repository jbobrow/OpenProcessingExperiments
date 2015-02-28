
Spinner [] spinners;

/*Could not get the sketch to work past one line of rotating
ellipses.*/
int w;
int i;
int x;

void setup() {
  size(550, 550);
  spinners = new Spinner[10];
  x = 0;
  w = 50;
  float r = 0;
  while (r < 360) {
    while (w < width) {
      for (i = 0; i < spinners.length; i ++) {
        //for (int w = 50; w < 150; w += 50) {
        spinners[i] = new Spinner(w, 50, r);
        w = w + 50;
        r = r + 50;
        x = x + 1;
      }
    }
  }
} //end setup

void draw() {
  background(0);
  noStroke();

  fill(255);
  for (int i = 0; i < spinners.length; i++) {
    spinners[i].spin();
    spinners[i].display();
  }
} //end draw

class Spinner {
  float px, py;
  float angle;
  float frequency = 0.125;
  float radius = 25;
  
  Spinner (float temppx, float temppy, float increase) {
    px = temppx;
    py = temppy;
    //angle always initialized to zero
    angle = 0 + increase;
  } //end initializer

  //increase the angle
  void spin() {
    angle += frequency;
  } //end speed

  void display() {
    ellipseMode(CENTER);
    pushMatrix();
    translate(px, py);
    rotate(angle);
    arc(0, 0, radius, radius, PI, TWO_PI);
    popMatrix();
  }
}



