
float max_speed = 2;
int fade_out = 5;

Ball ball1;
int balls_size = 36;
int balls_radius = balls_size/2;


void setup() {
  size(300, 300);
  background(0,0,0);
  stroke(255);
  smooth();
  frameRate(40);

  // only one ball for now
  ball1 = new Ball();
}


void draw() {
  // Apply a black transparent layer on the whole screen
  // to make previous strokes fade out smoothly.
  fill(0,fade_out);
  rect(0,0,width,height);
  
  // now we surimpress our moving ball
  ball1.draw();
}

class Ball {
  private PVector position, velocity;
  
  // Constructor.
  Ball() {
    position = new PVector( width/2, height/2 );
    velocity = new PVector( random(-1,1), random(-1,1));
  }
 
  // Check borders make sure the ball never get out of
  // our screen. Notice we use ball radius !
  private void check_borders() {
    if( position.x > (width-balls_radius) ) { 
      position.x = width-balls_radius; 
    } 
    if( position.y > (height-balls_radius) ) { 
      position.y = height-balls_radius; 
    } 
    if( position.x < balls_radius ) {
      position.x = balls_radius;
    }
    if( position.y < balls_radius ) {
      position.y= balls_radius; 
    }
  }
 
  // Change acceleration (acc) then update velocity
  // and position accordingly. Make sure we respect
  // the speed limit.
  private void move() {
    PVector acc;
    acc = new PVector( random(-1,1), random(-1,1) );
    acc.mult( max_speed);
    velocity.add( acc );
    position.add(velocity);
    velocity.limit(max_speed);
  }

  // Main entry point
  public void draw() {
    move();
    check_borders();
    noStroke();
    fill(255);
    ellipse( position.x, position.y, balls_size, balls_size );   
  }

}









