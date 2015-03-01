
void setup ()
{
  size (350,350);
  background (0);

}
void draw ()
{
  translate (width/2, height/2);
  rectMode (CENTER);
  noFill ();
  strokeWeight (2);
  background (0);
  float sekunde = map (second (),0,59,0,2*PI);
  float schwein = map (minute (),0,59,0,2*PI);
  float stunde = map (hour (),0,23,0,2*PI);
 
  stroke (255,255,255,8);
  ellipse (0,0,60,60);
  ellipse (0,0,140,140);
  ellipse (0,0,240,240);

  stroke (255);
  
  
  pushMatrix();
  rotate (sekunde);
  ellipse (50,0,40,-40);
  popMatrix();
  
  pushMatrix ();
  rotate (-sekunde);
  line (0,0,0,-30);
  popMatrix();
  
  pushMatrix ();
  rotate (schwein);
  ellipse (95,0,50,-50);
  popMatrix();
  
  pushMatrix();
  rotate (-schwein);
  line (0,0,0,-25);
  popMatrix();
  
  pushMatrix();
  rotate (stunde);
  ellipse (150,0,60,-60);
  popMatrix();
  
  pushMatrix();
  rotate (-stunde);
  line (0,0,0,-20);
  popMatrix();
}
