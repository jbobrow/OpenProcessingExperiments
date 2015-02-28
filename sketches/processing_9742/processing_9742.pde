
// alpha level (0-255) 
int fade_out  = 37;

// top speed : px / frame 
int max_speed = 5;

// balls diameter : px 
int balls_size   = 16;
// how many balls will be added:
int balls_number =  20;

// precompute radius
int balls_radius = floor(balls_size / 2);

// Array of balls
Ball[] balls = new Ball[balls_number];



void setup() {
  // Create a black window, antialiasing and 60fps
  size(300,300);
  background(0,0,0);
  smooth();
  frameRate(60);

  // instantiate several balls
  for(int i=0;i<balls_number;i++) {
    balls[i] = new Ball();
    // Assign different color in sequence
    balls[i].set_hue( 360 * i/balls_number );
  }
}



void draw() {
  // Apply a black transparent layer on the whole screen
  // to make previous strokes fade out smoothly.
  stroke(0);  
  fill(0,fade_out);
  rect(0,0,width,height);

  // now we surimpress our moving balls
  for(int i=0;i<balls_number;i++) {
    balls[i].run();
  }
}



class Ball {
  PVector position, velocity, acc;
  int ball_color;

  // Constructor.
  Ball() {
    // random positioning
    float rndX = random(balls_size, width - balls_size);
    float rndY = random(balls_size, height - balls_size);
    position = new PVector( rndX, rndY );

    // almost random direction :
    velocity = new PVector( random(-1,1), random(-1,1) );

    // acceleration initialy points to the same destination
    acc = new PVector(0,0);
    acc.add(velocity);
    acc.normalize();
    acc.mult(0.005);

    // Pick a color
    set_hue( random(0,360) );
  }

  // Set ball hue. h is modulo 360
  public void set_hue( float h) {
    colorMode(HSB, 360);
    ball_color = color( h, 360, 360);
    colorMode(RGB,255);   
  }

  // Check borders make sure the ball never get out of
  // the screen. We just mirror the acc and velocity
  // Notice we use ball radius !
  // FIXME : sometimes they get stuck on borders :(
  private void bounce() {

    // left and right borders
    if(  position.x > (width - balls_radius)
      || position.x < balls_radius
      ) {
      velocity.x = - velocity.x;
      acc.x = -acc.x;
    }

    // bottom and top borders
    if( position.y > (height - balls_radius)
     || position.y < balls_radius
     ) {
      velocity.y = - velocity.y;
      acc.y = -acc.y;
    }
  }

  // Change acceleration (acc) then update velocity
  // and position accordingly. Make sure we respect
  // the speed limit.
  private void move() {

    acc = new PVector( 0.5 - noise(position.x/30), 0.5 - noise(position.y/30) );
    acc.normalize();
    acc.mult(0.05);

    // update velocity
    velocity.add( acc );
    velocity.limit(max_speed);
    
    // finally the new position depends on the velocity =)
    position.add(velocity);  
  }


  // Used to actually draw the ball
  private void draw() {
    stroke(ball_color);
    strokeWeight( balls_size );
    point( position.x, position.y );
    strokeWeight( 1 );    
  }

  // Main entry point
  public void run() {
    move();
    bounce();
    draw();

    //debug();  
  }




  // TODO print to buffer ;)
  public void debug() {
    int l = 12;
    int m =  2;

    noStroke();
    fill(128); 
    rect(0,0,width, m+ 3 * l );
    fill(255);
    text("pos: x,y (" + round(position.x) + "," + round(position.y) + ")" , m, 1*l );
    text("vel: x,y (" + round(velocity.x) + "," + round(velocity.y) + ") -> " + velocity.mag() , m, 2*l );
    text("acc: x,y (" + round(acc.x) + "," + round(acc.y) + ") -> " + acc.mag() , m, 3*l );

    // draw acc
    stroke(255);
    line(position.x, position.y, position.x + 10*acc.x, position.y + 10*acc.y);
  }
}






