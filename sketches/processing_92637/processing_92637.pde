
//Ana Cecilia Thompson
//March 10, 2013
//200 objects


int num_of_ellipse = 200;
float[] elX = new float[num_of_ellipse];
float[] elY = new float[num_of_ellipse];
float[] elSpeed = new float[num_of_ellipse];
float gravity = -.5;

int num_of_ellipseTwo = 200;
float[] ellX = new float[num_of_ellipseTwo];
float[] ellY = new float[num_of_ellipseTwo];
float[] ellSpeed = new float[num_of_ellipseTwo];

int num_of_ellipseThree = 200;
float[] elllX = new float[num_of_ellipseThree];
float[] elllY = new float[num_of_ellipseThree];
float[] elllSpeed = new float[num_of_ellipseThree];

int num_of_ellipseFour = 200;
float[] ellllX = new float[num_of_ellipseFour];
float[] ellllY = new float[num_of_ellipseFour];
float[] ellllSpeed = new float[num_of_ellipseFour];


int currentClick = 0;

void setup() {
  noStroke();
  size (400, 800);
}

void draw() {
  background (0);
  for (int i=0; i < num_of_ellipse; i++) {
    fill(250, 100, map(elY[i], height, 0, 200, 213));
    ellipse (elX[i], elY [i], 20, 20);
    elY[i] += elSpeed[i];
    elSpeed[i] += gravity;
  } 
  for (int i=0; i < num_of_ellipseTwo; i++) {
    fill(100, 0, map(ellY[i], height, 50, 0, 0));
    ellipse (ellX[i], ellY [i], 20, 20);
    ellY[i] += ellSpeed[i];
    ellSpeed[i] += gravity;
  }
  for (int i=0; i < num_of_ellipseThree; i++) {
    fill(0, 100, map(elllY[i], height, 0, 250, 255));
    ellipse (elllX[i], elllY [i], 20, 20);
    elllY[i] += elllSpeed[i];
    elllSpeed[i] += gravity;
  }
  for (int i=0; i < num_of_ellipseFour; i++) {
    fill(0, 100, map(ellllY[i], height, 203, 100, 0));
    ellipse (ellllX[i], ellllY [i], 20, 20);
    ellllY[i] += ellllSpeed[i];
    ellllSpeed[i] += gravity;
  }
}

void mouseDragged() {
  elX[currentClick] = mouseX;
  elY[currentClick] = (mouseY + 30);
  elSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipse) {
    currentClick = 0;
  }
  ellX[currentClick] = mouseX;
  ellY[currentClick] = (mouseY - 30);
  ellSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipseTwo) {
    currentClick = 0;
  }
  elllX[currentClick] = (mouseX + 30);
  elllY[currentClick] = mouseY;
  elllSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipseThree) {
    currentClick = 0;
  }
  ellllX[currentClick] = (mouseX - 30);
  ellllY[currentClick] = mouseY;
  ellllSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipseFour) {
    currentClick = 0;
  }
}
