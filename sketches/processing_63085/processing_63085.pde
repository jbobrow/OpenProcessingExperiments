

size(500, 500 );
background(0);
smooth();
noStroke();
for ( int y = 0; y <= height; y +=40) {
   
  for (int x = 0 ; x <= width; x += 40){
    fill (255, 140);
    ellipse(x, y, 40-y/20.0, 40);
    
  }
}
  
  for( int y = 0; y<= height; y += 8 ) {
    for (int x =0; x <= width; x += 15) {
     ellipse( x, y, 16 - y/20.0, 16 - y / 20.0);
     fill(255,62,62);
    }
  } 





