
// Ejercicio: Simular el movimiento circular (w vueltas/seg) 
// de una punto que gira a una distancia r del centro
 
float x, y;
float dt = 0.08;
float w=0.7;
float r = 250;
float cx;
float cy;
void setup() {

  size(800, 500);
  
  cx=(width*0.5);
  cy=(height*0.5);
  background(0);
  pushMatrix();
  segment(cx,cy,200,0);
  popMatrix();
   pushMatrix();
  segment(cx,cy,200,PI/2);
  popMatrix();
}

void draw() {
 
 
   if ( r > 0 ) {
    x += w*dt;
    r -= 0.5;
  }
  else {
    w = 0;
  }
  pushMatrix();
  translate(r*cos(x), r*sin(x));
  noStroke();
  fill(255,30,30);
  ellipse(width/2, height/2, 20, 20);
  popMatrix();
}
void segment(float x,float y, float length,float a){

  stroke(255);
  strokeWeight(1);
  translate(x,y);
  rotate(a);
  line(-length,0,length,0);
}
void keyPressed(){
  if (key==' ')
  {
    setup();
    r=260;
    x=0;
    w=0.7;
  }
}


