
int num = 100;
//Set up the array 

float[] x = new float[num];
float [] y = new float [num];


void setup() {
  size (300, 300);

  // seed the arrays 
  for (int k=0; k < y.length; k++) {
    x[k] = random(width);
    y[k] = random(height);
  }
}
void draw() {
  background(0);
  translate(-40, -50); //move the origin back to the top left

  for (int k=0; k< num; k++) {
    invader2 ((width/y.length) * k, y[k]);
    y[k] = y[k]+.5;
    if (y[k] > height) y[k] = 0;
  }

  translate(20, 20); // move the origin to offset invader 1

  for (int k=0; k< num; k++) {
    invader1 ((width/y.length) * k, y[k]);
    y[k] = y[k]+.5;
    if (y[k] > height) y[k] = 0;

    x[k] = x[k]+.5; 
    if (x[k] > height) {
      x[k] = 0;
    }
  }
}
  void mouseDragged() {
  defence(mouseX,mouseY);
}

//Function for invader # 1
void invader1 (float x, float y) {
  pushMatrix();
  translate (x, y);
  noStroke();
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(50, 50, 20, 10);
  stroke(222, 0, 0);
  strokeWeight(2);
  line(40, 50, 40, 43);
  line(60, 50, 60, 43);
  line(45, 55, 40, 57);
  line(55, 55, 60, 57);
  line(46, 45, 48, 43);
  line(55, 45, 53, 43);
  stroke(0, 0, 0);
  point(46, 48);
  point(53, 48);
  popMatrix();
}

//Function for invader # 2
void invader2 (float x, float y) {
  pushMatrix();
  translate (x, y);
  noStroke();
  fill(255, 255, 0);
  ellipseMode(CENTER);
  ellipse(50, 50, 20, 10);
  stroke(255, 255, 0);
  strokeWeight(2);
  line(40, 50, 40, 53);
  line(60, 50, 60, 53);
  line(45, 55, 40, 57);
  line(55, 55, 60, 57);
  line(46, 45, 48, 43);
  line(55, 45, 53, 43);
  stroke(0, 0, 0);
  point(46, 48);
  point(53, 48);
  popMatrix();
}
//Function for Devence ship

void defence (float x, float y) {
  pushMatrix();
  translate (x, y);
  noStroke();
  fill(0, 255, 25);
  ellipseMode(CENTER);
  ellipse(50, 50, 20, 10);
  rectMode(CORNER);
  rect(40, 50, 21, 6);
  stroke(0, 255, 25);
  strokeWeight(2);
  line(50, 50, 50, 43);
  popMatrix();
}


