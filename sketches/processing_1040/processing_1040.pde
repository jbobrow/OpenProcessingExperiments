
void setup (){
size (760,573);

}
 
float x = 40;
float y = 50;
float z = 15;
float w = 25;


void draw ()
{
  background (170,168,158,100);
  PImage b;
b = loadImage ("pescadores.jpg");
 image (b,0,0);
 
 
  x = x + 10;
  if (x > 785){
    x = -15;
  }  

  y = y + 10;
  if ( y > 785){
    y = -15;   
  }

  w = w + 10;
  if ( w > 770){
    w = -30;   
  }

  z = z + 10;
  if ( z >760){
    z = -40;  
  }


  //* PESCADO
  fill (154,138,93,100);
  noStroke ();
   //*ellipse (40,500,30,20);
  ellipse (x,500,30,20);
  //*triangle (15,510,25,500,15,480);
  triangle (z,510,w,500,z,480);
  fill (0);
  //*ellipse (40,498,3,3);
  ellipse (y,498,3,3);

}








