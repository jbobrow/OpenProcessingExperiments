


int i = 142;
size(500,500);
background(255);
smooth();
 
  stroke(128,16,203);
  fill(206,10,0);
  for( int y = 0; y <= height; y = y + i ){
      for( int x = 0; x <= width; x = x + i ){
        rect(x,y,42,42,40,40);
      }
  }

