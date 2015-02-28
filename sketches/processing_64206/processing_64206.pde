
size(800, 800);
smooth();
strokeWeight(20);
background(50);
float r;
float g;
float b;
float s;

  
for (float y = random(0.1,height); y <= height - 30; y = y + 30) {
  for (float x = random(0.1,width); x <= width - 30; x = x + 30) {
        float z = x;
 
    if (random(y) > 2) {
      z = x - 2;
    }
 
    else {
      z = x + 2;
    }
 s = random(1,50);
 r = random(255);
 g = random(255);
 b = random(255);
  fill(r, g, b);

    ellipse(z, y, s, s);
    stroke(r,g,b);
   
  }

}


