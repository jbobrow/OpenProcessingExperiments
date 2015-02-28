
float [] hourBalls = new float [12];
float [] minuteBalls = new float [60];
float [] secondBalls = new float [60];

float circleX;
float circleY;

float circleI;
float circleJ;

float circleF;
float circleE;

float radius;
float radius2;
float radius3;

float tickS;
float tickM;
float tickH;

int speed;

void setup() {

  size(400, 400);
  smooth();
  noStroke();

  radius = 100;
  radius2 = 140;
  radius3 = 200;

  circleX = 0;
  circleY = 0;

  circleI = 0;
  circleJ = 0;

  circleF = 0;
  circleE = 0;

  tickS = map(second(), 0, 59, 0, 360);
  tickM = map(minute(), 0, 59, 0, 360);
  tickH = map(hour(), 0, 11, 0, 360);
}

void draw() {

  background(255);

  map(second(), 0, 59, 0, 360);

  pushMatrix();
  translate (width/2, height/2);

  rotate(radians(tickS));


  for (int h=0; h<12; h++) {

    rotate(radians(tickH));

    int x = (int)(circleX+radius3*cos(hourBalls[h]));
    int y = (int)(circleY+radius3*sin(hourBalls[h]));

    fill(10, 20, 20);
    ellipse(x, y, 20, 20);
  }
  popMatrix();


  map(minute(), 0, 59, 0, 360);

  pushMatrix();
  translate (width/2, height/2);

  rotate(tickM*2*PI);


  for (int m=0; m<60; m++) {

    rotate(radians(tickM));

    int i = (int)(circleI+radius2*cos(minuteBalls[m]));
    int j = (int)(circleJ+radius2*sin(minuteBalls[m])); 

    fill(10, 200, 20);
    ellipse(i, j, 15, 15);
  }
  popMatrix();

  map(hour(), 0, 59, 0, 360);

  pushMatrix();
  translate (width/2, height/2);

  rotate(radians(tickH));

  for (int s=0; s<60; s++) {

  rotate(radians(tickS));

    int f = (int)(circleF+radius*cos(secondBalls[s]));
    int e = (int)(circleE+radius*sin(secondBalls[s]));

    fill(20, 100, 20);
    ellipse(f, e, 10, 10);
  }
  popMatrix();
}
