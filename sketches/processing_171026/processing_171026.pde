
void setup()
{
  size (300,550);
  background (255);
  fill (#FCEAB8);
  rect (0,0,300,470);
  fill (#7E5E17);
  rect (0,460,300,250);
  fill (#A54500);
  quad (80,60,220,60,190,40,110,40);
  fill (#717171);
  ellipse (148,490,180,90);
 
 
 
}
void draw ()
{
  stroke (0);
  strokeWeight (2);
  translate (150,140);
  rectMode (CENTER);
  
  fill (#A55102);
  rect (0,140,140,440);
  fill (#894200);
  rect (0,0,100,100);
  fill (#1C0E00);
  rect (0,200,100,220);
  fill (#F7BD48);
  ellipse (0,0,100,100);
  line (0,-50,0,-45);
  line (0,50,0,45);
  line (50,0,45,0);
  line (-50,0,-45,0);
  
  float sekunde = map (second (),0,60,0,2*PI);
  float minute2 = map (minute (),0,60,0,2*PI);
  float stunde = map (hour (),0,24,0,2*PI);
  float sekunde2 = map (second (),0,60,-PI/18,PI/18);
  float sekunde3 = map (second (),60,0,-PI/18,PI/18);

  
  pushMatrix ();
  rotate (sekunde);
  line (0,0,0,-40);
  popMatrix();
  
  pushMatrix ();
  rotate (minute2);
  line (0,0,0,-30);
  popMatrix();
  
  pushMatrix ();
  rotate (stunde);
  line (0,0,0,-20);
  popMatrix();
  
  pushMatrix ();
  smooth ();
  rotate (sekunde2);
  line (0,92,0,250);
  ellipse (0,260,50,50);
  fill (#EACD6D);
  ellipse (0,260,30,30);
  popMatrix();
  
  pushMatrix ();
  smooth ();
  rotate (sekunde3);
  line (0,92,0,250);
  fill (#F7BD48);
  ellipse (0,260,50,50);
  fill (#EACD6D);
  ellipse (0,260,30,30);
  popMatrix(); 
  
  noStroke ();
  fill (#A55102);
  rect (61,250,20,70);
  rect (-61,250,20,70);
  fill (0);
  rect (-70,250,2,80); 
  rect (70,250,2,80);
  rect (50,250,2,80);
  rect (-50,250,2,80);
}
