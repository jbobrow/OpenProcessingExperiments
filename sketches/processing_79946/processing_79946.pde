
PImage foto;
 
size (588,800);
foto=loadImage("rojo.jpg");
image(foto,0,0);
 
int mediaDimension=width*height/2;
loadPixels();
 
int j=mediaDimension;
 
for(int i=mediaDimension; i>0; i--){
  pixels[j++]=pixels[i];
   
}
 
updatePixels();
