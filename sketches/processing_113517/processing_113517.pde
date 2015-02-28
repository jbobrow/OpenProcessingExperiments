
size(800, 800);
background(255,230,0);
smooth();
noStroke();

for (int x=0; x<=800; x+=40) {
  for (int y=0; y<=800; y+=40) {
    fill(200+x*5,255,x*2);
    ellipse(x, y, 40, 40);
  }
}

for (int x=0; x<=800; x+=10) {
  for (int y=0; y<=800; y+=10) {
    fill(y*5,255,255,174);
    rect(x, y, 10,10 );
  }
}

for (int x=0; x<=800; x+=40) {
  for (int y=0; y<=800; y+=10) {
    fill(y*5,220,255,144);
    ellipse(10+x, 10+y, 10,10 );
  }
}



