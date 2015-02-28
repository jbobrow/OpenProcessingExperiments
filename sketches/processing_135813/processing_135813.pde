

size (300,300);

for ( int x = 20; x < 300; x += 20) {
  stroke (255 - x);
  line (x, 0, x, 300);
}


for ( int y = 15; y < 300; y += 20) {
  for( int i = 15; i < 300; i +=10){
      line (i, y, i+3, y-3);
    }
}
    
  
for ( int y = 5; y < 300; y += 10) {
  for( int i = 5; i < 300; i +=5){
      line (i, y, i-3, y+3);
    }
  }


