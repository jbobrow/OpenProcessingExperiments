
size(600, 600);
smooth();
background(0);


    for (int z = 3; z<=18; z=z+1) {
      for (int x = 4; x<=width; x=x+20) {
        for (int y = 4; y<=width; y=y+20) {
          stroke(255);
          point (x, 2+y*4);
        }
      }
      rotate(z);
    }



