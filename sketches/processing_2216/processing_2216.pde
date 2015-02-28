
/*
PROYECTO 02 SESION 3 : TECNICA skratch
 
 Título: skratch 2
 Nombre: Rut Abradó
 Fecha:  26 mayo 2009
 Lugar: Blanes
 Objetivo: modificacion de un sketch mediante la técnica skratch
 */

import processing.pdf.*;
float  angulo = 0;
int tamanio ;

// Example 5-9: Simple Gravity
float x = random(500);   // x location of square
float y = 0;     // y location of square
float speed = 0;   // speed of square
// A new variable, for gravity (i.e. acceleration).   
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.   
// Try changing this number to 2.0 and see what happens.
float gravity = 5.0;  


void setup() 
{
  background(255);
  frameRate(8); // Run slow...
  size(800 ,500);
  smooth();
  tamanio = width/20;
}


void draw() { 
  dibujarLinea();
  
  // Display the ellipse
  fill(252,255,25,100);
  stroke(255);
  ellipse(x,y,100,100);
  
  // Add speed to location.
  y = y + speed;
 
  // Add gravity to speed.
  speed = speed + gravity;
  
  // If square reaches the bottom
  // Reverse speed
  if (y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    speed = speed * -0.95;  
  }
  
}
void keyPressed() {
  switch(key) {
  case '+': 
    tamanio++;
    break;
  case '-': 
    tamanio--;
    break;

  case 'q': 
    println("endRecord");
    endRecord();
    break;
  case 's': 
    println("BEGIN RECORD");
    beginRecord(PDF, "Lines.pdf"); 
    break;
  }
}
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
  x = x + random(1);  //
  
}
void dibujarLinea(){
  if (mouseX != 0){
  pushMatrix();
   angulo =  angulo+ PI/6;
   strokeWeight(random(5,30));
    stroke(random(255),255,0);
     translate(mouseX,mouseY);
    rotate(angulo);
   
    line(0,0,250,5);
  popMatrix();
  }
}
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor(){
  float rojo = 10;
  float verde = random(100,255);
  float azul = 0;
  return color(rojo,verde,azul);
}


