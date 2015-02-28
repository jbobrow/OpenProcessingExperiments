

//IDEP2011
//Motion Graphics
//Processing
//Christelle Le Guillard

//Importar imagen en pdf

import processing.pdf.*;

//Cargar imagen de fondo

void setup(){
  frameRate(30); // Run slow
  size(500,400);
  PImage b;
  b=loadImage("Mouth.jpg");
  background (b);
  
  smooth();
   
 }
 
 //Dibujar triangulos desde el centro de la imagen
 
 void draw(){
   
 }

//Grabar accion segun teclas asignadas

  void keyPressed() {
  switch(key) {
  case 'q': 
   println("endRecord");
     endRecord();
    break;
    case 's': 
    println("BEGIN RECORD");
   beginRecord(PDF, "triangle.pdf"); 
    break;
  }
   
  noStroke();
   fill(mouseX + 900, mouseX, mouseY - (height/2), height/10);
   triangle(width/2,height/2,mouseX+10, mouseY+10, mouseX-10, mouseY+10);
   fill(0);
  
   
//Los triangulos apareceran segun se pulse el mouse

}
void mouseDragged() {
  println();
   
  noStroke();
   fill(mouseX + 900, mouseX, mouseY - (height/2), height/10);
   triangle(width/2,height/2,mouseX+10, mouseY+10, mouseX-10, mouseY+10);
   fill(0);
  
   
}

//esto es una funcion que no devuelve ningun valor
void hacerFade(){
  fill(0,30);
  rect(0,0,width,height);
}
   




  

