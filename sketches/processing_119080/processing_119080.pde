
void setup ()
{
  size (500, 500);
  background (255); 
}
  
  void draw ()
  {
noStroke ();
fill (255);
rect (0, 0, 100, 100);

noStroke ();
fill (100);
rect (100, 0, 100, 100);


noStroke ();
fill (255);
rect (200, 0, 100, 100);

noStroke ();
fill (100);
rect (300, 0, 100, 100);

noStroke ();
fill (255);
rect (400, 0, 100, 100);

noStroke ();
fill (100);
rect (0, 100, 100, 100);

noStroke ();
fill (255);
rect (100, 100, 100, 100);

noStroke ();
fill (100);
rect (200, 100, 100, 100);

noStroke ();
fill (255);
rect (300, 100, 100, 100);

noStroke ();
fill (100);
rect (400, 100, 100, 100);

noStroke ();
fill (255);
rect (0, 200, 100, 100);

noStroke ();
fill (100);
rect (100, 200, 100, 100);

noStroke ();
fill (100);
rect (300, 200, 100, 100);

noStroke ();
fill (255);
rect (400, 200, 100, 100);

noStroke ();
fill (100);
rect (0, 300, 100, 100);

noStroke ();
fill (255);
rect (100, 300, 100, 100);

noStroke ();
fill (100);
rect (200, 300, 100, 100);

noStroke ();
fill (255);
rect (300, 300, 100, 100);

noStroke ();
fill (100);
rect (400, 300, 100, 100);

noStroke ();
fill (255);
rect (0, 400, 100, 100);

noStroke ();
fill (100);
rect (100, 400, 100, 100);

noStroke ();
fill (255);
rect (200, 400, 100, 100);

noStroke ();
fill (100);
rect (300, 400, 100, 100);

noStroke ();
fill (255);
rect (400, 400, 100, 100);


pushMatrix ();
translate (200, 200);
float winkel =map(mouseX, 2, 400, 0, 2*PI);
rotate (winkel);
fill (12, 220, 37);
rect (0, 0, 100, 100);
popMatrix ();
resetMatrix ();

}
