
import processing.pdf.*;
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(169,245,0);
  frameRate(30); 
  size(700,700);
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
  stroke(152,219,170);
  strokeWeight(2);
  line(random(width),random(height),map(mouseX,0,width,0,500),map(mouseX,0,width,0,500));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/12;
    translate(mouseX,mouseY);
    popMatrix();
  }
}
void dibujarPelotas() {
  stroke(255,255,255);
  strokeWeight(1);
  float tam = map(mouseY,0,height,0,tamanio);
  line(random(width),random(height),map(mouseX,0,width,0,500),map(mouseX,0,width,0,500));
}



