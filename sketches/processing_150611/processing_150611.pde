
import processing.opengl.*;
 
int rainNum = 100;
ArrayList rain = new ArrayList();
ArrayList splash = new ArrayList();
float current;
float reseed = random(0,.2);
 
void setup()
{
  size(600,600,P3D);
  colorMode(HSB,100);
  background(0);
 
  rain.add(new Rain());
  current = millis();
}
 
void draw()
{
  blur(50);
   
  if ((millis()-current)/1000>reseed&&rain.size()<150)
  {
    rain.add(new Rain());
    float reseed = random(0,.2);
    current = millis();
  }
   
  for (int i=0 ; i<rain.size() ; i++)
  {
    Rain rainT = (Rain) rain.get(i);
    rainT.calculate();
    rainT.draw();
    if (rainT.position.y>height)
    {
       
      for (int k = 0 ; k<random(5,10) ; k++)
      {
        splash.add(new Splash(rainT.position.x,height));
      }
       
      rain.remove(i);
      float rand = random(0,100);
      if (rand>10&&rain.size()<150)
      rain.add(new Rain());
    }
  }
   
  for (int i=0 ; i<splash.size() ; i++)
  {
    Splash spl = (Splash) splash.get(i);
    spl.calculate();
    spl.draw();
    if (spl.position.y>height)
    splash.remove(i);
  }
 
}
 
void blur(float trans)
{
  noStroke();
  fill(0,trans);
  rect(0,0,width,height);
}

