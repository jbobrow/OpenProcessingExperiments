
size (510, 510);
background (255);
rectMode(CENTER);

for(int x=5; x<=width; x=x+50 ){
for (int y=5; y<=height; y=y+50) {
  noStroke();
  fill(0, 0, 0);
  rect(x, y, 10, 10);
}
}

