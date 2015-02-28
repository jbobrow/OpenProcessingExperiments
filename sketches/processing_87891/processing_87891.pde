

void setup()
{
  size(400, 400);
}

void draw() {
  for (int i = 1; i < 400; i += i)
  {
    for (int j = 1; j < 400; j += j) {
      line (i , j , 200, 200);
      line (i , 400 - j , 200, 200);
      line (400 - i , 400 - j , 200, 200);
      line (400 - i , j , 200, 200);
      noFill();
      ellipse (200, 200, i, j);
      rect (0, 0, i, j);
      rect (400, 0, -i, j);
      rect (0, 400, i, -j);
      rect (400, 400, -i, -j);
    }
  }
}



