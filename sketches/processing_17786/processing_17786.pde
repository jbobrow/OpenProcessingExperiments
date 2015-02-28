
float incrementA, incrementB;
int iterations;
int baseX, baseY;
int len;
int d;

void setup() {
  size(400,400);
  background(255);
  stroke(0,0,0,100);
  smooth();
  iterations = 15;
  baseX = width/2;
  baseY = height/2;
  len = 20;
  d = 6;
  
  randomiseIncrements();
  bifurcate(baseX,baseY,-PI/2,iterations, len);

}

void draw() {

}

void bifurcate(float x,float y, float a, int c, int l) {
  float newX=x+l*cos(a);
  float newY=y+l*sin(a);
  //randomiseIncrements();
  ellipse(x, y, l, l);
  if (c>0) {
    bifurcate(newX,newY,a+incrementA,c-1,l-1);
    bifurcate(newX,newY,a+incrementB,c-1,l-1);

  }

}

void randomiseIncrements(){
  incrementA=random(-PI,PI);
  incrementB=random(-PI,PI);
}

void mousePressed() {
  background(255);
  randomiseIncrements();
  bifurcate(baseX,baseY,-PI/2,iterations, len);
}

