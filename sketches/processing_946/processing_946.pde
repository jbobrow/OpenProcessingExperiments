
class FloatingSphere
{
  float Xspeed;
  float Yspeed;
  float Xposition;
  float Yposition;
  float radius;
  color currentColor;
  color intersectColor;
  color normalColor;


  FloatingSphere() 
  {

    Xspeed = random(-4,4);
    Yspeed = random(-4,4);
    Xposition = random(width);
    Yposition = random(width);
    radius = random(50, 200);
    setColor();


  }

  void move()
  {
    Xposition = Xposition + Xspeed;
    Yposition = Yposition + Yspeed;
    radius = radius -1;
    if(radius > -100)
    {
      radius = radius + 1;
    }    
    if(Xposition > width)
    {
      Xposition = 0;
    }
    if(Yposition > height)
    {
      Yposition = 0;
    }
    if(Xposition < 0)
    {
      Xposition = width;
    }
    if(Yposition < 0)
    {
      Yposition = height;
    }


  }

  void display()
  {
    fill(currentColor);
    ellipseMode(CENTER);
    ellipse(Xposition, Yposition, 2*radius, 2*radius);


  }


  void deintersect()
  {
    currentColor = normalColor;

  }

  void intersect()
  {
    currentColor = intersectColor;
  }


  float distance(float x1, float y1, float x2, float y2)
  {
    return sqrt(sq(x2 - x1) + sq(y2 - y1));

  }

  void setColor()
  {
    currentColor = color(random(255),random(255),random(255));
    intersectColor = color(red(currentColor),green(currentColor),blue(currentColor),127);
    normalColor = currentColor;
  }
}
//  float x1, y1, x2, y2;
//  x1 = 56;
//  y1 = 23;
//  x2 = 67; 
//  y2 = 1;
//  float returnVal;
//  /// your code starts here
//  returnVal = sqrt(sq(x2 - x1) + sq(y2 - y1));
//
//
//  /// your code ends here
//  println( returnVal );



