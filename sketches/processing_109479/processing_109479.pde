
//Sam Friedlander
//9/10/13
//Box Fun

//red(234,96,69)
//yellowish(248,202,77)
//tan(245,229,192)
//light blue(63,86,102)
//dark blue(47,52,64)

float xOffset, yOffset,x,y, xtop, ytop, wd, ht;
color red, yellow, tan, ltblue, dkblue;

void setup()
{
  size(500, 500);
  background(245, 229, 192);
  rectMode(CORNER);  
  noStroke();
  x=100;
  y=100;
  wd=50;
  ht=50;
  red= color(234, 96, 69);
  yellow= color(248, 202, 77);
  tan= color(245, 229, 192);
  ltblue= color(63, 86, 102);
  dkblue= color(47, 52, 64);
}
void draw()
{
  background(tan);
  for (x=100; x<width;x+=100)
  {
    for (y=100;y<height;y+=100)
    {
      fill(red);
      rect(x+xOffset, y+yOffset, wd, ht);
      quad((x-(mouseX/5)), (y-(mouseY/5)), (x-(mouseX/5))+wd, (y-(mouseY/5)), (x+xOffset)+wd, (y+yOffset), (x+xOffset), (y+yOffset));
      quad((x-(mouseX/5))+wd, (y-(mouseY/5))+ht, (x-(mouseX/5))+wd, (y-(mouseY/5)), (x+xOffset)+wd, (y+yOffset), (x+xOffset)+wd, (y+yOffset)+ht);
      quad((x-(mouseX/5)), (y-(mouseY/5))+ht, (x-(mouseX/5)), (y-(mouseY/5)), (x+xOffset), (y+yOffset), (x+xOffset), (y+yOffset)+ht);
      quad((x-(mouseX/5)), (y-(mouseY/5))+ht, (x-(mouseX/5))+wd, (y-(mouseY/5))+ht, (x+xOffset)+wd, (y+yOffset)+ht, (x+xOffset), (y+yOffset)+ht);

      fill(dkblue);
      rect(x-(mouseX/5), y-(mouseY/5), wd, ht);
    }
  }
}

void mousePressed()
{
  dkblue= color(red);
  red= color (yellow); 
  yellow= color(tan);
  tan= color(ltblue);
  ltblue= color(dkblue);
}

void mouseReleased()
{
  dkblue= color(red); 
  red= color (yellow);
  yellow= color(tan);
  tan= color(ltblue);
  ltblue= color(dkblue);
}

void keyPressed()
{
  if (key == CODED)
  {

    if (keyCode == RIGHT)
    {
      xOffset+=2;
    } 


    if (keyCode == LEFT)
    {
      xOffset-=2;
    }

    if (keyCode == UP)
    {
      yOffset-=2;
    }

    if (keyCode == DOWN)
    {
      yOffset+=2;
    }
  }
}





