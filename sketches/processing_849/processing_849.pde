
class Ball implements Collidable
{
  PVector position, speed;
  float diameter;
  color fillColor, fillColor1, fillColor2;
  boolean inCollision;

  Ball()
  {
    position = new PVector( random( width ), random( height ) );
    speed = new PVector( random( -3, 3 ), random( -3, 3 ) );
    diameter = random( 100, 300 );
    fillColor1 = color( random( 255 ), random( 255 ), random( 255 ), 127 );
    fillColor2 = color( red(fillColor1)-100, 
                        green(fillColor1)-100, 
                        blue(fillColor1)-100, 127 );
    fillColor = fillColor1;
  }

  void update()
  {
    pushMatrix();
    translate( position.x, position.y );   
    move();
    display();
    popMatrix();
  }

  void move()
  {
    position.x += speed.x;
    position.y += speed.y;
    if( position.x > width ) speed.x *= -1;
    if( position.y > height ) speed.y *= -1;
    if( position.x < 0 ) speed.x *= -1;
    if( position.y < 0 ) speed.y *= -1;
  }

  void display()
  {
    fill( fillColor );
    stroke( fillColor );
    ellipseMode( CENTER );
    ellipse( 0, 0, diameter, diameter );
  }

  void collide( CollisionEvent c )
  {
    if( c instanceof CollisionEntryEvent )
    {
      fillColor = fillColor2;
    }
    if( c instanceof CollisionExitEvent )
    {
      fillColor = fillColor1;
    }
  }

  PVector getPosition()
  {
    return position;
  }

  float getDiameter()
  {
    return diameter;
  }
}


