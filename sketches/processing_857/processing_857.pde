
class FloatingSphere
{
  float Xspeed;
  float Yspeed;
  float Xposition;
  float Yposition;
  float radius;
  color fillColor;

  FloatingSphere() 
  {

    Xspeed = random(-4,4);
    Yspeed = random(-4,4);
    Xposition = random(width);
    Yposition = random(width);
    radius = random(20, 50);
    fillColor = color(random(255),random(255),random(255));

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
    fill(fillColor);
    ellipseMode(CENTER);
    ellipse(Xposition, Yposition, 2*radius, 2*radius);
    

  }



}







