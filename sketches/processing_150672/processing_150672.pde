
// Ejercicio: Animar el movimiento de una particula a velocidad v sobre
//las 2 funciones osciladoras.
//Con las teclas + y - se controla la velocidad
float x=0;
float y=0;
float x1=0;
float y1=0;
float dt=0.05;
float v=5;
float t=0.0;
float cx;
float cy;


void setup() {
  size(800, 500);
  cx=(10);
  cy=(height*0.5);
  y= cy-100;
  y1= cy+100;
  background(0);
  fill(0,255,0);
  text("y=70*sin(0.3*x1)*exp(-0.002*x1)",30,20);
  fill(255,0,0);
  text("y=50*sin(0.2*x)+50*sin(0.22*x)",30,40);
}

void draw() {

  pushMatrix();
  fill(0);
  rect(500,10,300,100);
  fill(255);
  textSize(14);
  text("Velocidad= "+v,600,30);
  popMatrix();
  
  pushMatrix();
  segment(cx,cy,500,0);
  popMatrix();
  pushMatrix();
  segment(cx,cy,300,PI/2);
  popMatrix();
  pushMatrix();
  noStroke();
  fill(255,0,0);
  ellipse(cx+x,cy+y,10,10);
  popMatrix();
  pushMatrix();
  noStroke();
  fill(0,255,0);
  ellipse(cx+x1,cy+y1,10,10);
  popMatrix();
  x = t;
  x1 = t;
  
  y1=70*sin(0.3*x1)*exp(-0.002*x1)-100;
  y=50*sin(0.2*x)+50*sin(0.22*x)+100;
  
  t+=dt*v; 
  

  
}
void segment(float x,float y, float length,float a){

  stroke(250);
  strokeWeight(1);
  translate(x,y);
  rotate(a);
  line(-length,0,length,0);
}
void keyPressed()
{
    if (key == '+') {
      v+=0.1;
    }
    if (key == '-'){
      if(v>0.1)
       v-=0.1;
  }
}
