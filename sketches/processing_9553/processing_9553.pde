


class CircularAttractor
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector center;
  
  int r;
  float attraction;
  float f_coeff;
  
  /* Constructor */
  CircularAttractor(int _x, int _y, int _r, float _a, float _f)
  {
    position = new PVector(_x, _y, 0.0);
    velocity = new PVector(0.0, 0.0, 0.0);
    acceleration = new PVector(0.0, 0.0, 0.0);
    center = new PVector(0.0, 0.0, 0.0);
    
    r = _r;
    attraction = _a;
    f_coeff = _f;
  }
  
  /* Method to display the CircularAttractor */
  void display()
  {
    stroke(50);
    fill(200, 100, 200, 100);
    ellipse(position.x, position.y, 2*r, 2*r);    // main circle
    noFill();
    ellipse(center.x, center.y, 2, 2);        // little circle
    stroke(180, 180, 180, 100);
    line(0, 0, position.x, position.y);
    line(position.x, position.y, center.x, center.y);
  }
  
  /* Method to move */
  void move()
  {
    acceleration.set(center.x - position.x , center.y - position.y , 0.0 );
    acceleration.normalize();
    // friction.set(acceleration);
    // friction.mult(f_coeff);
    acceleration.mult(attraction);
    
    velocity.mult(f_coeff);
    velocity.add(acceleration);
    // velocity.sub(friction);
    
    position.add(velocity);
  }
  
  /* Method to set the acceleration */
  void set_center(PVector _c)
  {
    center.set(_c);
  }
  
  void set_friction( float _f )
  {
    f_coeff = _f;
  }
  
  void set_attraction( float _a)
  {
    attraction = _a;
  }
}

