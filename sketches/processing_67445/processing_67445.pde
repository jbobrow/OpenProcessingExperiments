
import processing.opengl.*;

int num = 5;

int [] x = new int [num];
int [] y = new int [num];

float a; //rotate speed

void setup() {		
  noStroke();
  background(248,255,211,90);
  size(1000, 700, OPENGL);
  smooth();
  for (int i=0; i<num; i++) {
    x [i]=mouseX;
    y [i]=mouseY;
  }
}


void draw() {
  //fill(random(15,25), 155, random(30), 80);
  translate(mouseX, mouseY);
  rotateY(a*100);
  rotateX(0);
  rotateZ(a*0.5);

  if (mousePressed) {  
    for (int i=1; i<num; i++) {
      x [i-1]= x[i];
      y [i-1]= y[i];//the first point
      ellipseMode(CORNER);
      
      fill(255,random(94,209),0,80);

      ellipse(x[i], y[i], random(40,50), random(40,50));
      rotateX(QUARTER_PI);
      rotateZ(PI);
      rotateY(10);
      a+=0.01;
      
      fill(random(0,181),198,random(6,129),80);
      ellipse(x[i], y[i]+200, random(30), random(20));
      rotateX(QUARTER_PI);
      rotateZ(PI);
      rotateY(PI);


    }
  }
}


