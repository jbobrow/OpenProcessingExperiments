
size(300, 300);
colorMode (RGB, height+width/20);

 
for (int y = 2; y< height; y ++) {
  for (int x = 3; x < width; x++) {
    stroke (x, 50, y+x);
    ellipse (x, y, x+10, y+10);
    
  }
}
 
for (int x = 0; x<width; x+=50) {
  for (int y = 0; y< height; y+=50) {
    for (int z = 5; z <= 15; z +=17) {
     stroke(255);
     line (x, y+5, z*x, z*y);
     rotate(-TWO_PI/8);

 
    }
  }
}




