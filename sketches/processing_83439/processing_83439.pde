
size (500,500);
background(240);




//esfera
fill(0,0,255,20);
strokeWeight(0.5);
stroke(210);
for ( int c = -20; c < 600; c = c + 20) {
  for(int d = -20; d < 600; d = d + 20) {
    ellipse(c, d, 40, 40);
  }
  
}
