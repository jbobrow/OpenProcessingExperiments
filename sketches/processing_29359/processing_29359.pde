
PImage in;

void setup() {
  //SE AHABR P3D

  size (400,200,P3D);
  in = loadImage("gaudi.jpg");
  in.resize(in.width,in.height);
}

void draw() {
  background(0);
  //simpre hau que ponene loadpixel para entrar a la imagen
  in.loadPixels(); 
  // para dibijar de 10 en 10 
  for(int i=0; i<in.width; i+=10) {
    for(int j=0; j<in.height; j+=10) {
      int pColor =in.get(i,j);
      // para pixelear la imagen fill (pColor);
      // jugar con el map
      float f = map (dist(mouseX, mouseY, i, j), 0, width, 0, 30); 
      float p = map (brightness(pColor), 0, 255, 0, f); 

      fill(pColor);
      noStroke();
      //punto 0,0 en el centro del caudrado
      rectMode(CENTER);
      // se dibuna cubos
      pushMatrix();
      translate(i,j);
      box (p);
      popMatrix();
    }
  }
}


