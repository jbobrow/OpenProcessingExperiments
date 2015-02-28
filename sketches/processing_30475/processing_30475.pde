
size (800, 600);
background (0);
smooth ();

for ( int i = 0; i < 1000; i = i + 1){
      strokeWeight(2); 
      stroke( 255);
      point( random(width),random(height)); 
}

for (int i=0; i<80; i=i+1) {
fill (2,4,26);
noStroke ();
ellipse (random (width), random (height), 2, 120);
}

for (int i=0; i<90; i=i+1) {
fill (62,79,255);
noStroke ();
ellipse (random (width), random (height), 10, 40);
}

for (int i=0; i<80; i=i+1) {
fill (0,7,80);
noStroke ();
ellipse (random (width), random (height), 5, 80);
}

for (int i=0; i<80; i=i+1) {
fill (139,149,255);
noStroke ();
ellipse (random (width), random (height), 5, 100);
}

for (int i=0; i<80; i=i+1) {
fill (0,7,80);
noStroke ();
ellipse (random (width), random (height), 5, 80);
}

for (int i=0; i<80; i=i+1)
{
strokeWeight(10); 
stroke(0,255,0); 
}


saveFrame("2.png");
