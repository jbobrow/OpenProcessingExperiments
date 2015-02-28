
background(255);
size(500, 500);
 
translate(width/2, height/2);
 
for ( int x= 0; x < width; x += 100) {
  for ( int y = 5; y < height; y += 80) {    
    noStroke(); 
    fill(255, 193, 111, 50);    
    rect( -x/4, y/4, x, x );    
    rotate(PI/2);
  }
}


