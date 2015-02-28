
/*----------------------------------
  
 Copyright by Diana Lange 2014
 Don't use without any permission
  
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 
 -----------------------------------*/

Circle c;
float fRadialReduction = 0.5;
float fSpeedIncrease = 2;

ArrayList <F> y;

void setup ()
{
  size (900, 500);
  smooth();

  c = new Circle (225, 250, 110);

  y = new ArrayList();
}

void draw ()
{

  background (#7a9686);

  fill (#56676e);
  noStroke();
  rect (0, 0, width/2, height);

  strokeWeight (3);

  /* ddisplay and move cirlces ---------------*/

  c.move();
  c.display();

  /* add values for graph ---------------*/

  y.add (0, new F (c.getY()));

  if (y.size () > width/4) y.remove(y.size()-1);

  /* display graph ---------------*/

  stroke (255);
  noFill();
  beginShape();
  for (int i = 0; i < y.size(); i++)
  {
    vertex (i*2 + width/2, y.get(i).f);
  }
  endShape();

  int count = 0;


  /* dashed line ---------------*/

  stroke(#e8e2b2);
  for (float i = c.getX(); i < width/2; i+= 8)
  {

    if (count % 2 == 0) line (i, c.getY(), i+8 < width/2 ? i+5 : width/2, c.getY());
    count++;
  }
}

void keyPressed ()
{ 
  if (key == '1') fRadialReduction = 0.2;
  if (key == '2') fRadialReduction = 0.3;
  if (key == '3') fRadialReduction = 0.4;
  if (key == '4') fRadialReduction = 0.5;
  if (key == '5') fRadialReduction = 0.6;
  if (key == '6') fRadialReduction = 0.7;
  if (key == '7') fRadialReduction = 0.8;
  if (key == 'q') fSpeedIncrease = 0.33;
  if (key == 'w') fSpeedIncrease = 0.67;
  if (key == 'e') fSpeedIncrease = 1;
  if (key == 'r') fSpeedIncrease = 1.33;
  if (key == 't') fSpeedIncrease = 1.67;
  if (key == 'z') fSpeedIncrease = 2;
  if (key == 'u') fSpeedIncrease = 2.5;
  if (key == 's')
  {
    float s = random (1/(20*TWO_PI), 1 / TWO_PI);
    c.angleSteps = s;
    c.setAngle (0);
  }


  switch (key)
  {
  case ' ':
    c.setAngle(0);
  case '+':
    c.addChild(fRadialReduction, fSpeedIncrease);
    break;
  case '-':
    c.removeChild();
    break;
  case '1':
  case '2':
  case '3':
  case '4':
  case '5':
  case '6':
  case '7':
    c.setRadialReduction (fRadialReduction, fSpeedIncrease);
    break;

  case 'q':
  case 'w':
  case 'e':
  case 'r':
  case 't':
  case 'z':
  case 'u':
  case 's':
    c.setSpeedIncrease (fSpeedIncrease);
    break;
  }
}

class Circle
{
  float angleSteps = 1/(10*TWO_PI);
  float angle = 0, startAngle = 0;
  float cx, cy, r;

  Circle c;

  Circle (float centerX, float centerY, float r)
  {
    cx = centerX;
    cy = centerY;
    this.r = r;
  }
  
  void setAngle (float a)
  {
    angle = startAngle = a;
    
    if (c != null) c.setAngle (a);
  }

  PVector getPos ()
  {
    if (c == null ) return new PVector (cx + cos (startAngle+angle)*r, cy + sin (startAngle+angle)*r);
    else return c.getPos();
  }

  float getY()
  {
    if (c == null ) return (cy + sin (startAngle+angle)*r);
    else return c.getY();
  }

  float getX()
  {
    if (c == null ) return (cx + cos (startAngle+angle)*r);
    else return c.getX();
  }
  

  void addChild (float f, float s)
  {
    if (c == null)
    {
      if (r*f > 1)
      {
        c = new Circle (cx + cos (startAngle+angle)*r, cy + sin (startAngle+angle)*r, r* f);
        c.startAngle = startAngle+angle;
        c.angleSteps = angleSteps*s;
      }
    }
    else c.addChild(f, s);
  }

  void removeChild ()
  {
    if (c != null)
    {
      if (c.c == null) c = null;
      else c.removeChild();
    }
  }
  
  void setRadialReduction (float f, float s)
  {
    if (c != null)
    {
      if (r*f > 1)
      {
        c.cx = cx + cos (startAngle+angle)*r;
        c.cy = cy + sin (startAngle+angle)*r;
        c.r = r*f;
        
        c.startAngle = startAngle+angle;
        c.angleSteps = angleSteps*s;
        c.setRadialReduction (f, s);
      }
      else removeChild();
    }
  }
  
  void setSpeedIncrease (float s)
  {
    if (c != null)
    {
      c.angleSteps = angleSteps * s;
      c.setSpeedIncrease (s);
    }
  }

  void move ()
  {
    angle -= angleSteps;

    if (c != null) 
    {
      c.cx = cx + cos (startAngle+angle)*r;
      c.cy = cy + sin (startAngle+angle)*r;
      c.startAngle = startAngle+angle;
      c.move();
    }
  }

  void display ()
  {
    displayCirlce ();
    displayAngle ();

    if (c != null) c.display();
  }

  void displayAngle ()
  {
    stroke (#e8e2b2);
    line (cx, cy, cx + cos (startAngle+angle)*r, cy + sin (startAngle+angle)*r);
  }

  void displayCirlce ()
  {
    noFill();
    stroke(#b1c999);
    ellipse (cx, cy, r*2, r*2);
  }
}

class F
{
  float f;
  F (float f)
  {
    this.f = f;
  }
}


