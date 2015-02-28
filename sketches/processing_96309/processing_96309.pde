
size(200,200);
background (0);
  
for (int i = 1; i < 200; i = i+25) {
  for (int j =1; j < 200; j = j+25) {
    stroke(0);
    strokeWeight(1);
    rect(i,j,22,22);
      
 for ( int x = 2; x < 23; x = x+2) {
      stroke (j, j+255,i+j-120);
      strokeWeight (2);
      line (x+i, 1+j, x+i, 21+j);
    }
  }
}
