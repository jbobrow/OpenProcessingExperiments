
/*
PROYECTO 01 SESION 2 :
 
 Título: cosas
 Nombre: Lluc Llobell
 Fecha:  27 de mayo de 2010
 Lugar: Girona
 Objetivo:trasforma sketch y hacer un pdf. Una vez echo esto subirlo.
 //
 
 Descripción: todo lo que quieras comentar describiendo tu proyecto
 */
// NO SE TE OLVIDE COMENTAR TODO LO POSIBLE EL CÓDIGO! 
import processing.pdf.*;
float  angulo = 20;
int tamanio=50 ;

void setup()
{
  background(255); //color de fondo 
  frameRate(10); //velocidad 
  size(500,200); //tamaÃ±o
  smooth(); //suavizado

}
 
void draw() {
  dibujarLinea();
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
}
void mouseMoved() {
  fill(random(255), 100,100); //color bolas
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,20),map(mouseX,0,width,2,2));
}
void dibujarLinea() {
  if (mouseY != 0) {
 
    pushMatrix();
    angulo =  angulo+ PI/200;
    stroke(1,200);
    strokeWeight(1);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,10,20);
    popMatrix();
  }
}
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,5,height,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 1; //cambio de colores bolas
  float verde = random(0,1);
  float azul = 10;
  return color(rojo,verde,azul);
}

