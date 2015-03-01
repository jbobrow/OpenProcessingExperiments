
void setup()
{
 size (400, 400);
}
void draw()
{
  pushMatrix();
colorMode(RGB);
background(0, 255, 127);
popMatrix();
translate (width/2, height/2);
colorMode(HSB, 360, 100, 100);
float farbe=map(second(), 0, 60, 60, 100);
fill ( farbe, 60, 100);
ellipse(0, 0, 400, 400);

  
float sekunde1= map(second(), 0, 60, 0, 2*PI);
pushMatrix();
rotate (sekunde1);
rectMode (CENTER);
 

colorMode (RGB);
fill (0, 139, 69);
ellipse (0, -170, 30, 30);
println (degrees(sekunde1));
popMatrix();
 
float minute1 =map(minute(), 0, 60, 0, 2*PI);
pushMatrix();
rotate (minute1);
rectMode (CENTER);
stroke (0, 0, 255);
colorMode (RGB);
fill (39, 64, 139);
smooth ();
ellipse (0, -70, 50, 50);
println (degrees(minute1));
popMatrix();
 
float hour1 =map (hour(), 0, 12, 0, 2*PI);
pushMatrix();
rotate (hour1);
rectMode (CENTER);
stroke (0, 0, 255);
strokeWeight(1);
colorMode (RGB);
fill (0, 255, 127, 200);
smooth ();
ellipse (0, -80, 80, 80);
println (degrees (hour1));
popMatrix ();
}
