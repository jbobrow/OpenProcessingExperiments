
import processing.pdf.*;
float  angulo = 1;
int tamanio=20 ;
void setup() 
{
  background(255);
  frameRate(60); 
  size(800,500);
  smooth();
  noCursor();
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
  fill(random(2),0);
  noStroke();
  rect(random(width),random(height),map(mouseX,50,width,0,50),map(mouseX,0,width,0,50));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/100;
    stroke(0,20);
    strokeWeight(1);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,2,100,100);
    popMatrix();
  }
}
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  rect(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 50;
  float verde = 225;
  float azul = 0;
  float aplpha = 100; 
  return color(rojo,verde,azul);
}


