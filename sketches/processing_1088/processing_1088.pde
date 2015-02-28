
class Motorcycle 
{ 
  Land land; 
  int x; 
  int w; 
  int indent;
  float h1, h2; 
  float jumpSpeed; 
  float gravity; 
  float initialJumpSpeed; 
  PShape s;
  float speed;
  float acceleration;
  float theta;
  boolean jumping;
  boolean debug;

  Motorcycle( Land land ) 
  { 
    this.land = land; 
    s = loadShape("motorcycle.svg");
    s.scale( -1, 1 );
    s.translate( -s.width, 0 );
    x = width/3; 
    w = (int)s.width;  
    indent = 25;
    jumpSpeed = 10; 
    initialJumpSpeed = jumpSpeed; 
    gravity = .3; 
    speed = 0;
    acceleration = .2;
    theta = 0;
    h1 = land.getY(x+indent);
    h2 = land.getY(x+int(s.width)-indent);
  }  

  void display() 
  { 
    int x1, x2, y1, y2;
    x1 = x + indent;
    x2 = x + (int)s.width - indent;
    y1 = land.getY( x1 );
    y2 = land.getY( x2 ); 
    if( debug )
    {
      fill( 255, 0, 0 );
      stroke( 255, 0, 0 );
      ellipse( x1, y1, 10, 10 );
      ellipse( x2, y2, 10, 10 );
      line( x1, y1, x2, y2 );
    }
    jumpSpeed -= gravity;
    if( h1 >= y1 )
    {
      h1 = y1;
    }
    else
    {
      h1 -= jumpSpeed;       
    }
    if( h2 >= y2 )
    {
      h2 = y2;
    }
    else
    {
      h2 -= jumpSpeed; 
    }
    if( h1 >= y1 && h2 >= y2 )
    {
      theta = atan2( y2 - y1, x2 - x1 );
      jumpSpeed = -1*speed*sin( theta );
    }
    translate( x1, h1 );
    rotate( theta );
    shape( s, -indent, -s.height );      
  } 

  void jump() 
  { 
    if(! jumping )
    {
      jumping = true;
      jumpSpeed = initialJumpSpeed; 
      h1 -= jumpSpeed; 
      h2 -= jumpSpeed;
      jumpSpeed -= gravity; 
    }
  } 

  void move()
  {
    land.displace( int(speed) ); 
  }

  void accelerate()
  {
    speed += acceleration;
  }

  void slowDown()
  {
    if( speed > 0 )
    {
      speed -= acceleration;
    }
  }
} 





































