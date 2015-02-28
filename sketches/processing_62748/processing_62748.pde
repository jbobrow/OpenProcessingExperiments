
int cantidadImagenes = 12; //total de imagenes
int indexImagenes =0; //variable con la primera imagen
PImage[] imagenes = new PImage[cantidadImagenes];
void setup() {
  size(150,150);
for (int i = 0; i < imagenes.length; i ++ ) {
  imagenes[i] = loadImage( i + ".jpg");
}}
void draw() {
  image(imagenes[indexImagenes],0,0);
}
void mousePressed() {
  indexImagenes = int(random(imagenes.length));
}


