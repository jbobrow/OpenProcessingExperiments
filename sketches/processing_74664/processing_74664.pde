
// Alina V, Hundred Random Shapes, CP1 mods 16,17
void setup()
{
  size (500, 500);
  frameRate(2);
}
void draw()
{
  background(66, 195, 252);
  fill(255, 255, 255);
  ellipse(250, 250, 425, 425);
  // house
  fill(86, 250, 131);
  rect(175, 250, 150,150);
  fill(255, 0, 0);
  triangle(175, 250, 175 + 150, 250, 175 + (150/2), 125);
  strokeWeight(3);
  line(200, 275, (175 + 150) - 25, 275);
  line(200, 325,  (175 + 150) - 25, 325);
  line(200,275, 200, 325);
  line((175 + 150) - 25, 275, (175 + 150) - 25, 325);
  line(250, 275, 250, 325);
  line(200, 275 + 25, (175 + 150) - 25, (175 + 150) - 25); 
  //bottom
  strokeWeight(1);
  fill(255, 0, 0);
  rect(100, 450, 300, 100);
  int a = 1;
  while ( a <= 100)
  {
    fill(int(random(0, 255)), 0 , int(random(0, 255)), int(random(50, 255)));
    ellipse(int(random(100,400)), int(random(100,400)), 15, 15);
    a++;
  }
}
