
void setup(){
  size(800,512);
  PImage miImagen;
  miImagen=loadImage("espejo.jpg");
  image(miImagen,0,0);
  loadPixels();    
}
void draw()
{
  for(int i=0;i<512;i++){
    for(int j=0;j<512;j++)
      pixels[i*800-j+799]=pixels[i*800+j];
  }
  updatePixels();
}

