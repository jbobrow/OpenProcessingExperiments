
size (800,800); 
noStroke();
colorMode(HSB, 800);
for (int i = 0; i < 800; i++) {
  for (int j = 0; j < 800; j++) {
    stroke(i/2,j/2, 800);//topleft
    point(i/2, j/2);
    stroke(j, i/2, 800);//topright
    point(i,j/2);
    stroke(j,i/2, 800);
    point(i/2,j );
    stroke(i/2,j/2, 800);
    point(i,j );
  }
  noStroke ();
  fill (10,7);
    for (int xi = 20; xi < 800; xi= xi+30) { //toprow
    ellipse(xi, 20, 17, 17);
     for (int y = 20; y < 800; y= y+30) { //else
    ellipse(xi, y, 17, 17);
     }}
}
