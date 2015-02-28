
size(500, 500);
smooth();
background(0);
noFill();
stroke(255);


fill(#AD4AF5,50);
for ( int x = 0; x <=width; x+=110) {
  for (int y = 0; y <= height; y+=80) {
    rect(x, y, 100, 50);
  }
}

fill(#00CCF2,50);
for (int x = -30; x <= width; x+=110) {
  for (int y = -8; y <= height; y+=80) {
       
    rect(x, y, 100, 50);
    
  }
}

fill(#FF571A,50);
for (int x = 0; x <= width; x+=80) {
  for (int y = 0; y <= height; y+=110) {
    rect(x, y, 50, 100);
  }
}

fill(#E7F000,50);
for (int x = 0; x <= width; x+=110) {
  for (int y = 0; y <= height; y+=80) {

    rect(x, y, 200, 100);
     
  }
}



