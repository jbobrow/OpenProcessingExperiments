
particle p;
float g = 0.2;

void setup()
{
  size(1000,500);
  p = new particle(width/2, height, 5, -10 );
}

void draw()
{
  p.move();
  p.draw();
}
class particle
{
  float x,y;
  float v_x, v_y;
  
  
  particle(float initx, float inity, float initv_x, float initv_y)
  {
    x = initx; y = inity;
    v_x = initv_x; v_y = initv_y;
  
  }
  
  void draw()
  {
    ellipse(x,y,5,5);
  }
  
  void move()
  {
    x += v_y; y+= v_y;
    v_y += g;
    
    if( y > height ) { y=height; v_y *= -0.7; }
    if( y < 0 )      { y=0;      v_y *= -0.7; }
    if( x > width )  { x=width;  v_x *= -0.7; }
    if( x < 0 )      { x=0;      v_x *= -0.7; }
  }
}


