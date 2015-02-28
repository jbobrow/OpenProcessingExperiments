
int arraySize= 80;
int[] x = new int[arraySize];
int[] y = new int[arraySize];
int[] xSpeed = new int[arraySize];
int[] ySpeed = new int [arraySize];
int value = 80;

void setup() {
  size(800, 600);

  //filling the array (x,y, xspeed,yspeed)
  for (int i = 0; i<arraySize; i++) {
    x[i]=int(random(800));
    y[i]=int(random(600));
    xSpeed[i]= int(random(4));
    ySpeed[i]= int(random(4));
  }
}

void draw() {
  background(255);
  noStroke();

  for (int i = 0; i<arraySize; i++) {
    x[i]=x[i]+xSpeed[i];
    y[i]=y[i]+ySpeed[i];
    fill(value, 200, 30, random(100));
    ellipse(x[i], y[i], 20, 20);
    if (x[i] >= width) {
      xSpeed[i] = xSpeed[i] * -1;
    }
    if (x[i] <= 0) {
      xSpeed[i] = xSpeed[i] * -1;
    }
    if (y[i] >= height) {
      ySpeed[i] = ySpeed[i] * -1;
    }
    if (y[i] <= 0 ) {
      ySpeed[i] = ySpeed[i] * -1;
    }
  }
}

void mouseClicked() {
  if (value == 80) {
    value = 255;
  }
  else {
    value = 80;
  }
}
