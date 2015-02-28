
size(500,500);
  noStroke();
  background(0,0,0);
  smooth();



  smooth();
  for(int i = 0; i < 400; i = i + 100)
  {
    for(int j = 0; j < 400; j = j + 100)
    {
      fill(255,0,0);
      for(int k = 80; k > 0; k = k - 16)
      {
      fill(255,0,0);
      ellipse((100 + i), (100 + j), k, k);
      fill(255,255,255);
      ellipse((100+ i), (100 + j), k-8, k-8);
      }
    }
  }
