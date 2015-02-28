
/*

IDEP 2010 - Alba Corral
Dibujando_Modificado
 
 Nombre: Gabriela Lopes
 Fecha:  27/05/2010
*/

import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(255);
  frameRate(30); 
  size(500,500);
  smooth();
  noCursor();
}

void draw() {
  dibujarLinea();
}

void keyPressed() { 
  //dibujo ao mexer o mmouse (bolotas e *)
  switch(key) {
  case '+': 
    tamanio++;
    break;
  case '-': 
    tamanio--;
    break;

  case 'q': 
    println("endRecord");//pdf fim
    endRecord();
    break;
  case 's': 
    println("BEGIN RECORD");//pdf inicio
    beginRecord(PDF, "Lines.pdf"); 
    break;
  }
}
void mouseDragged() {// ? aaa
  println("ddddm:"+tamanio);
  dibujarPelotas();
}
void mouseMoved() { // bolotinhas se movem em random de espaço
  fill(random(790),800);//color random...acho eu
  ellipse(random(150),random(300,300),10,10);
}//random limitando o espaço
void dibujarLinea() { // *rotativo
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI;
    stroke(233,233,233);
    strokeWeight(1);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,500,500);
    popMatrix(); 
  }
}
void dibujarPelotas() {
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  ellipse(mouseX,mouseY, 150,50);
}
color devuelveColor() {
  float rojo = 96;
  float verde = 38;
  float azul = 126;
  return color(rojo,verde,azul);
}


