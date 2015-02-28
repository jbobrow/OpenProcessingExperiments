
import processing.pdf.*;

int tamanio ;
void setup() 
{
  background(0);
  frameRate(30); // Run slow...
  size(800 ,500);
  smooth();
  tamanio = width/20;
}

void draw(){
    
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
void dibujarLinea(){
   stroke(255);
   line(mouseX,mouseY,mouseX-random(20),mouseY-random(20));

  }
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  //agregue un rect
  rect(mouseX,mouseY, tam,tam);
  //ellipse
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY, tam,tam);

}
color devuelveColor(){
  float rojo = 5;
  float verde = random(0,100);
  float azul =100;
  return color(rojo,verde,azul);
  }

