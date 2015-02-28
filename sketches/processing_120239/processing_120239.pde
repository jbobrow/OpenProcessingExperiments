
void setup ()
{
  size (500, 500);
  background (0);
}
 
void draw ()
{
  translate (width/2, height/2);
  
    
  // Sekunden
  float sec = map(second(), 0, 60, 0, 360);
  println(sec);
   
  pushMatrix ();
  rotate(radians(sec));
  translate(0, -220);
  stroke (150, 5, 18);
  fill (100);
  ellipse (0, 0, 30, 30);
  popMatrix ();
   
  // Minuten
  float min = map(minute(), 0, 60, 0, 360);
  println(min);
   
  pushMatrix ();
  rotate(radians(min));
  translate(0, -170);
  ellipse(0, 0, 40, 40);
  popMatrix ();
   
  // Stunden
  float h = map(hour(), 0, 12, 0, 360);
  println(h);
  pushMatrix ();
  rotate(radians(h));
  translate (0, -120);
  ellipse(0, 0, 50, 50);
  popMatrix ();
}
