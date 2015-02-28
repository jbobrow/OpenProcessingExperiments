
PImage img;


void setup() {

  img = loadImage("amedeo.jpg");
  size(img.width, img.height); //tamaño de la ventana según el archivo
}




void draw() {
  noCursor();
  background(255);
  //image(img, 0, 0); //pintar la imagen en la ventana
  for (int a = 0; a<width;a+=2) {
    for (int b = 0; b<height;b+=2) {

      color elColor = img.get(a, b);
      float brillo = brightness(elColor);
      fill(elColor);
      float tam = brillo*0.001*mouseX;
      rect(a, b, tam, tam);
    }
  }
}
