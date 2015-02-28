
//Wayland L, Hundred Shapes, CP1 mods 16-17
void setup()
{
  size(700,700);
  frameRate(1);
}
void draw()
{
  background(0);
  int i = 1;
  stroke(255);
  strokeWeight(8);
  ellipse(350,350,650,650);
  while(i<=100)
  {
    fill(int(random(256)),int(random(256)),int(random(256)),80);
    stroke(0);
    ellipse(350-int(random(-200,200)),350-int(random(-200,200)),40,40);
    i++;
  }
}
