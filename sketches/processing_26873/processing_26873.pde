
import processing.pdf.*;


float longitud=50;
int tamanio ;
void setup() 
{
  background(0);
  frameRate(30); // Run slow...
  size(1280 ,720);
  smooth();
  tamanio = width/20;
}

void draw(){
    
//dibujarLinea();

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
  triangle(mouseX,mouseY,mouseX,mouseY-longitud,mouseX-longitud,mouseY-longitud);

}
color devuelveColor(){
  float rojo = 0;
  float verde = 100;
  float azul = random (0,255);
  return color(rojo,verde,azul);
  }

