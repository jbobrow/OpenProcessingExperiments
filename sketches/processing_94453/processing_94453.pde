
size(200, 200);
background (255, 255, 255);
int z=255;

for (int i = 1; i < 200; i = i+25) {
  for (int j =1; j < 200; j = j+25) {
    stroke(0);
    strokeWeight(1);
    rect(i, j, 22, 22);

    for ( int x = 2; x < 22; x = x+2) {
      stroke (j+150, j+250,i+j);
      strokeWeight (1);
      line (x+i, 1+j, x+i, 21+j);
    }
  }
}
