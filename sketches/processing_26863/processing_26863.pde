
/* lineas negras para todos los sentidos seguiendo el mouse
pressionar mouse - pelotas en tonos de azul
m - pelotas mas grandes
n - pelotar mas pequenas
s - start record
q - end record */

import processing.pdf.*;


float tamanio ; // relactivo al tamanio de las pelotas
float angulo;  // relactivo al angulo randomizado de las lineas
void setup() 
{

  frameRate(24); // Run slow...
  size(1024,720);
  smooth();
  tamanio = width/20;
 
 
/* PImage b;   // BG Vignette - no utilizado
b = loadImage("vignette.jpg");
background(b);  */

background(20);

}

void draw(){
    
 dibujarLinea();

}

// mandos

void keyPressed() {
  switch(key) {
  case 'm': 
    tamanio++;
    break;
  case 'n': 
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
   stroke(0);
   line(mouseX,mouseY,mouseX-random(1000),mouseY-random(1000));


  
pushMatrix();    // generar lineas para todos lados

angulo=random(0,TWO_PI);
translate (mouseX, mouseY);
rotate(angulo);
line(0,0,1000,0);

popMatrix();


  }
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  ellipse(mouseX,mouseY, 1.5*tam,1.5*tam);

}
color devuelveColor(){
  float rojo = 38;
  float verde = random(50,100);
  float azul = 180;
  return color(rojo,verde,azul);
  }

