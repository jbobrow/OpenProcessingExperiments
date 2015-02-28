
/* Class that represents a body of mass in a gravitational system.
 * The radius of the circle that is rendered to represent the mass
 * is directly proportional to the mass of the body.
 */

class Mass
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float m;    // mass of the body
  float g;    // gravitational constant
  color c;    // color of the circle that represents the body of mass
  
  int w, h;   // width and height of the display window
  
  
  /* Constructor */
  Mass(float _m, int _x, int _y, color _c, float _g, int _w, int _h)
  {
    position = new PVector(_x, _y, 0.0);
    velocity = new PVector(0.0, 0.0, 0.0);
    acceleration = new PVector(0.0, 0.0, 0.0);
    
    m = _m;
    c = _c;
    g = _g;
    w = _w;
    h = _h;
  }
  
  PVector getPosition()
  {
    return position;
  }
  
  float getMass()
  {
    return m;
  }
  
  /* Method to move the mass according to its acceleration and velocity */
  void move()
  {
    velocity.add(acceleration);
    position.add(velocity);
    
    if( position.x < m/2 || position.x > w-m/2 )
    {
      velocity.x = -1 * velocity.x;
    }
    
    if( position.y < m/2 || position.y > h-m/2 )
    {
      velocity.y = -1 * velocity.y;
    }
  }
  
  /* Method to display the body. */
  void display()
  {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, m, m);
    stroke(200, 200, 200, 100);
    line(position.x, position.y, position.x + velocity.x, position.y + velocity.y);
  }
  
  /* Method to set a body's acceleration to zero. */
  void resetAcceleration()
  {
    acceleration.set(0.0, 0.0, 0.0);
  }
  
  /* Method to change the acceleration vector based on
   * a mass's attraction to another mass based on the
   * other mass's position and mass.
   */
   void gravitate(PVector _pos, float _m)
   {
     float r = position.dist(_pos);
     
     if( r > m/2 )
     {
       PVector _a = new PVector(_pos.x - position.x , _pos.y - position.y , 0.0);
       _a.normalize();
       _a.mult( (g*_m) / pow(r, 2) );
       acceleration.add(_a);
     }
   }
}

