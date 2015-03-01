
final int nbBuoys = 60;
Buoy[] buoys;
final float CALM = .95;
final float FRICTION = .85;
float xGap;//x distance between the buoys
float noiseX = random(123456);
Boolean noiseOn = true;

void setup()
{
  size(650, 250, P2D);
  initialize();
}

void initialize()
{
  buoys = new Buoy[nbBuoys];
  xGap = (width+20) / (nbBuoys-1);
  for (int i = 0; i < nbBuoys; i ++)
  {
    buoys[i] = new Buoy(map(i, 0, nbBuoys-1, -10, width+10), height/2);
  }
}

void draw()
{
  background(120);
  if (mouseY != pmouseY)
  {
    move();
  }

  PVector force, extension;
  Buoy prevBuoy, currBuoy, nextBuoy;
  noiseX += .012;
  for (int i = 0; i < nbBuoys; i ++)
  {
    force = new PVector(0, 0);
    extension = new PVector(0, 0);
    currBuoy = buoys[i];
    if (i > 0)
    {
      prevBuoy = buoys[i-1];
      extension = prevBuoy.pos.get();
      extension.sub(currBuoy.pos);
      force.x += CALM * extension.x;
      force.y += CALM * extension.y;
    }

    if (i < nbBuoys - 1)
    {
      nextBuoy = buoys[i+1];
      extension = nextBuoy.pos.get();
      extension.sub(currBuoy.pos);
      force.x += CALM * extension.x;
      force.y += CALM * extension.y;
    }

    extension = currBuoy.origin.get();
    extension.sub(currBuoy.pos);
    force.x += CALM/5 * extension.x;
    force.y += CALM/5 * extension.y;

    currBuoy.acc = force.get();
    currBuoy.acc.mult(.1);
    currBuoy.speed.add(currBuoy.acc);
    currBuoy.speed.mult(FRICTION);
    //currBuoy.pos.add(currBuoy.speed);//x position should not be impacted
    currBuoy.pos.y += currBuoy.speed.y;  

    if (noiseOn) currBuoy.pos.y += 10 * noise(noiseX + currBuoy.pos.x/10);
  }

  fill(0, 0, 255, 100);
  stroke(0, 0, 255, 222);
  beginShape();
  for (int i = 0; i < nbBuoys; i ++)
  {
    curveVertex(buoys[i].pos.x, buoys[i].pos.y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void move()
{
  //impacted buoy rank if any
  int i = (int)map(mouseX, 0, width, 0, nbBuoys - 1);
  //detects that the mouse crossed the ith buoy's y position
  if ((pmouseY - buoys[i].pos.y) * (mouseY - buoys[i].pos.y) <= 0)
  {
    buoys[i].speed.y += (mouseY - pmouseY) * 4;
  }
}

void keyPressed()
{
  if (key == 'n')
  {
    noiseOn = !noiseOn;
  }
}

class Buoy
{
  PVector pos, origin, speed, acc;

  Buoy(float p_x, float p_y)
  {
    origin = new PVector(p_x, p_y);
    pos = origin.get();
    speed = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
}


