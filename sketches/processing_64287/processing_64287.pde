
size (400,400);
background (255);
strokeWeight (2);
smooth();

for(int x=0; x<400; x++) {
  for(int y=0; y<400; y++) {
  float r = random(50);
  stroke(r*5);
  point(x,y);
 }
}

