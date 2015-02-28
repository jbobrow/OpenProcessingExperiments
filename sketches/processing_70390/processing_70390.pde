
//Cristen Wong, CP1, Mods 16/17, Animation

int x = 0;
void setup ()
{
  size(500, 400);
  background(55, 60, 90);
  stroke(137, 138, 142);
  ellipse(50, 50, 70, 70);
  fill(187, 190, 206);
  noStroke();
  ellipse(60,75,45,35);
  ellipse(90,75,52,40);
  ellipse(90+25,75,40,30);
  ellipse(160, 42, 45, 35);
  ellipse(190, 42, 52, 40);
  ellipse(190+25, 42, 40, 30);
  ellipse(320, 56, 45, 35);
  ellipse(350, 56, 52, 40);
  ellipse(350+25, 56, 40, 30);
  fill(88,75,65);
  rect(60,350,20,60);
  fill(93,142,83);
  ellipse(50,350,30,20);
  ellipse(70,350,40,30);
  ellipse(60,340,30,30);
  ellipse(80,340,40,30);
}
void draw ()
{
  if (x>600)
  {
    x=0;
  }
  noStroke();
  fill(55, 60, 90);
  rect(x, 150, 150, 150);
  x=x+5;
  stroke(0);
  fill(26, 90, 142);
  rect(x+20, 190, 50, 20);
  line(x+2,195,x+20,195);
  line(x+2,205,x+20,205);
  line(x+50,180,x+50,190);
  line(x+50,210,x+50,220);
  fill(277, 188, 147);
  ellipse(x+80, 200, 30, 30);
  fill(0);
  ellipse(x+80, 192, 28, 15);
  ellipse(x+90, 202, 2,2);
  frameRate(42);
}
