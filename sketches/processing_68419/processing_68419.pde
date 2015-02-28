
size (800, 400);
background (10);
smooth ();


translate (400, 200);

for ( int i = 0; i < 34; i++ ) {
  rotate (PI/12);
  colorMode (HSB);
  noStroke ();
  fill ( i, 210, 255, i);
  rect (0, 0, 200, 200);
  
  noStroke ();
  fill ( i, 230, 250, i);
  rect (200, 0, 200, 200);
  
  noStroke ();
  fill ( i, 210, 220, i);
  rect (-200, 0, 200, 200);
}




