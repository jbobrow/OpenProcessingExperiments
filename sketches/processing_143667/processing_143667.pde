


int numThoughts = 8, bgShade = 0;
Thought[] thoughts = new Thought[numThoughts];


void setup()
{
  size(800, 400);
  noStroke();

  for (int i = 0; i < numThoughts; i++)
  {
    thoughts[i] = new Thought();
  }
}

void draw()
{
  background(bgShade);

  //ellipse(width/2, height/2, 50, 50);

  int withFocus = 0;

  for (int i = 0; i < numThoughts; i++)
  {
    if (dist(mouseX, mouseY, thoughts[i].getX(), thoughts[i].getY())
      < thoughts[i].getSize())
    {
      //mouse on object
      if (bgShade < 255)
      {
        bgShade++;
      }

      color focusColor = color(255, 0, 0);
      thoughts[i].setColor(focusColor);
      thoughts[i].setFocus(true);
    }
    else
    {
      //mouse off object

      thoughts[i].setColor(255);
      thoughts[i].setFocus(false);
    }

    if (thoughts[i].gotFocus())
    {
      withFocus++;
    }

    thoughts[i].change();
    thoughts[i].display();
  }

  if (withFocus < 1)
  {
    bgShade = 0;
  }
}


//OBJECTS
class Thought
{
  int x, y, x2, y2, rate, min, max, size;
  color fillColor;
  boolean hasFocus;

  Thought()
  {
    x = (int) random(width);
    y = (int) random(height);
    x2 = x;
    y2 = y;
    rate = (int) random(1, 5);
    size = (int) random(20, 100);
    fillColor = color(255, 255, 255);
    hasFocus = false;
  }

  void display()
  {
    fill(fillColor);
    //scale(0.1);
    //ellipse(x, y, size, size);

    beginShape();
    curveVertex(x-size/2, y-size/2);
    curveVertex(x-size/2, y-size/2);
    curveVertex(x2-size/2, y2+size/2);
    curveVertex(x+size/2, y+size/2);
    curveVertex(x+size/2, y-size/2);
    curveVertex(x-size/2, y-size/2);
    curveVertex(x-size/2, y-size/2);
    endShape();
  }

  void change()
  {
    if (size < 10 || size > 100)
    {
      rate = -rate;
    }
    size += rate;
    //rate++;
    
    //x2++;
  }

  void setFocus(boolean isFocused)
  {
    hasFocus = isFocused;
  }

  boolean gotFocus()
  {
    return hasFocus;
  }

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  void setColor(color clr)
  {
    fillColor = clr;
  }

  int getSize()
  {
    return size;
  }
}

