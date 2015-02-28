

background(255);
size(600, 600);

translate(width/2, height/2);

for ( int i= 0; i < width; i += 40) {
  for ( int j = 10; j < height; j += 40) {     
    noStroke();  
    fill(40, 66, 131, 5);     
    rect( -i/3, j/4, i, i );     
    rotate(PI/3);
  }
}


