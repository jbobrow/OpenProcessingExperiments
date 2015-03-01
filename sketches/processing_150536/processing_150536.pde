
// Ejercicio: Animar el movimiento de una particula a velocidad v sobre 
// las 2 funciones osciladoras.

float x, y1, y2;
float v=3;
float dt=0.025;
float dx;
float A1=50;
float A2=100;

void setup(){
  size(640,360);
  fill(0,255,255);
  
}

void draw(){
  background(0);
  
  stroke(0,255,0);
  line(0,height/4,width,height/4);
  line(0,height/4+200,width,height/4+200);
  
  text("Amplitud onda azul: "+A1, 10,100);
  text("Amplitud onda amarilla: "+A2, 10,300);
  
  
  dx= v*dt;
  x += dx;
  
  pushMatrix();
  y1= A1*sin(3*x) + A1*sin(3.5*x);
  translate(x*20,y1);
  fill(0,255,255);
  noStroke();
  ellipse(0,height/4,10,10);
  if (x >= 32)
    x=0;
  popMatrix();
  
  pushMatrix();
  y2= A2*sin(x)*exp(-0.011*x);
  translate(x*20,y2);
  fill(255,255,0);
  noStroke();
  ellipse(0,height/4+200,10,10);
  if (x >= 32)
    x=0;
  popMatrix();
  
}

void keyPressed(){
  
  if(key == 'q'){
    A1 -=2;
    }
  if(key == 'w'){
    A1 +=2;
    }
  if(key == 'a'){
    A2 -=2;
    }
  if(key == 's'){
    A2 +=2;
    }
  }  

