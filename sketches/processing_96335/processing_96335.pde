
size (200,200);
background(0);
for (int i = 15; i < 200; i = i+15) {
  for (int j = 11; j < 300; j = j+15) {
    stroke(200,i,j);
    strokeWeight(2);
    point(i, j);
  }
}
