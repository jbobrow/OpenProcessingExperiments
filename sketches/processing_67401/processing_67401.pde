
//PImage spaceBg;

int numCircle = 500;
int num = 50;
int [] x = new int [num];
int [] y = new int [num];

float[] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] circleDiameter = new float [numCircle];

void setup() {

  frameRate(40);
  size(1920, 1080);

  noStroke();
  smooth();
  background(0);

  for (int i = 0; i < numCircle; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height); 
    circleDiameter[i] = random(0.25,1);
  }

  for (int i=0; i<num; i++) {
    x [i]=0;
    y [i]=0;
  }
}

void draw() {
  for (int i=1; i<num; i++) {
    x [i-1]= x[i];
    y [i-1]= y[i];//the first point
  }
  for (int i = 0; i < numCircle; i++) {
  fill(random(20, 255));
  ellipse(circleX[i], circleY[i], circleDiameter[i], circleDiameter[i]);
  }
}


void mouseClicked() {


  for (int i=1; i<num; i++) {
    x [i]=mouseX;
    y [i]=mouseY;
    strokeWeight(2);
    stroke(random(255), random(255), random(255), 130);
    line(x[i-1], y[i-1], x[i], y[i]);
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, 4, 4);
  }
}
void keyTyped() {

  if (key==' ') {
    background (0);
  }
  setup();
}


