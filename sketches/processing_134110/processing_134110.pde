
//tomas de camino
//finbonacci
//int fibonacci =2;
//int fibonacciAnt=1;
float dist=0;
float ang, angInc; 


void setup() {
  size(700, 700);
  //ellipseMode(CENTER);
  background(255);
  smooth();
}

void draw() {  
    fibonacciDraw(10, 300, 10, 1.5);
    if(frameCount%100==1){dist=100;}
}

void fibonacciDraw(float x, float y, int n, float s) {
  int fibonacci =2;
  int fibonacciAnt=1;
  //dist=0;
  //noStroke();
  stroke(0,100);
  pushMatrix();
  scale(s);
  fill(200, 255, 25, 100);
  for (int j = 0;j<n;j++) {
    angInc = TWO_PI/fibonacci;
    ang=0;
    for (int i=0; i <fibonacci;i++) {
      pushMatrix();
      translate(x+dist*sin(ang), y+dist*cos(ang));
      rotate(ang);
      ellipse(0, 0, i, i);
      popMatrix();
      ang+=angInc;
      dist+=0.5;
    }
    dist+=0.01;

    fibonacci +=fibonacciAnt;
    fibonacciAnt = fibonacci;
  } 
  popMatrix();
}

