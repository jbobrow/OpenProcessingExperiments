
size(500, 500);

smooth();

background(255);

strokeWeight(3);


for (float y = 50; y <= height-50; y= y+random(2,30)) {
  for (float x = 50; x <= width-50; x = x +random(2,30)) {
    float r = random(1,5);
    strokeWeight(r);
    point(x, y);
  }
}


