
int mysize = 100;
float A = 350;
float B = 200;
float R = 0;

void setup ()
{
  size (700,400);
  background (0);
  colorMode (HSB);

  //shininess (5.0);
  
}
//looks nicer, not directly influencing the ellipse, chasing the mouse rather than me controlling it. 
void draw ()
{
 
   stroke (0);
   strokeWeight (1);
  // ellipse (A, B, mysize, 100);
   stroke (R, 255, 255, 20);
   strokeWeight (10);
   line (mouseX, mouseY , A, B);
  
  A = A + (mouseX - A)/25.0;
  B = B + (mouseY - B)/25.0;
  R = R + 0.1;
  
  
}
void mousePressed (){

  
}

void mouseMoved (){


}
