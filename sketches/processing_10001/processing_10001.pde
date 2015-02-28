
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(0);
  frameRate(30); 
  size(800,500);
  smooth();
  noCursor();
}

void draw() {
  dibujarLinea();
  dibujarLinea2();
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
  }}
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
}
void mouseMoved() {
  fill(random(0, 255),10);
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,500),map(mouseX,0,width,0,50));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/140;
    stroke(devuelveColor(),25);
    strokeWeight(4);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,mouseX*2,mouseY*2);
    popMatrix();
  }}
  void dibujarLinea2() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  -angulo+ PI/140;
    stroke(devuelveColor(),25);
    strokeWeight(4);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,mouseX*2,mouseY*2);
    popMatrix();
  }
}
void dibujarPelotas() {
  noStroke();
  fill(2*devuelveColor(),100);
  float tam = map(mouseY,0,height*2,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);

}
color devuelveColor() {
  float rojo = mouseX;
    float azul = mouseY;
  float verde = rojo*azul;

  return color(rojo,verde,azul);
}


