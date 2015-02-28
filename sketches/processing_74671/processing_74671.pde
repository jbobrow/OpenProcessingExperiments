
//Jinhe Weber, CP1, Mods 16-17
void setup()
{
  size(450,450);
  frameRate(1);
  smooth(); 
}
void draw()
{
  background(0);
  stroke(0);
  float x = 0;
  int j = 1;
  while (j<=100)
  {
    j++;
    fill(random(107), random(211), random(174), 120);
    ellipse(int(random(450)), int(random(450)),55,55);
  }
}
