
PImage laimagen,fondo;

void setup()
{
  size(1000,600);
  fondo=loadImage("fondo1.jpg");
  background(fondo);
 
  
  laimagen=loadImage("puma3.jpg");
  image(laimagen,40,50);
    
  loadPixels();
   //frameRate(1);
   
   
}
void draw()
{

  for(int a=0;a<600;a++)
  {
    for(int b=0;b<600;b++)
    {
      pixels[a*1000-b+998]=pixels[a*1000+b];
    }
  }
  updatePixels();
}


