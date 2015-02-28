
float space = 10;

size(500, 500);

smooth();

background(255);

strokeWeight(3);


for (float y = 50; y <= height-50; y= y+space) {
  for (float x = 50; x <= width-50; x = x +space) {
    if (random(100)>50) {
      point(x+space, y);
    }
    else  {
      point(x, y+space);
    }
  }
}


