
void setup()
{
  size(600,300);
  PImage  miImagen;
  miImagen= loadImage("imagen.jpg");
  
  image(miImagen,0,0);
}
void draw()
{

loadPixels();

for(int i=0;i<300;i++)
  {
   for(int j=0;j<300;j++)
     {
       pixels[i*600+j+300]=pixels[i*600+(299-j)];
     }  
  }
   
updatePixels();  //actualiza los pixeles de la pantalla 
                 //con el arreglo pixels
}

