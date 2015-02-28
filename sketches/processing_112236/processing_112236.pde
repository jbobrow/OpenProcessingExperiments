
size(500, 500);
background(255);
colorMode(HSB, 500);



for (int i = 0; i < width; i = i+5) {
  for (int j = 0; j < height; j = j+5) {
        fill( int(235), int(37), int(i/2));
    stroke(i, j, 500);
    point(i, j);
    
    noFill();
    strokeWeight(2);
    stroke(i, j, 500 );
    ellipse (250, 250, 300,300);
  }
}




