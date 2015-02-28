
size (400,400);
fill (40,180,180);
rect (0,0,400,400);


stroke (0,0,0);
strokeWeight (1);
stroke (170,170,220);
fill (250,250,250,50);
for (int i=10; i <=100; i+=10) {
  for (int j=10; j<=100; j+=10) {
    triangle (2.5*i,2.5*j,j,i, 2/i,2/j);
  }
}

line (0,0,400,400);
noStroke ();
fill (255,255,255,10);
for (int i=10; i <=100; i+=5) {
  for (int j=10; j<=100; j+=5) {
    triangle (20*i,20*j,i,i,2/i,2/i);
  }
}

