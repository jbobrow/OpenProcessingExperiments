
float a;
/* Setup(), the first function called when the applet is started */
void setup()
{
  /* The applet is set to 500 pixels by 500 pixels */
  size(500,500);
  /* RGB mode set to maximum of 6, since we'll be using 6 colors. 0 for black, 6 for white, and everything in between. */
  colorMode(RGB, 6);
  /* The stroke color is used to determine the border color of each quadrilateral. */
  stroke(0);
  /* Frame rate is set to 30. */
  frameRate(30);
}
void draw()
{

  a -= 0.08;
  /* Screen is cleared and background is set to 6 (white). */
  background(6);

  for (int x = -7; x < 7; x++) {
   for (int z = -7; z < 7; z++) {
  
    int y = int(24 * cos(0.55 * distance(x,z,0,0) + a));
     
 
    float xm = x*17 -8.5;
    float xt = x*17 +8.5;
    float zm = z*17 -8.5;
    float zt = z*17 +8.5;
   
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
     
   
    fill (2);
    quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
    fill (4);
    quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);
     
  
    fill(4 + y * 0.05);
    quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
   }
  }
}
float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}
