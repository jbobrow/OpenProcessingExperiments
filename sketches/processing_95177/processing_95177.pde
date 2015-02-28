

fill(0,7.6);
smooth();
for (int y = -45; y <= 200; y += 15) {
  for (int x = -45; x <= 200; x += 15) {
    ellipse(x + y/3.0, y+ x/3.0, x + y*0.5, y+ x*0.5);
  }
}

