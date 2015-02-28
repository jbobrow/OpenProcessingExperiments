
// pattern : custom02 // Vertex

size (500, 500);
background (0);
smooth ();
noStroke ();


for (int i=0; i<=width; i+=20) {
  for (int j=0; j<= height; j+=20) {
    fill (i+j, i/2, j/2, 90);
    beginShape ();
    vertex (i, j);
    vertex (i+10, j+20);
    vertex (i-30, j+50);
    vertex (i-50, j-10);
    vertex (i, j);
    endShape ();
  }
}



