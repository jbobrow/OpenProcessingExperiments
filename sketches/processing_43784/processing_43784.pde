
import processing.net.*;


PImage[]images=new PImage [5];
PImage img=new PImage();

int i;





void setup() {
  size (324, 432);
  for (int i=0; i<images.length;i++)
  {
    images[i] =loadImage (i+".jpg");
  }
  for (int i=0; i< images.length; i++)
    background(images[0]);
}

void draw()
{
  if (mousePressed==true){
    
    for (int i = 0;i>0;i ++)
    i=1;
     image(images[i], 0, 0);
     
  //}  else{
   // if (mousePressed== false)
   // for (int count=0; count>5;count--)


      
    image(images[2], 0, 0);
     i=int (i+1);
    
     
  }
}

 // for (int count = 0;count<1;count ++)
  //  i=1;
   //  image(images[], 0, 0);


