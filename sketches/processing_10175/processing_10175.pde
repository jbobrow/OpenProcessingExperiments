
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(100,0,20);
  frameRate(20); 
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
  fill(random(4),21);
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/12;
    stroke(0,50,3);
    strokeWeight(0.5);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,400,300);
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
  float rojo = 88;
  float verde = random(21,255);
  float azul =14;
  return color(rojo,verde,azul);
}


