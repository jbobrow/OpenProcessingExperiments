
size(400, 400);

for (int i=0; i<400; i=i+1) {
  float x = random(200);

  if (x>100) {
    line(0, i, x, i);
  } else {
    line(width, i, width-x, i);
  }
}

