
//Kaitlyn Dodge
//Exercise 3

//setup

void setup()
{
size(500, 500);
smooth();
background(0);
frameRate(4);
}

void draw()
{
  for (int i = 0; i < 500; i++) {
  float r = random(500);
  stroke(r*1);
  line(50, i, 50+r, i);
}
for (int i = 0; i < 100; i++) {
  float r = random(50);
  stroke(r*5);
  line(50, i, 50+r, i);
}
}




