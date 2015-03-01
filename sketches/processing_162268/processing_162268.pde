
size (300, 300);
background (random (0, 50));
stroke (random (0,250));
for (int i = 0; i < 3000; i++){
  float r = random (3);
  float offset = random (0, 300);
  fill(r);
  strokeWeight (r);
  rect(i, offset, i *5, offset *5);
}



