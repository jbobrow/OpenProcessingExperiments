
class FloatingSphere
{
  float xPosition, yPosition, xSpeed, ySpeed;
  int radius;
  color rcolor;

  FloatingSphere()
  {
    //rcolor = color(random(255),random(255), random(255), random(255)); 
    xPosition = random(width);
    yPosition = random(height);
    //    xPosition = 0;
    //    yPosition = 0;
    xSpeed = random( -4, 4 );
    ySpeed = random( -4, 4 );
    //xSpeed = -2;
    //ySpeed = -2;
    radius = int( random( 20, 100 ) );
  }

  void move()
  {
    rcolor = color(random(255),random(255), random(255), random(255)); 
    xPosition = xPosition + xSpeed;
    yPosition = yPosition + ySpeed;
    if(xPosition > width)
    {
      xPosition = 0;
      println( "passed the right");
    }

    if(yPosition > height)
    {
      println( "passed the bottom"); 
      yPosition = 0; 
    }
    if(yPosition < 0)
    {
      println("passed the top"); 
      yPosition = height;
    }
    if(xPosition < 0)
    {
      println("passed the left side");
      xPosition = width;
    }
  }

  void display()
  { 
    fill(rcolor);
    ellipseMode( CENTER );
    ellipse( xPosition, yPosition, radius*2, radius*2 );

  }
}





