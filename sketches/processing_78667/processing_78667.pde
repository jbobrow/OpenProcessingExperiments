
PImage foto;

size (400,800);
foto=loadImage("Lenna.jpeg");
image(foto,0,0);

int mediaDimension=width*height/2;
loadPixels();

int j=mediaDimension;

for(int i=mediaDimension; i>0; i--){
  pixels[j++]=pixels[i];
  
} 

updatePixels();

