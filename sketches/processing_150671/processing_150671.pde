
// Ejercicio: Simular el movimiento lineal de un coche en 2 tramos 
// con pendientes 0 y PI/4 y velocidades v,v/2 en cada tramo.

float x=0, y=0;
float v = 0;
float dt = 0.02;
float dx;
float cx;
float cy;

void setup() {
  size(800, 500);
  noStroke();
  cx=(width*0.5);
  cy=(height*0.5);
}

void draw() {
  background(160);
  pushMatrix();
  segment(cx,cy,200,0);
  popMatrix();
  pushMatrix();
  segment(cx,cy,200,PI/2);
  popMatrix();
  if (x<cx) {
    //Tramo sin pendiente
    dx = v * dt;
    x += dx;
    y = 0;
  }
  else {
   
    // Tramo con pendiente
    dx = v/2 * dt;
    x += dx;
    if(v>0)
    y -= PI/4;
    
  }
 

  fill(255);
  ellipse(x, cy+y, 30, 30);
 
}
void segment(float x,float y, float length,float a){

  stroke(0,0,250);
  strokeWeight(1);
  translate(x,y);
  rotate(a);
  line(-length,0,length,0);
}
void keyPressed ()
{
    if (key==' ')
    { 
     if(v==0) 
       v=100;
     else
       v=0;
    }
}


