
// Ejercicio1: Simular el movimiento circular (w vueltas/seg) 
// de una punto que gira a una distancia r del centro.

float x;
float r=30;
float dt=0.1;



void setup(){
  size(640,360);
  stroke(0,250,0);
  fill(0,250,0);
 
}

void draw(){
  background(0,0,0);
  fill(200,200,0);
  
  x = x + dt;
  translate(r*sin(x),r*cos(x));
  ellipse(width/2, height/2, 20, 20);
  
}

void keyPressed(){
 
  if(key == 'r'){
    r += 1;
  }
  if(key == 'e'){
    r -= 1;
  }
 
}


