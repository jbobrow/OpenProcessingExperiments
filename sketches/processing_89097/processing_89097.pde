
PImage miImagen;


void setup(){ 
  noStroke();
  size(410,308);
   miImagen= loadImage("imagen.jpg"); 
  image(miImagen,0,0);
  loadPixels();
  frameRate(1000);
}
  void draw(){

    int x=int (random(miImagen.width));
    int y=int (random(miImagen.height));
    int azar=x+(y*miImagen.width);
    
//int azar=int(random(126279));
  float rojo=red(miImagen.pixels[azar]);
   float verde=green (miImagen.pixels[azar]);
    float azul=blue(miImagen.pixels[azar]);
      

  fill(255-rojo,255-verde,255-azul);
  rect(x,y,3,3);
  }
