
PImage img; //Nombre en Processing de la imagen

void setup () {
  size(480,120);
  img = loadImage("clouds.png"); //Como llamar a la imagen
}

void draw() {
  background(204);
  image(img,0,0);  // Que es lo que quiero hacer con la imagen
  image(img,0,mouseY * -1);
 
}

