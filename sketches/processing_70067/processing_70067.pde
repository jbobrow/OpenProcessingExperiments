
float x=0,y=0;
float incX = 0.025,incY = 0.025; // son incrementos en X y Y asignados x mi.

float x2=0,y2=0;
float incX2 = 0.05,incY2 = 0.05;

float x3=0,y3=0;
float incX3 = 0.1, incY3=0.1;

//................

void setup(){
  size(400,200);
  background(0);
  //ellipseMode(CORNER);
  
}

//................

void draw(){
  
  background(0);
  
  float dx=mouseX-x;
  float dy=mouseY-y;
  
  float a = atan2(dy,dx); //calcula la tangente y primero va la coordenada "Y"
  

  smooth();
  noStroke();
  //ellipse(x,y,30,30);
  punta(x,y,a);
  
  float dx2 = x-x2;
  float dy2 = y-y2;
  
  float a2 = atan2(dy2,dx2);
  
  punta(x2+25,y2+25,a2);
  
  float dx3 = x-x3;
  float dy3 = y-y3;
  
  float a3 = atan2(dy3,dx3);
  
  punta(x3-25,y3-25,a3);
  
  x=x+incX*dx;
  y=y+incY*dy;
  
  x2 = x2+incX2*dx2;
  y2 = y2+incY2*dy2;
  
  x3 = x3+incX3*dx3;
  y3 = y3+incY3*dy3;
  
}

//..................

void punta(float x,float y,float ang){
  
  pushMatrix();
  translate(x,y);
  rotate(ang);
   fill(x,y,x+y,200);
   triangle(0,-20,0,20,20,0);
   popMatrix();
  
  
}

