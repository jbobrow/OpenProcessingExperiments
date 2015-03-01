
void setup ()
{
  size (300,300);
  background (255);

}
void draw ()
{
  translate (width/2, height/2);
  rectMode (CENTER);
  stroke (0);
  background (255);
  ellipse (0,0,200,200);
  line (0,100,0,95);
  line (0,-100,0,-95);
  line (-100,0,-95,0);
  line (100,0,95,0);
  strokeWeight (4);
  float sekunde = map (second (),0,60,0,2*PI);
  float schwein = map (minute (),0,60,0,2*PI);
  float stunde = map (hour (),0,24,0,2*PI);
  
  pushMatrix ();
  rotate (sekunde);
  line (0,0,0,-100);
  popMatrix();
  
  pushMatrix ();
  rotate (schwein);
  line (0,0,0,-90);
  popMatrix();
  
  pushMatrix ();
  rotate (stunde);
  line (0,0,0,-80);
  popMatrix();
}
