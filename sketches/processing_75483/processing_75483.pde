
//Made by Jared "BlueThen" C.
//Created on November 4, 2009. Refined and commented on November 5, 2009.
//www.bluethen.com


float a;

void setup()
{
 
  size(1000,1000);
 
  colorMode(RGB, 6);
  
  stroke(0);

  frameRate(100);
}
void draw()
{
  
  a -= 0.03;

  background(6);
 
  for (int x = -50 ; x < 50; x++) {
   for (int z = -50; z < 50; z++) {
 
    int y = int(80 * sin(0.05 * distance(x,z,0,0) + a));
           
    float xm = x*4 -2;
    float xt = x*4 +2;
    float zm = z*4 -2;
    float zt = z*4 +2;
      
   
    int halfw = (int)width/2;
    int halfh = (int)height/2;

    int isox1 = int(xm - zm + halfw);
    int isoy1 = int((xm + zm) * 0.5 + halfh);
    int isox2 = int(xm - zt + halfw);
    int isoy2 = int((xm + zt) * 0.5 + halfh);
    int isox3 = int(xt - zt + halfw);
    int isoy3 = int((xt + zt) * 0.5 + halfh);
    int isox4 = int(xt - zm + halfw);
    int isoy4 = int((xt + zm) * 0.5 + halfh);
      
  /*
 
 
 
      
    
    */
    fill(6+y * 0.05);
    quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
   }
  }
}

float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}
