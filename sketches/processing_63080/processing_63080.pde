
size(600,600);
background(255);
smooth();
noFill();

stroke(0,189,255,65);
strokeWeight(30);

for (int x = 0; x<=600; x = x+50) {
  for ( float y = 0 ; y<=600; y=y+50)
  point(x,y);
}
  stroke(0,255,50,45);

  for (float x = 7.5; x<=700; x = x+50) {
  for ( float y = 7.5 ; y<=700; y=y+50)
  point(x,y);
}

  stroke(205,255,8,45);

  for (float x = -7.5; x<=700; x = x+50) {
  for ( float y = -7.5 ; y<=700; y=y+50)
  point(x,y);
}

