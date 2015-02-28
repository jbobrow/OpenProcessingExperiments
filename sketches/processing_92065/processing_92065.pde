
//Ben Norskov
//Array and For Loop interaction
//March 5, 2013
int num_of_ellipse = 200;
float[] elX = new float[num_of_ellipse];
float[] elY = new float[num_of_ellipse];
float[] elSpeed = new float[num_of_ellipse];
float gravity = .5;

int currentClick = 0;
void setup() {
  size(350, 550);
}

void draw() {
  background(14, 14, 14);
  for (int i = 0; i < num_of_ellipse; i++) {
    drawMyStuff(elX[i], elY[i]);
    elY[i] += elSpeed[i];
    elSpeed[i] += gravity;
  }
}

void drawMyStuff(float x, float y) {

  fill(0, 100, map(y, 0, height, 100, 255));
  ellipse(x, y, 20, 50);
  stroke(255, 0, 0);
  line(0, y, width, y);
  rect(x, y, 20, 20);
}

void mouseDragged() {
  elX[currentClick] = mouseX;
  elY[currentClick] = mouseY;
  elSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipse) {// == 20
    currentClick =0;
  }
}
