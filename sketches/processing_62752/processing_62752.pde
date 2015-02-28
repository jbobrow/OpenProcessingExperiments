
int cantidadImagenes = 21; 
int indexImagenes =0; 
PImage[] imagenes = new PImage[cantidadImagenes];
void setup() {
  size(1000,400);
for (int i = 0; i < imagenes.length; i ++ ) {
  imagenes[i] = loadImage( i + ".jpg");
}
frameRate(5);
}
void draw() {
  background(0);
  image(imagenes[indexImagenes],0,0);
  indexImagenes = (indexImagenes + 1) % imagenes.length;
}


