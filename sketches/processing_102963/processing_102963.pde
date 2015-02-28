
size( 500, 500);
for( float y = 20; y <= 400; y *= 1.2) {
  for( int x = 20; x <= 400; x += 5) 
    line(x, y, x, y - 2);
  }
