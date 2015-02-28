
import processing.pdf.*;




int tamanio ;
void setup() 
{
// Primero siempre va size antes de la imagen de fondo.
  size(800 ,500);
  PImage b;
b = loadImage("ojaide.jpg");
background(b);
  frameRate(25); // Run slow...
//el framerate es la velocidad con que se movera la interaccion.  
  smooth();
  tamanio = width/2;
}

void draw(){
    


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
  dibujarRectangulos();
}  

// para dibujar los rectangulos.
void dibujarRectangulos(){
 noStroke();
// para que el rectangulo vaya canviando de color.
 fill(mouseX + 200 , mouseX, mouseY - (height/3),height/10);
 rectMode(CENTER);
 rect(mouseX,mouseY,5,70);

}
color devuelveColor(){
  float rojo = 255;
  float verde = random(100,255);
  float azul = 0;
  return color(rojo,verde,azul);
  }

