
void setup ()
{
  size (500, 500);
}

void draw ()
{
  background (255);
  translate (width/2, height/2);
  
  for(int s=0; s<360; s+=6)
  {
  pushMatrix ();
  rotate(radians(3));
  rotate(radians(s));
  translate(120, 120);
  line(0, 0, 50, 50);
  popMatrix ();
  }
  
  // Sekunden
  float sec = map(second(), 0, 60, 0, 360);
  println(sec);
  
  pushMatrix ();
  rotate(radians(184.8));
  rotate(radians(sec));
  line (0, 0, 20, 240);
  popMatrix ();
  
  
  // Minuten
  float min = map(minute(), 0, 60, 0, 360);
  println(min);
  
  pushMatrix ();
  rotate(radians(180.3));
  rotate(radians(min));
  fill (0);
  rect (0, 0, 3, 220);
  popMatrix();
  
  
  // Stunden
  float h = map(hour(), 0, 12, 0, 360);
  println(h);
  
  pushMatrix ();
  rotate(radians(180.5));
  rotate(radians(h));
  fill (30, 140, 20);
  rect(0, 0, 4, 200);
  popMatrix ();
}
