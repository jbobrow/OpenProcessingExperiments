
import processing.opengl.*;

int num = 5;
int [] x = new int [num];
int [] y = new int [num];

float a; 

void setup() {		
  noStroke();
  size(1000, 700, OPENGL);
  background(239, 240, 189, 40);
  smooth();
  for (int i=0; i<num; i++) {
    x [i]=20;
    y [i]=20;
  }
}


void draw() {


  fill(255, 30, 30, 30);
  translate(mouseX, mouseY);
  //rotateX(a*2);
  //rotateY(a*2);

  if (mousePressed) {
    for (int i=1; i<num; i++) {
      x [i-1]= x[i];
      y [i-1]= y[i];
      
      //rect(x[i], y[i], 50, 50); 
      //rotateX(QUARTER_PI);
   
     // rect(x[i], y[i], 50, 50); 
      rotateX(random(QUARTER_PI,PI));        
      ellipse(x[i], y[i], random(50), random(50)); 
     // rotateX(PI);  
      rotateY(random(QUARTER_PI,PI));

     
    }
  }

  else {
    for (int i=1; i<num; i++) {
      x [i]= 20;
      y [i]= 20;//the first point
    }
  }
}


