
for (int y = 10; y <= 85; y += 10)
{
for (int x = 10; x <= 85; x += 10)
  {
  if (x <= 50) {
    line(x-10, y-10, x-3, y-3);
    } else {
    fill(90,30,50,50);
    ellipse(x, y, x-30, y-30);
  }

  }
}


