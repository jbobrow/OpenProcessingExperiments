
class particle {
  
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
  
  void deteriorate() {
    magnitude *= 0.925;
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
  }
  
  void update() {
    if(x<0||x>width) {magnitude*=-1;}
    if(y<0||y>height){magnitude*=-1;}
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

// Gravity Swarm "Particle class"
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

/*************************************************************/

/*particle[] galaxy = new particle[10000];
float hg = random(9);
float wt = random(9);
float z;

void setup(){

  background(0);
  smooth();
  size(700,400);
  
}

void draw(){
  for( int i = 0; i < galaxy.length; i++){
   if (mousePressed && mouseButton == LEFT){  
    galaxy[i].gravitate(new particle(mouseX,mouseY,0,0,1));   
   } 
   else if(mousePressed && mouseButton == RIGHT){
     galaxy[i].repel(new particle(mouseX,mouseY,0,0,1));
   }else{
     galaxy[i].deteriorate();
   }
   galaxy[i].update();
   z = float(i)/galaxy.length;
   galaxy[i].update();
   
  } 


}*/
particle[] Galaxy = new particle[10000];
float colour = random(1);
float o;

void setup() {
  smooth();
  size(700,400,P2D);  

  
  for(int i = 0; i < Galaxy.length; i++) {
    Galaxy[i] = new particle( random(width), random(height), 10, 40, 1 );
  }
  
  frameRate(60);
  colorMode(RGB,255);

}

void draw() {
  background(255);
  
  colorMode(HSB,1);
  for(int i = 0; i < Galaxy.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Galaxy[i].gravitate( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Galaxy[i].repel( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
  
    else {
      Galaxy[i].deteriorate();
    }
    Galaxy[i].update();
    o = float(i)/Galaxy.length;
    stroke( colour, pow(o,0.1), 1-o, 0.15 );
    fill(0,20);
    Galaxy[i].display();
  }
  colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }
  
}

void mouseMoved(){
  for(int i = 0; i < Galaxy.length; i++) {
    Galaxy[i].sneak( new particle(mouseX,mouseY,0,0,1));
    
    Galaxy[i].update();
    o = float(i)/Galaxy.length;
    stroke( colour, pow(o,0.1), 1-o, 0.15 );
    fill(0,20);
    Galaxy[i].display();
  }
}



 

