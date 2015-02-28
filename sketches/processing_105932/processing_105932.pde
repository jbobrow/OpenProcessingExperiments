
int arraySize = 10;
int [] x=new int[arraySize];
int [] y=new int[arraySize];
int [] s=new int[arraySize];
int [] xSpeed=new int[arraySize];
int [] ySpeed=new int[arraySize];
int value = 50;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i= 0; i < arraySize; i++) {
    x[i]=int(random(150, 650));
    y[i]=int(random(150, 650));
    s[i]=int(random(50, 150));
    xSpeed[i] = int(random(-10, 10));
    ySpeed[i] = int(random(-10, 10));
  }
}
void draw() {
  background(91, 77, 95, 100);  // yellow background
  //ellipse(width/2,height/2, 200, 200);

  for (int i= 0; i<arraySize; i++) {
    x[i]=x[i]+xSpeed[i];
    y[i]=y[i]+ySpeed[i];


    // right boundary
    if (x[i] >= width) {
      xSpeed[i] = xSpeed[i] * -1;
      // OR xSpeed = -xSpeed;
      // xSpeed *= -1;
      // circleX = circleX + 100
      // circleX += 100
    }
    // left boundary
    if (x[i] <= 0) {
      xSpeed[i] = xSpeed[i] * -1;
    }
    // bottom boundary
    if (y[i] >= height) {
      ySpeed[i] = ySpeed[i] * -1;
    }
    // top boundary
    if (y[i] < 0 ) {
      ySpeed[i] = ySpeed[i] * -1;
    }
    fill (value, 90, 80, 100);
    ellipse(x[i], y[i], s[i], s[i]);
  }
}
void mousePressed() {
  if (value == 50) {
    value = 225;
  } 
  else {
    value = 50;
  }
}
