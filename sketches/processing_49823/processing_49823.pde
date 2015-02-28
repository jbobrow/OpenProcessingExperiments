
int curTime;
int prevTime;
float deltaTime;

PVector curMouseVel;
PVector prevMouseVel;

PVector bubbleAccel;
ArrayList bubbleList;

PImage bgGradient;


class Bubble {
  PVector pos;
  PVector vel;
  float size;
  float wobble;
  float wobbleSpeed;
  float timeAccum;
  boolean popped;
  
  Bubble( PVector position, PVector velocity, float bubbleSize ) {
    pos = position;
    vel = velocity;
    size = bubbleSize;
    wobble = random( size / 16, size / 4 );
    wobbleSpeed = random( 10 );
    timeAccum = 0;
    popped = false;
  }
  
  void Update() {
    timeAccum += deltaTime;
    
    vel.add( PVector.div( bubbleAccel, size/2 ) );
    pos.add( vel );
    
    if( pos.x < size/2 + wobble ) {
      pos.x = size/2 + wobble;
      vel.x *= -0.1;
    }
    
    if( pos.x > width - size/2 - wobble ) {
      pos.x = width - size/2 - wobble;
      vel.x *= -0.1;
    }
    
    if( pos.y > height - size/2 - wobble ) {
      pos.y = height - size/2 - wobble;
      vel.y *= -0.1;
    }
    
    if( pos.y < -( size + wobble ) )
      popped = true;
  }
  
  void Render() {
    fill( 255, 63 );
    ellipse( pos.x, pos.y, size + (sin(wobbleSpeed*timeAccum)*wobble), size + (cos(wobbleSpeed*timeAccum)*wobble) );
    fill( 255, 191 );
    ellipse( pos.x + (size/4), pos.y - (size/4), ( size + (sin(wobbleSpeed*timeAccum)*wobble) )/4, ( size + (cos(wobbleSpeed*timeAccum)*wobble) )/4 );
  }
}

void setup() {
  size( 400, 600 );
  smooth();
  noStroke();
  
  curTime = 0;
  prevTime = 0;
  deltaTime = 0;
  
  curMouseVel = new PVector( 0, 0 );
  prevMouseVel = new PVector( 0, 0 );
  
  bubbleAccel = new PVector( 0, -1 );
  bubbleList = new ArrayList();
  
  bgGradient = loadImage( "gradient.png" );
  bgGradient.resize( width, height );
  bgGradient.filter( BLUR, 16 );
}

void draw() {
  Update();
  Render();
}

void Update() {
  prevTime = curTime;
  curTime = millis();
  deltaTime = ( curTime - prevTime ) / 1000.0f;
  
  prevMouseVel = curMouseVel;
  curMouseVel = new PVector( mouseX - pmouseX, mouseY - pmouseY );
  
  PVector mouseAccel = PVector.mult( PVector.sub( prevMouseVel, curMouseVel ), deltaTime );
  
  for( int i = 0; i < (int)(mouseAccel.mag()*2); i++ ) {
     bubbleList.add( new Bubble( new PVector( random(width), random(height) ), new PVector( -mouseAccel.x*2, -mouseAccel.y*2 ), random( 8, 48 ) ) );
  }
  
  if( mousePressed )
    bubbleList.add( new Bubble( new PVector( random(width), random(height) ), new PVector( 0, 0 ), random( 8, 48 ) ) );
  
  for( int i = 0; i < bubbleList.size(); i++ ) {
    Bubble bubble = (Bubble)bubbleList.get( i );
    bubble.Update();
    if( bubble.popped ) {
      bubbleList.remove( i );
      i--;
    }
  }
}

void Render() {
  background( bgGradient );
  
  for( int i = 0; i < bubbleList.size(); i++ ) {
    ( (Bubble)bubbleList.get( i ) ).Render();
  }
}






