
import processing.pdf.*;


float longitud=50;
int tamanio ;
void setup() 
{
  background(#868585);
  frameRate(20); // Run slow...
  size(800 ,500);
  smooth();
  tamanio = width/50;
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
  dibujarRectangulo();
  dibujarTriangulo();
}
void dibujarLinea(){
   stroke(255);
   line(mouseX,mouseY,mouseX-random(1),mouseY-random(1));

  }
 
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  ellipse(mouseX,mouseY, tam,tam);

}
void dibujarRectangulo(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  rect(mouseX,mouseY, tam,tam);

}
void dibujarTriangulo(){
  noStroke();
  fill(devuelveColor());
 longitud = random(100);
  triangle(mouseX,mouseY,mouseX, mouseY-longitud,mouseX-longitud,mouseY-longitud);

}
color devuelveColor(){
  float rojo = random(100,255);
  float verde = 100;
  float azul = 100;
  return color(rojo,verde,azul);
  }

