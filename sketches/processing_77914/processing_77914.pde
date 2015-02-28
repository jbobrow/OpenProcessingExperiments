
void setup(){
  size(800,400);
  PImage miImagen;
  miImagen=loadImage("Lenna.jpg");
  image(miImagen,0,0);
  loadPixels();    //Carga en un arreglo los pixele
}
void draw()
{
  for(int i=0;i<400;i++){
    for(int j=0;j<400;j++)
      pixels[i*800-j+799]=pixels[i*800+j];
  }
  updatePixels();
}

