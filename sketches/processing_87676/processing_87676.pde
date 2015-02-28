
background(137);
size(500, 500);
 
translate(width/3, height/34);
 
for ( int f= 0; f < width; f += 10) {
  for ( int e = 410; e < height; e += 340) {    

    stroke(4); 
    fill(40, 66, 131, 5);    
    rect( -f/10, e/113, f, f );    
    rotate(PI/23);
  }
}



