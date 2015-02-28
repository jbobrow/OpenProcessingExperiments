
Ball[] balls;
int numBalls = 200;

void setup(){
  size( 400, 400 );
  balls = new Ball[ numBalls ];
  for ( int i=0; i<numBalls; i++ ){
    balls[i] = new Ball( random(width), random(height), random(1,10) );
  }
}

void draw(){
  background( 255 );
  for ( int i=0; i<numBalls; i++ ){
    if ( i==0 ){
      fill( 255, 0, 0 );
    }
    else{
      fill( 255 );
    }
    balls[i].update();
    balls[i].render();
  }
  println( balls[0].x + ", " + balls[0].y );
}
class Ball{
  float x;
  float y;
  float vx;
  float vy;
  float r;
  
  Ball( float _x, float _y, float _r ){
    x = _x;
    y = _y;
    vx = random( 5 );
    vy = random( 5 );
    r = _r;
  }
  
  void update(){
    x += vx;
    y += vy;
    
    vy += 0.1;
    //vx *= 0.99;
    //vy *= 0.99;
    
    if ( x < 0 || x > width ){
      vx *= -1;
      if ( x<0 ) x = 0;
      else if ( x>width ) x = width;
    }
    if ( y < 0 || y > height ){
      vy *= -1;
      if ( y<0 ) y = 0;
      else if ( y>height ) y = height;
    }
    
  }
  
  void render(){
    stroke(0);
    ellipse( x, y, r, r );
  }
}


