
//Cristen W, CP1, Mods: 16/17, Hundred Random Shapes

void setup()
{
  size(450, 450);
  frameRate(5);
}
void draw()
{
  background(0);
  int num = 1;
  while (num<101)
  {
    fill(random(10, 256), random(10, 256), random(10, 256), random(150, 246));
    stroke(random(10, 256), random(10, 256), random(10, 256));
    triangle(random(80, 420), random(80, 420), random(80, 420), random(80, 420), random(80, 420), random(80, 420));
    triangle(50, 40, 40, 60, 60, 60);
    triangle(60, 60, 60, 80, 80, 70);
    triangle(40, 60, 40, 80, 20, 70);
    triangle(40, 80, 60, 80, 50, 100);
    fill(167, 167, 167);
    stroke(0);
    rect(40, 60, 20, 20);
    stroke(255);
    line(80, 80, 420, 80);
    line(420, 80, 420, 420);
    line(420, 420, 80, 420);
    line(80, 80, 80, 420);
    stroke(255);
    line(40, 60, 80, 80);
    line(60, 60, 420, 80);
    line(40, 80, 80, 420);
    line(60, 80, 420, 420);
    num++;
  }
}
