
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(255);
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
  case 't': 
    tamanio++;
    break;
  case 'z': 
    tamanio--;
    break;

  case 'q': 
    println("endRecord");
    endRecord();
    break;
  case 'p': 
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
  ellipse(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/3;
    stroke(4,70,120);
    strokeWeight(20);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,20,20);
    popMatrix();
  }
}
void dibujarPelotas() {
  stroke(4,90,170);
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 170;
  float verde = random(100,130);
  float azul = 34;
  return color(rojo,verde,azul);
}


