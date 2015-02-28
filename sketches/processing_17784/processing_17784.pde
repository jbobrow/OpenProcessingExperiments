
float incrementA, incrementB;
int iterations;
int baseX, baseY;
int len;
int d;

void setup() {
  size(400,400);
  background(255);
  stroke(0,0,0,255);
  smooth();
  iterations = 15;
  baseX = width/2;
  baseY = height/2;
  len = 10;
  d = 6;
  
  randomiseIncrements();
  bifurcate(baseX,baseY,-PI/2,iterations, incrementA);

}

void draw() {

}

void bifurcate(float x,float y, float a, int c, float i) {
  float X2=x+len*cos(a);
  float Y2=y+len*sin(a);
  a=a+i;
  
  float X3=X2+len*cos(a);
  float Y3=Y2+len*sin(a);
  a=a+i;
  
  float X4=X3+len*cos(a);
  float Y4=Y3+len*sin(a);
  a=a+i;
  
  //println(X2 + ", " + Y2 );
  //println(x + ", " + x );
  //println(X4 + ", " + Y4 );
  //println(X3 + ", " + Y3 );
  
  curve(X2, Y2, x, y, X4, Y4, X3, Y3);
  
  if (c>0) {
    bifurcate(X4,Y4,a,c-1, incrementA);
    bifurcate(X4,Y4,a,c-1, incrementB);

  }

}

void randomiseIncrements(){
  incrementA=random(-PI,PI);
  incrementB=random(-PI/PI);
}

void mousePressed() {
  background(255);
  randomiseIncrements();
  bifurcate(baseX,baseY,-PI/2,iterations, incrementA);
}

