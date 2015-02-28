
/*
PROYECTO 06 SESION 6 :
 
 Título: El sueño del cerebro
 Nombre: Lluc Llobell
 Fecha:  20-06-2010
 Lugar: Girona
 Objetivo: Video para la cancion dreams

  */
//
//utilizar libreria minim 
import ddf.minim.*;
Minim minim;
AudioInput in;

void setup() {
  size(1024, 768);
  colorMode (RGB, 255,255,255);
  smooth();
  background (0,0,0,0);
  
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 500);


}
// recuerda quitar save frame para guardar
void draw() {
 //saveFrame();
  noStroke();
  strokeWeight(1);
  noFill();

  for (int i = 0; i < in.bufferSize() - 1; i++){
    
    float c = (5+in.left.get(i+1)*255);
    float r = (5+in.right.get(50)*255);
    float l = (5+in.left.get(i+1)*500);
   
    //control de colores i posicion
    pushMatrix();
    
    translate(0, 250);
    fill(0,c,c);
    ellipse(i*5, l, r, r);


    translate(0, 300);
    fill(0,c,c);
    ellipse(i*5, l*-1, r, r);
    
    popMatrix();
    
  }
}

void stop()
{
  minim.stop();
  super.stop();
} 



