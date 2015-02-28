
int venstreFodX = 30;
int venstreFodY= 340;
int hofteX = 45;
int hofteY = 310;
int hojreFodX = 60;
int hojreFodY = 340;
int halsX = hofteX;
int halsY = 280;
int hovedCentrumX = hofteX;
int hovedCentrumY = halsY-10;
int armKropX = hofteX;
int armKropY = halsY+10;
int venstreArmX = hofteX-10;
int venstreArmY = armKropY+10;
int hojreArmX = hofteX+10;
int hojreArmY = venstreArmY;
float rad = radians(10);
float radStop = radians(300);


void setup()
{
  size(500,500);
  frameRate(10);
}
 
void draw()
{
  background(255);
  noFill();
   
  hofteX = hofteX+15;
  halsX = halsX+15;
  armKropX = armKropX+15;
  hojreArmX = hojreArmX+15;
  venstreArmX = venstreArmX+15;
  hovedCentrumX = hovedCentrumX+15;
   
   
  if(venstreFodX != hojreFodX)
  {
    venstreFodX = venstreFodX+30;
  }
  else
  {
    hojreFodX = hojreFodX+30;
  }
   
 line(armKropX,armKropY,hojreArmX,hojreArmY);
 line(venstreFodX,venstreFodY,hofteX,hofteY);
 line(hojreFodX,hojreFodY,hofteX,hofteY);
 line(hofteX,hofteY,halsX,halsY);
 line(armKropX,armKropY,venstreArmX,venstreArmY);
 ellipse(hovedCentrumX,hovedCentrumY,20,20);
   
}



