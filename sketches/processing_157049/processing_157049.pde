

color hintergrundfarbe = color (235);
color linienfarbe = color (136, 159, 173);


void setup()
{
  size (900, 900);
  smooth();
}

void draw ()

{
  background (hintergrundfarbe);
  
  noFill();
  stroke (linienfarbe);
  
  //Rechteck
  
  line (100,100,800,100);
  
  line (100,100,100,800);
  
  line (100,800,800,800);
  
  line (800,100,800,800);
  
  line (173,460,728,460);
  
  //Bild
  
  ellipse (277, 460,35,35);
  
  ellipse (312,460,35,35);
  
  ellipse (327,460,66,66);
  
  ellipse (262,460,66,66);
  
  ellipse (262,460,132,132);
  
  ellipse (544,460,132,132);
  
  ellipse (544,460,66,66);
  
  ellipse (611,460,66,66);
  
  
}
