
size (400, 400);
background (0);
colorMode (RGB, width);
rectMode (CENTER);


for (int x = 60; x < width; x+=70) {
  for (int y = 60; y < height; y+=70) {   
    for (int z = 60; z < width; z+=70) {

      noStroke();
      fill (width, x, y, random(0));    
      stroke (width/z, x, y);                
      rect (x, y, 60, 30);

      rotate(-TWO_PI/8);
      rect (x, y, z-x, z-x);
    }
  }
}


