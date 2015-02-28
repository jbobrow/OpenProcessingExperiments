


// Juan Garcia Idep 10/11 Processing session 2

import processing.pdf.*;

int tamanio ;
void setup() 
{
  background(#76FF00);
  frameRate(120); //
  size(800 ,500);
  smooth();
  tamanio = width/20;
}

void draw(){
    
 dibujarLinea();

}
// augmenta el tamanio o lo reduce segun se 
//mantengan las teclas mas o menos del teclado presionadas

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
}
void dibujarLinea(){
   stroke(#FF00F3);
   line(mouseX,mouseY,mouseX+random(500),mouseY+random(500));
   
   // - = izquierda/arriba + = derecha/abajo proyeccion de las lineas con random 

  }
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,400,height,0,tamanio);
  // valor del tamanio de las pelotas varia segun la posicion del raton 
  ellipse(mouseX,mouseY, tam,tam);

}
 //colores
color devuelveColor(){
  float rojo = #9800FF;
  float verde = random(100,255);
  float azul = 0;
  return color(rojo,verde,azul);
  }

