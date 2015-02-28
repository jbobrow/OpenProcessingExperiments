
/*
Aneta Genova
genovaa@newschool.edu
Copyright 2011
Parsons MFA D+T Bootcamp
Homework 8/15/11: Balls, Balls, Balls
*/


int numberBalls = 50;
float centerX [] = new float[numberBalls];
float centerY [] = new float[numberBalls];
float xspeed [] =  new float[numberBalls];
float yspeed [] =  new float[numberBalls];
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];


void setup() {
  size(500, 500);

  for (int i=0; i<numberBalls; i++) {
    centerX [i] = random(50, 450);
    centerY [i] = random(50, 450);

    xspeed[i]= random(10);
    yspeed[i]= random(10);
  }
}

void draw() {
  background(255, 255, 255);

  for (int i=0; i<numberBalls; i++) {

    centerX [i] = centerX[i] + xspeed[i];
    centerY [i] = centerY[i] + yspeed[i];

    if (centerX [i] > 450) {
      xspeed[i] = xspeed[i] * -1;
      r[i] = random(255);
      g [i]= random(255);
      b [i]= random(255);
    } 
    else if (centerX[i] < 50) {
      r[i] = random(255);
      g [i]= random(255);
      b [i]= random(255);
      xspeed[i] = xspeed[i] * -1;
    } 
    
    if (centerY[i] > 450) {
      r[i] = random(255);
      g [i]= random(255);
      b [i]= random(255);
      yspeed[i]= yspeed[i] *-1;
    } 
    else if (centerY[i] < 50) {
      r[i] = random(255);
      g [i]= random(255);
      b [i]= random(255);
      yspeed[i]=yspeed[i] * -1;
    }

    fill (r[i], g[i], b[i]);
    ellipse(centerX[i], centerY[i], 100, 100);
  }
}


