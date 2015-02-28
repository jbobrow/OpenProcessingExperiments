
size (200,200);
background(0);
for (int i = 10; i < 300; i = i+15) {
  for (int j = 10; j < 300; j = j+15) {
    stroke(200,i,j);
    strokeWeight(5);
    point(i, j);
  }
}
