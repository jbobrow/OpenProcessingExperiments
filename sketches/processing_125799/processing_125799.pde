
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelo;
ArrayList<Integer> yvelo;
int shapeSize;
int count;
int operations;

//Right clicking adds circles that fly around, left clicking on the circles removes them.
//Pressing up increase the size of the main square and circle, pressing down decreases the size.

void setup()
{
  size(800,800);
  rectMode(CENTER);
  background(count);
  stroke(255);
  fill(0,255,0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelo = new ArrayList<Integer>();
  yvelo= new ArrayList<Integer>();
  count = 0;
  operations = 0;
  shapeSize = 100;
}

void draw()
{
  backChange();
  background(count,count,count);
  fill(0,255,0,25);
  rect(mouseX,mouseY,shapeSize,shapeSize);
  fill(255,0,255,50);
  connectingLines();
  fill(random(255),random(255),random(255));
  for (int i = 0; i < xpos.size(); i++)
  {
    ellipse(xpos.get(i), ypos.get(i), 25, 25);
    xpos.set(i, xpos.get(i) + xvelo.get(i));
    ypos.set(i, ypos.get(i) + yvelo.get(i));
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
    size = size + 1;
    background(count,count,count);
  }
  else if (keyCode == DOWN)
  {
    size = size - 1;
    background(count,count,count);
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    for(int i = 0; i < xpos.size(); i++)
    {
      if ((((mouseX - xpos.get(i)) < 30) && ((mouseX - xpos.get(i) > (-30)))) && (((mouseY - ypos.get(i)) < 30) && ((mouseY - ypos.get(i) > (-30)))))
      {
        xpos.remove(i);
        ypos.remove(i);
        xvelo.remove(i);
        yvelo.remove(i);
      }
    }
  }
  else if (mouseButton == RIGHT)
  {
    xpos.add(mouseX);
    ypos.add(mouseY);
    xvelo.add(int(random(-5,5)));
    yvelo.add(int(random(-5,5)));
  }
}

void backChange()
{
  count += 4;
  if (count > 255)
  {
    count = 0;
  }
}

void connectingLines()
{
  strokeWeight(5);
  line(0, 0, mouseX - (shapeSize/2), mouseY - (shapeSize/2));
  line(width, 0, mouseX + (shapeSize/2), mouseY - (shapeSize/2));
  line(0, height, mouseX - (shapeSize/2), mouseY + (shapeSize/2));
  line(width, height, mouseX + (shapeSize/2), mouseY + (shapeSize/2));
  strokeWeight(1);
  ellipse(mouseX, mouseY, shapeSize, shapeSize);
}
