
import processing.opengl.*;

int num = 5;

int [] x = new int [num];
int [] y = new int [num];

float a; //rotate speed

void setup() {		
  // noStroke();
  background(255, 40);
  size(1000, 700, OPENGL);
  smooth();
  for (int i=0; i<num; i++) {
    x [i]=mouseX;
    y [i]=mouseY;
  }
  background(255, 40);
}


void draw() {
  colorMode(RGB);
  //fill(random(15,25), 155, random(30), 80);
  translate(mouseX, mouseY);
  rotateY(a*0.1);
  rotateX(a*0.1);
  rotateZ(a*10);

  if (mousePressed) {  
    for (int i=1; i<num; i++) {
      x [i-1]= x[i];
      y [i-1]= y[i];//the first point
      ellipseMode(CORNER);
      ellipse(x[i], y[i], random(80,100), random(40,50));
      rotateX(QUARTER_PI);
      rotateZ(PI);
     // rotateY(10);
      a+=0.01;

      println("x[i]="+x[i]);
      println("y[i]="+y[i]);
    }
  }
}


