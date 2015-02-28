
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(#FF0080);
  frameRate(30); 
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
    background(#FF0080);
    break;
  }
}
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
}
void mouseMoved() {
  fill(random(255),100);
stroke (25, 60);
  ellipse(random(width),random(height),map(mouseX,0,width,0,20),map(mouseX,0,width,0,20));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/80;
    stroke(255,100);
    strokeWeight(1);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(100,100,0,0);
    popMatrix();
  }
}
void dibujarPelotas() {
  stroke (10,50);
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 100;
  float verde = random(80,120);
  float azul = 255;
  return color(rojo,verde,azul);
}


