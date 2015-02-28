

size(500, 320);
background(12,8,80);
smooth();
fill(17,154,157);
for (int y = 0; y <= height; y +=10) {
  for (int x = -500; x <= width; x += 15) {
    noStroke();
    fill(100,252,80,20);
    ellipse(x + y, y, 50 - y/10.0, 50 - y/10.0);
  }

}

fill(255,134,59);
rect(60,0,50,500);


