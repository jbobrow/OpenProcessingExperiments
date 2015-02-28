
PVector places[] = {
  //  new PVector(300, 290, 75), new PVector(400, 420, 100), new PVector(240, 320, 120)
  new PVector(500, 490, 75), new PVector(400, 420, 100), new PVector(440, 320, 120)
  };
  float lastMax = 0;
float floatError = 0.1;
int lastSelected = 0;

void setup()
{
  size(800, 800);
  noLoop();
}

void drawOverLay()
{
  float n = 10;//1000/(pow(2, frameCount/100+3));

  int fx = 0;
  int fy = 0;
  float bestV = 0;
  float bestColour = 0;

  lastMax = 0;
  println(width/n*height/n*places.length);
  for (int x = 0; x < width; x+=n)
  {
    for (int y = 0; y < height; y+=n)
    {
      //calculate the value for the point
      float v = 0;
      float distances[] = new float[places.length];
      for (int c = 0; c < places.length; c++)
      {
        distances[c] = dist(places[c].x, places[c].y, x+n/2.0, y+n/2.0)-abs(places[c].z);
      }

      float value = Polydist(distances);

      if (lastMax < value) {
        lastMax = value;
      }

      value = 1-value/lastMax;

      v = 255*constrain(pow(value*(1+pow(floatError, 2)), 30), 0, 1);

      if (value > bestV) {
        fx = x;
        fy = y;
        bestV = value;
        bestColour = v;
      }

      //this is just colour stuff...

      noStroke();
      colorMode(RGB);
      fill(v, 100);
      //colorMode(HSB);
      //v += noise(frameCount/30.0)*200;
      //fill(v/2.0, 255,v, 100);//100);
      rect(x, y, n, n);
    }
  }

  noStroke();
  colorMode(RGB);

  if ((1-floatError)*255 > bestColour)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  ellipse(fx+n/2.0, fy+n/2.0, 5, 5);

  println("DONE");
}

float Polydist(float set[])
{
  float total = 0;
  for (int c = 0; c < set.length; c++)
  {
    total += set[c]*set[c];
  }
  return sqrt(total);
}

void draw()
{
  println(mouseX+", "+mouseY);
  background(0);

  for (int c = 0; c < places.length; c++)
  {
    noFill();
    colorMode(HSB);
    stroke(c*255/(1+places.length), 255, 255);

    //ellipse(places[c].x, places[c].y, places[c].z*2.0, places[c].z*2.0);
    ellipse(places[c].x, places[c].y, places[c].z*2.0*(1+floatError), places[c].z*2.0*(1+floatError));
    ellipse(places[c].x, places[c].y, places[c].z*2.0*(1-floatError), places[c].z*2.0*(1-floatError));


    if (lastSelected == c)
    {
      fill(c*255/(1+places.length), 255, 255);
    }
    ellipse(places[c].x, places[c].y, 10, 10);
  }
  drawOverLay();
}

void mousePressed() {
  mouseDragged();
}

void mouseDragged()
{
  for (int c = 0; c < places.length; c++)
  {
    if (dist(mouseX, mouseY, places[c].x, places[c].y) < 20)
    {
      places[c].x += mouseX-pmouseX;
      places[c].y += mouseY-pmouseY;

      lastSelected = c;
    }
  }

  redraw();
}

void keyPressed()
{
  if (key == '=')
  {
    places[lastSelected].z++;
  }
  if (key == '-')
  {
    places[lastSelected].z--;
  }
  if (keyCode == UP)
  {
    places[lastSelected].y--;
  }
  if (keyCode == DOWN)
  {
    places[lastSelected].y++;
  }
  if (keyCode == LEFT)
  {
    places[lastSelected].x--;
  }
  if (keyCode == RIGHT)
  {
    places[lastSelected].x++;
  }
  redraw();
}

