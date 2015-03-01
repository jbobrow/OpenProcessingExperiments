
float nummer=0;
void setup ()
{
  size (500, 500);
 // background (255);
}
void draw ()
{
  colorMode (HSB, 360, 100, 100);
  
  background (0, 1, 95);
  
  float farbe = map (sin (nummer),-1, 1, 0, 87);
  float nummer_mouse=map(mouseX, 0, width, 0.01, 0.3);
  translate (width/2, height/2);
  fill (360,farbe, 87);
  noStroke();
  smooth();
  ellipse (-80, -50, 200, 200);
  ellipse (80, -50, 200, 200);
  triangle (-160, 10, 160, 10, 0,150);
 
  println (sin(nummer));
  nummer+=nummer_mouse;//Zeit
}
