
size (200,200);
background(0);
color x;
for (int i=1; i<=210; i+=10){
  for(int j = 1; j<=210; j += 10) {
    x = color (2*i, 1*i, 3*i);
    noStroke();
    fill (x);
     ellipse (i,j,10,10);
  }
}

