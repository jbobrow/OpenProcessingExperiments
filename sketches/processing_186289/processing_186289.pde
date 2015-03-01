
float farbe=0;
float amplitude=20;
float counter =0;
 
void setup()
{
  size(500,500);
  background(255);
}
 
void draw()
{
  colorMode(HSB, 360, 100, 100);
   farbe = map(sin (millis()/100), -1, 1, 0, 360);
  
  rect((millis()/10), -cos(millis())*amplitude*10,100,100);
  translate (0,250);
  rect((millis()/10), -cos(millis())*amplitude*10,100,100);
 fill (farbe,100, 100);
 noStroke();
}
