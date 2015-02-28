
int num = 20; // fish 

float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] speed = new float[num]; // fish speed

void setup() {
  size(300, 300);
  smooth();

  // seed the array
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = i * (height/num);
    speed[i] = random(0.5, 4);
  }
}

void draw() {
  background(101, 172, 232);


  for (int i=0; i < num; i++) {

    // draw fifh

    pushMatrix();
    translate(-x[i]+width, y[i]);
    noStroke();
    fill(188, 122, 15);
    ellipseMode(CENTER);
    ellipse(45, 45, 30, 10);
    triangle(53, 50, 53, 41, 80, 45);
    popMatrix();
    //bridge and man
    fill(59, 47, 11);
    rect(0, 0, 80, 600);
    fill(46, 35, 7);
    rect(60, 0, 20, 600);
    fill(252, 138, 151);
    rectMode(CENTER);
    rect(45, 45, 45, 80);
    fill(232, 207, 145);
    ellipse(45, 45, 50, 50);
    // update the fish variables in the array
    x[i] = x[i] + speed[i];
    if (x[i] >= width ) {
      x[i] = -10;
    }
  }
}





