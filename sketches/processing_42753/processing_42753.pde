
class Branch
{
  PVector d_pos;
  Branch d_left, d_right;
  float d_life;
  float d_angle;
  int d_speed;
  int d_alpha;
  Branch()
  {
    d_pos = new PVector( width/2, 0 );
    d_angle = random(0,180);
    d_life = 5;
    d_speed = 2;
    d_alpha = int(random(255));
  }
  
  Branch( PVector start , int myAlpha, float myLife)
  {
    d_pos = new PVector( start.x, start.y );
    d_angle = random(0,180);
    d_life = random(myLife);
    d_speed = 2;
    d_alpha = myAlpha;
  }
  
  void update()
  {
    d_pos.x += d_speed * cos( radians(d_angle) ) + random(-2,2);
    d_pos.y += d_speed * sin( radians(d_angle) ) + random(-1,2);
    int x = int(random(200));
    if( d_left == null && x == 1 )
    {
      d_left = new Branch(d_pos, d_alpha, d_life);
    }
    else if( d_right == null && x == 2 )
    {
      d_right = new Branch(d_pos, d_alpha, d_life);
    }
    if( x < 50 );
      d_life *= .995;
    
    if( d_left != null )
      d_left.update();
    if( d_right != null )
      d_right.update();
  }
  
  void execute()
  {
    stroke(0, d_alpha);
    fill(0,d_alpha);
    if( d_life >= 1 )
      ellipse( d_pos.x - d_life, d_pos.y - d_life, 2*d_life, 2*d_life );
    if( d_left != null )
      d_left.execute();
    if( d_right != null )
      d_right.execute();
  }
  
  boolean valid()
  {
    if( d_pos.y > height + 100 )
      return false;
    if( d_pos.x + 100 < 0 || d_pos.x > width + 100 )
      return false;
      
    return true;
  }
}

