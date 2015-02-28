
void setup()
{
  size(600, 600);
  colorMode(RGB, 100);
  noLoop();
  noStroke();
}

color cr=color(255, 0, 0, 50);
color cg=color(0, 255, 0, 50);
color cb=color(0, 0, 255, 50);
color cy=color(255, 255, 0, 50);
color co=color(250, 96, 0, 50);
color cc=color(0, 227, 255, 50);
color cp=color(215, 0, 245, 50);
color[] colors = {
  cr, cg, cb, cy, co, cc, cp
};
color c1=(colors[int(random(0, 7))]);
color c2=(colors[int(random(0, 7))]);
color c3=(colors[int(random(0, 7))]);
color c4=(colors[int(random(0, 7))]);
void draw()
{
  for (int i=0; i<width/2; i+=80)
  {
    fill(c1);
    triangle(width/2, width/2, width/2+80+i, width/2, width/2, width/2-80-i);
    fill(c2);
    triangle(width/2, width/2, width/2+80+i, width/2, width/2, width/2+80+i);
    fill(c3);
    triangle(width/2, width/2, width/2, width/2+80+i, width/2-80-i, width/2);
    fill(c4);
    triangle(width/2, width/2, width/2-80-i, width/2, width/2, width/2-80-i);
  }
}


