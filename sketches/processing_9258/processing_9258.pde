
class particle {
  
  float x;
  float y;
  float px;
  float py;
  float magnitude;
  float angle;
  float mass;
  boolean charge;
  
  particle( float dx, float dy, float V, float A, float M, boolean C ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
    charge = C;
  }
  
  void reset( float dx, float dy, float V, float A, float M, boolean C ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
    charge = C;
  }
  
  void gravitate( particle Z ) {
    float F, mX, mY, A;
    if( sq( x - Z.x ) + sq( y - Z.y ) > 1 ) {
      F = 5*Z.mass/mass;
      F /= sqrt( sq( x - Z.x ) + sq( y - Z.y ) );
      if( sqrt(sq( x - Z.x ) + sq( y - Z.y )) < 10 ) {
        F = 0.1;
      }
      A = atan2( Z.y-y, Z.x-x );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = atan2( mY, mX );
    }
  }

  void repel( particle Z ) {
    float F, mX, mY, A;
    if( sq( x - Z.x ) + sq( y - Z.y ) > 1 ) {
      F = 5*Z.mass/mass;
      F /= sqrt( sq( x - Z.x ) + sq( y - Z.y ) );
      if( sqrt(sq( x - Z.x ) + sq( y - Z.y )) < 10 ) {
        F = 0.1;
      }
      A = atan2( y-Z.y, x-Z.x );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = atan2( mY, mX );
    }
  }
  
  void deteriorate() {
    magnitude *= 0.999;
  }
  
  void update() {
    
    x += magnitude * cos(angle);
    y += magnitude * sin(angle);
    
    if( x+mass*5 > width ) { // Impact with right wall
      x = width-mass*5;
      angle = atan2(sin(angle),-cos(angle));
    }
    if( x < mass*5 ) { // Impact with left wall
      x = mass*5;
      angle = atan2(sin(angle),-cos(angle));
    }
    if( y+mass*5 > height ) { // Impact with bottom wall
      y = height-mass*5;
      angle = atan2(-sin(angle),cos(angle));
    }
    if( y < mass*5 ) { // Impact with top wall
      y = mass*5;
      angle = atan2(-sin(angle),cos(angle));
    }
    
  }
  
  void display(float detail, float back) {
    stroke(1);
    fill(back);
    ellipse( x, y, mass*10, mass*10 );
    stroke(detail);
    fill(detail);
    rect( x-mass*3.5,y-mass*0.7,mass*7,mass*1.4);
    if(charge) {
      rect( x-mass*0.7,y-mass*3.5,mass*1.4,mass*7);
    }
    px = x;
    py = y;
  }
  
  
}

