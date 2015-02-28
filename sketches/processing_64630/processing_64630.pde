
size(200, 200);

background(195);

for (int i=0; i<127; i++) {
  int randomX = floor(random(width));
  int randomY = floor(random(height));
  point(randomX, randomY);
}

