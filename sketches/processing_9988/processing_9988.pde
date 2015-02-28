
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(32,52,87);
  frameRate(50); 
  //He cambiado la frecuencia.
  size(800,500);
  smooth();
  cursor(HAND);
}
//He cambiado el Color y no me sale en el PDF. He puesto la mano de cursor.


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

  case 's': 
    println("endRecord");
    endRecord();
    break;
  case 'r': 
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
  fill(random(255),100);
  noStroke();
  rect(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));
}//He cambiado la ellipse por el rectangulo.
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/2;
    //He cambiado el angulo.
    stroke(0,20);
    strokeWeight(8);
    //He cambiado el grosor de la linea.
    translate(mouseX,mouseY);
    rotate(angulo);
    line(20,20,100,100);
    //He cambiado la situacion de la linea.
    popMatrix();
  }
}
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 255;
  float verde = random(100,255);
  float azul = 0;
  return color(rojo,verde,azul);
}


