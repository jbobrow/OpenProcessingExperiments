
//Carla Caampos-Rodriguez
//Array and For Loop interaction
//March 9, 2013
int num_of_ellipse = 200;
int currentClick = 0;
float[] elX = new float[num_of_ellipse];
float[] elY = new float[num_of_ellipse];
float[] elSpeed = new float[num_of_ellipse];
float gravity = .5;
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  for (int i = 0; i < num_of_ellipse; i++) {
    DrawMyStuff(elX[i], elY[i]);
    elY[i] += elSpeed[i];
    elSpeed[i] += gravity;
    smooth();
  }
}
void DrawMyStuff(float X, float Y) {

  if (mouseY >166.6 == true) {
    stroke(102, 254, 203);//aqua
    line(X, Y, 200, 600);
  }
  if (mouseX > 200.6 == true) {

    stroke(255, 103, 102);//coral
    line(Y, X, 600, 600);
  }
  if (mouseY > 333.3 == true) {
    strokeWeight(1);

    stroke(153, 254, 0);//neongreen
    line(X, Y, 300, 600);
  }
  line(0, Y, width, X);
  smooth();
  noStroke();
  fill(102, 254, 203);//aqua
  ellipse(X, Y, 25, 25);
  fill(204, 153, 154);//lavender
  ellipse(Y, X, 10, 10);
  stroke(204, 153, 154);//lavender
  line(Y, X, 0, 600);
  stroke(102, 254, 203);//aqua
  line(X, Y, 25, 25);
  stroke(153, 254, 0);//neongreen
  line(Y, X, 25, 25);
  stroke(153, 254, 0);//neongreen
  line(X, Y, 300, 600);
}

void mouseMoved() {
  smooth();
  elX[currentClick] = mouseX;
  elY[currentClick] = mouseY;
  elSpeed[currentClick] = -10;
  currentClick += 1;
  if (currentClick > 19) {
    currentClick = 0;
  }
}
