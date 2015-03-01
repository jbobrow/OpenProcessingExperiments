
void setup()
{
 size (400, 400);
}
void draw()
{
  pushMatrix();
colorMode(RGB, 225);
background(110);
popMatrix();
translate (width/2, height/2);
colorMode(HSB, 360, 100, 100);
float farbe=map(second(), 0, 60, 281, 258);
fill ( farbe, 60, 100);
stroke (0);
strokeWeight(1);
ellipse(0, 0, 400, 400);

  
float sekunde1= map(second(), 0, 60, 0, 2*PI);
pushMatrix();
rotate (sekunde1);
rectMode (CENTER);
 

colorMode (RGB, 225);
fill (110, 200);
smooth();
ellipse (0, -170, 30, 30);
popMatrix();
 
float minute1 =map(minute(), 0, 60, 0, 2*PI);
pushMatrix();
rotate (minute1);
rectMode (CENTER);
colorMode (RGB, 225);
fill (110, 200);
smooth();
ellipse (0, -120, 40, 40);
popMatrix();
 
float hour1 =map (hour(), 0, 12, 0, 2*PI);
pushMatrix();
rotate (hour1);
rectMode (CENTER);
colorMode (RGB, 225);
fill (110, 200);
smooth();
ellipse (0, -60, 60, 60);
popMatrix ();
}
