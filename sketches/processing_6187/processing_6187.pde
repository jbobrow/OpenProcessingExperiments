
class particle { 
   
  float x; 
  float y; 
  float px; 
  float py; 
  float magnitude; 
  float angle; 
  float mass; 
   
  particle( float dx, float dy, float V, float A, float M ) { 
    x = dx; 
    y = dy; 
    px = dx; 
    py = dy; 
    magnitude = V; 
    angle = A; 
    mass = M; 
  } 
   
  void reset( float dx, float dy, float V, float A, float M ) { 
    x = dx; 
    y = dy; 
    px = dx; 
    py = dy; 
    magnitude = V; 
    angle = A; 
    mass = M; 
  } 
   
  void gravitate( particle Z ) { 
    float F, mX, mY, A; 
    if( sq( x - Z.x ) + sq( y - Z.y ) != 0 ) { 
      F = mass * Z.mass; 
      mX = ( mass * x + Z.mass * Z.x ) / ( mass + Z.mass ); 
      mY = ( mass * y + Z.mass * Z.y ) / ( mass + Z.mass ); 
      A = findAngle( mX - x, mY - y ); 
       
      mX = F * cos(A); 
      mY = F * sin(A); 
       
      mX += magnitude * cos(angle); 
      mY += magnitude * sin(angle); 
       
      magnitude = sqrt( sq(mX) + sq(mY) ); 
      angle = findAngle( mX, mY ); 
    } 
  } 
 
  void repel( particle Z ) { 
    float F, mX, mY, A; 
    if( sq( x - Z.x ) + sq( y - Z.y ) != 0 ) { 
      F = mass * Z.mass; 
      mX = ( mass * x + Z.mass * Z.x ) / ( mass + Z.mass ); 
      mY = ( mass * y + Z.mass * Z.y ) / ( mass + Z.mass ); 
      A = findAngle( x - mX, y - mY ); 
       
      mX = F * cos(A); 
      mY = F * sin(A); 
       
      mX += magnitude * cos(angle); 
      mY += magnitude * sin(angle); 
       
      magnitude = sqrt( sq(mX) + sq(mY) ); 
      angle = findAngle( mX, mY ); 
    } 
  } 
   
  void deteriorate() { 
    magnitude *= 0.925; 
  } 
   
  void update() { 
     
    x += magnitude * cos(angle); 
    y += magnitude * sin(angle); 
     
  } 
   
  void display() { 
    line(px,py,x,y); 
    px = x; 
    py = y; 
  } 
   
   
} 
 
float findAngle( float x, float y ) { 
  float theta; 
  if(x == 0) { 
    if(y > 0) { 
      theta = HALF_PI; 
    } 
    else if(y < 0) { 
      theta = 3*HALF_PI; 
    } 
    else { 
      theta = 0; 
    } 
  } 
  else { 
    theta = atan( y / x ); 
    if(( x < 0 ) && ( y >= 0 )) { theta += PI; } 
    if(( x < 0 ) && ( y < 0 )) { theta -= PI; } 
  } 
  return theta; 
} 


