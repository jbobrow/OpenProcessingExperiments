
size (200,200);
background (255);
strokeWeight (5);
smooth();

for (float x =  random(0,30); x < 190; x = x+ random(10,40)) {
  for (float y = random(5,50); y < 190; y = y+random(10,20)) {
       point(x, y);
  }
}

