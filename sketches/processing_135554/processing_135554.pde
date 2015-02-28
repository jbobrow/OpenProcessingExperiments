
/*
Tarea 02: fibonacci painting (fibonacciando con el código de Tomás)
Taller de programación MDI UVeritas
 
Date:         21/2/14
Author:       Tomás de Camino
Modified by:  David Morera Chavarría

New features: color, distancia, angulos

*/


float dist=0;
float ang, angInc;
 
 
void setup() {
  size(400, 800);
  background(#863F0C);
  smooth();

}
 
void draw() { 

    fibonacciDraw(100, 160, 15, 2);
    if(frameCount%100==1){dist=100;}

}
 
void fibonacciDraw(float x, float y, int n, float s) {
  int fibonacci =2;
  int fibonacciAnt=1;
 
  stroke(0,50);
  pushMatrix();
  scale(s);
  fill(#FFC300,70);
  
  for (int j = 0;j<n;j++) {
    angInc = TWO_PI/fibonacci;
    ang=90;
    for (int i=0; i <fibonacci;i++) {
      pushMatrix();
      translate(x+dist*sin(ang), y+dist*cos(ang));
      rotate(ang);
     
      ellipse(0, 0, i, i);
      popMatrix();
      
      ang+=angInc;
      dist+=0.7;
    }
    dist+=0.01;
 
    fibonacci +=fibonacciAnt;
    fibonacciAnt = fibonacci;
  }
  popMatrix();
}

