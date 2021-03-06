
size(600, 600);
background(255, 255, 255);

for (int x = 0; x < 600; x++)
{
  ellipse(random(0, width), random(0, height),
      random(40, 50), random(40, 50));
}

for (int x = 0; x < 18000; x++)
{
  float size = random(2, 5);
  ellipse(random(0, width), random(0, height), size, size);
}


pushMatrix();

triangle(0, height, width, height, width/2, height/2);
triangle(0, 0, width, 0, width/2, height/2);

translate(-300, -300);
rotate(radians(25));
translate(300, 300);

for (int x = 0; x < height; x = x+10)
{
  line(x, 0, width/2, height/2);
}
popMatrix();

pushMatrix();
translate(900, 900);
rotate(radians(25));
translate(-900, -900);

for (int x = 0; x < height; x = x+10)
{
  line(x, height, width/2, height/2);
}
popMatrix();

for (int x = 0; x < height; x = x+10)
{
  line(x, height, width/2, height/2);
  line(x, 0, width/2, height/2);
}
