
class Ball
{
  PVector position, speed, launch;
  int radius;
  float friction;
  color mouseOverColor;
  color clickColor;
  color regularColor;
  boolean mouseLocked;

  Ball()
  {
    position = new PVector( width/2, height/2 );
    speed = new PVector( 10, 3 );
    launch = new PVector( 0, 0 );
    friction = .1; 
    radius = (int)random( 30, 70 );
    regularColor = color( 255, 255, 255 );
    clickColor = color( 255, 150, 150 );
    mouseOverColor = color( 255, 200, 200 );
  }

  void display()
  {
    move();
    appearance();
  }

  float friction( float v )
  {
    if( abs(v) > friction )
    {
      if( v > 0 )
      {
        return v - friction; 
      }
      else
      {
        return v + friction ;
      }
    }
    return -v;
  }

  void move()
  {
    if( ! mouseLocked )
    {
      speed.x = friction( speed.x );
      speed.y = friction( speed.y );
      position.x += speed.x;
      position.y += speed.y;
      // if it hits the left or the right
      if( ( position.x + radius > width ) || ( position.x - radius < 0 ) )
      {
        // flip x speed to go in opposite direction
        speed.x *= -1; 
      }
      // if it hits top or bottom
      if( ( position.y + radius > height ) || ( position.y - radius < 0 ) )
      {
        speed.y *= -1; 
      } 
    }
  }

  void appearance()
  {
    if(! mousePressed )
    {
      if( mouseLocked )
      {
        mouseLocked = false; 
        speed.x = position.x - mouseX;
        speed.y = position.y - mouseY;
      }
    }
    if( pointIsInside( mouseX, mouseY ) )
    {
      fill( mouseOverColor );
      stroke( mouseOverColor );
      if( mousePressed )
      {
        mouseLocked = true; 
      }
    }
    else
    {
      fill( regularColor );
      stroke( regularColor );
    }
    if( mouseLocked )
    {
      fill( clickColor );
      stroke( clickColor );
    }
    ellipse( position.x, position.y, radius*2, radius*2 ); 
    if( mouseLocked )
    {
      fill( 0, 0, 255 );
      strokeWeight( 10 );
      stroke( 0, 0, 255 );
      line( position.x, position.y, mouseX, mouseY ); 
    }
  }

  boolean pointIsInside( int x, int y )
  {
    return dist( position.x, position.y, x, y ) <= radius;
  }

}




