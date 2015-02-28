
void setup ()
{
  size (400, 600) ;
  background (181,207,211) ;
  smooth () ;
  textAlign (CENTER) ;
}

void draw ()
{
  strokeWeight (1);
  line (0, 475, 539,475) ;

  ellipse (158, 391, 200, 200) ;
  ellipse (156.5, 229.49, 150, 150) ;
  ellipse (162, 106, 100,100) ;
  line (223,237,371,206) ;
  line (-32.8311, 218.06, 92.83, 197.93) ;
  line (51,205,14,178) ;
  line (289,223,312,196);
  line (321, 215, 345,238);
  fill (237, 122,7) ;
  triangle (139, 145, 149, 107, 173, 114) ;
  fill (255,255,255) ;
  ellipse (169, 136,8, 6) ;
  ellipse (140.5, 85, 27,30) ;
  ellipse (179, 86, 28, 28) ;
 
  fill (random (255) ,0,0);
  
  ellipse (152,207, 10,10) ;
  ellipse (151,226, 10, 10) ;
  ellipse (151, 248, 10, 10) ;
  
  strokeWeight (10);
   point (136, 89);
  point (172, 87) ;
  
  strokeWeight (3);
   fill (255,255,255);
  point (random (400), random (600)); 
 
  
}

