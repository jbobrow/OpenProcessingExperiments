
// pattern : custom01 // bezier

size (500, 500);
background (233, 224, 82);
strokeWeight (2);
stroke (0);
noFill ();
smooth ();

for (float i=10; i<=width; i+=50) {
  for (float j=5; j<=height; j+=50)
bezier (i+50, j+50, i/10, j/20, i/3, j/10, i/2, j*10);

}


