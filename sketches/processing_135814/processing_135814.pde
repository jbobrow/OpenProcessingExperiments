

size (700,700);
background (70);

for ( int x = 20; x < 700; x += 20) {
  stroke (255 - x);
  line (x, 0, x, 700);
}

noStroke();
fill (250,20);
for ( int y = 15; y < 700; y += 100) {
  for( int i = 15; i < 700; i +=100){
      ellipse (i, y, i+15, y-15);
  }
}
   fill (50,100,150, 10);
  for ( int y = 15; y < 700; y += 70) {
  for( int i = 15; i < 700; i +=70){
      ellipse (y, i, i-15, y+15);
  } 
    }



