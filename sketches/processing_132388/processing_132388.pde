

  size(400,700);
  background(255); 



  for (int x = 25; x < 375; x = x+25) {
    for (int y = 25; y < 100; y = y+25) {
     rect(x, y, 25, 25);
       }
    }
    for (int z = 100; z < 650; z = z+25) {
     rect(random(z), random(z), 25, 25);
     rotate(radians(random(50,310)));
   }


