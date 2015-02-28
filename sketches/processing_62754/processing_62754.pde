
int cantidadImagenes = 10; //total de imagenes
int indexImagenes =0; //variable con la primera imagen
PImage[] imagenes = new PImage[cantidadImagenes]; 
void setup() {
  size(300,300);
for (int i = 0; i < imagenes.length; i ++ ) {
  imagenes[i] = loadImage( i + ".jpg"); 
}
frameRate(10);
}
void draw() {
  background(0);
  image(imagenes[indexImagenes],0,0);
  indexImagenes = (indexImagenes + 1) % imagenes.length;
}

