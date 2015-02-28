
// Gravity Swarm "Particle class"
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico
class particle {
  // a few extra variables stored here because i dont like them in methods :/
  float x;
  float y;
  float px;
  float py;
  float magnitude;
  float angle;
  float mass;
  float F;
  float mX;
  float mY;
  float A;
  
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
  
  void gravitate( particle Galaxy ) {
    if( sq( x - Galaxy.x ) + sq( y - Galaxy.y ) != 0 ) {
      F = mass * Galaxy.mass;
      mX = ( mass * x + Galaxy.mass * Galaxy.x ) / ( mass + Galaxy.mass );
      mY = ( mass * y + Galaxy.mass * Galaxy.y ) / ( mass + Galaxy.mass );
      A = findAngle( mX - x, mY - y );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }

  void repel( particle Galaxy ) {
    if( sq( x - Galaxy.x ) + sq( y - Galaxy.y ) != 0 ) {
      F = mass * Galaxy.mass;
      mX = ( mass * x + Galaxy.mass * Galaxy.x ) / ( mass + Galaxy.mass );
      mY = ( mass * y + Galaxy.mass * Galaxy.y ) / ( mass + Galaxy.mass );
      A = findAngle( x - mX, y - mY );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }
  
  //*************************** my method
  void bouncingStop() {
 
  float centreX = mouseX;
  float centreY = mouseY;
  float d = .09;
  float c = 15;
  float t;
  float u;
  d = d + magnitude;
  angle = angle + d;
  t = cos(angle)*c + centreX;
  u = sin(angle)*c + centreY;
  t = F;
  u = mass;
  }
  //********************************
  void update() {
    //**************** placed these to bounce off the walls
    if(x<0||x>width) {magnitude*=-1;} 
    if(y<0||y>height){magnitude*=-1;}
    //****************************************************
    x += magnitude * cos(angle);
    y += magnitude * sin(angle);
    
  }
  
  void display() {
    line(px,py,x,y);
    px = x;
    py = y;
  }
  
  void sneak(particle Galaxy){
   
  
  }
  
}

float findAngle( float x, float y ) {
  float theta;
  if(x == 0) {
    if(y > 0) {
      theta = PI/2;
    }
    else if(y < 0) {
      theta = 3*PI/2;
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

// Gravity Swarm "Particle class"
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

/*************************************************************/


particle[] Galaxy = new particle[10000];
float rgb = random(5); //needed a colour variable if there wasnt then it would be black colour was the only code taken from the "glalxy swarm" section


void setup() {
  smooth();
  size(700,400,P2D); //without P2D it lags 

  background(255);
  for(int i = 0; i < Galaxy.length; i++) { //prevents crashing in an infinate loop
    Galaxy[i] = new particle( random(width), random(height), 10, 40, 5 );// needs 5 ints for some reason last int for me is unknowen
  }
  
  frameRate(60);
  colorMode(RGB,255);

}

void draw() {
  
  
  colorMode(HSB,1);//looked up on the galaxy swarm code to see how the background colour was not blue this apparantly along with the other colormode code prevents this
  
  for(int i = 0; i < Galaxy.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Galaxy[i].gravitate( new particle( mouseX, mouseY, 0, 0, 5 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Galaxy[i].repel( new particle( mouseX, mouseY, 0, 0, 5 ) );
    }
  
    else {
      Galaxy[i].bouncingStop();
    }
    float o;
    Galaxy[i].update();
    o = float(i)/Galaxy.length;
    stroke( rgb,7, 1-o, 0.15 );
    
    Galaxy[i].display();
  }
  colorMode(RGB,255);
  
  rgb+=random(0.01); // this is to get the colour variants also buy particle creator
  if( rgb > 1 ) { 
    rgb = rgb%1;
  }
  
}

void mouseMoved(){
  for(int i = 0; i < Galaxy.length; i++) {
    Galaxy[i].sneak( new particle(mouseX,mouseY,0,0,1));
    
    Galaxy[i].update();

    Galaxy[i].display();
  }
}



 

