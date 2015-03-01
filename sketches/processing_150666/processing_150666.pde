
// Ejercicio: Simular el movimiento circular (w vueltas/seg) 
// de una punto que gira a una distancia r del centro
 
float x, y;
float dt = 0.05;
float r = 150;
float cx;
float cy;
void setup() {
  size(800, 500);
  noStroke();
  cx=(width*0.5);
  cy=(height*0.5);
}

void draw() {
  background(0);
  pushMatrix();
  segment(cx,cy,200,0);
  popMatrix();
   pushMatrix();
  segment(cx,cy,200,PI/2);
  popMatrix();
  x = x + dt;
  
  translate(r*sin(x), r*cos(x));
  fill(255);
  ellipse(width/2, height/2, 40, 40);
 
}
void segment(float x,float y, float length,float a){

  stroke(250,0,0);
  strokeWeight(1);
  translate(x,y);
  rotate(a);
  line(-length,0,length,0);
}


