
size (480, 120) ;
background (0,15,98) ;
smooth () ;
strokeWeight (2); 
for (int y = 32; y <=height; y+=8) {
    for (int x = 12; x <=width; x+= 15) {
        ellipse(x + y, y, 16 - y/10.0, 16 - y/10.0);
  }
  } 
