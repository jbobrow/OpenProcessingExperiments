
PImage foto;

size (400,800);

foto=loadImage("Lenna.jpg");

image (foto,0,0);

loadPixels();

int mitad= width*height;

for ( int i=200; i<mitad; i++){
  pixels[mitad-i]= pixels [i];
}

updatePixels();

