
/*------------------------------------------------------------
Based on code from these books:
Processing: Creative Coding and Generative Art in Processing 2
by Ira Greenberg, Dianna Xu, and Deepak Kumar;
The Nature of Code by Daniel Shiffman
------------------------------------------------------------*/
// Sketch 6-3: balls in a box

// Need to make a 2D array for a grid
box[][] boxGrid;
int cols = 6;
int rows = 4;
int boxW = 120;
int boxH = 120;

Walker w;
ArrayList<Particle> particles;

void setup() {
  size(720, 480);
//  frameRate(30);
  background(0, 100, 150);
  smooth();
  boxGrid = new box[cols][rows];
  for(int i=0; i<cols; i++) {
    for(int j=0; j<rows; j++) {
      // Create a grid of boxes with 50 balls in each box
      boxGrid[i][j] = new box(i*boxW, j*boxH, boxW, boxH, 50);
    }
  } 
 // Create a walker object
  w = new Walker();
  particles = new ArrayList<Particle>();
} // setup()

void draw() {
  // display the balls
  for(int i=0; i < cols; i++) {
    for(int j=0; j < rows; j++) {
      boxGrid[i][j].update();
      boxGrid[i][j].display();
    }
  }

  // Run the walker object
  w.step();
  w.render();
  
  // particles display once it's got there!
  if((w.x > 620) && (w.y < 100)) {
    particles.add(new Particle(new PVector(w.x, w.y)));
  }
  
  // Looping through backwards to delete particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
} // draw()


// Simple Particle System

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-4, 0), random(-1, 3));
    location = l.get();
    lifespan = 200.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(random(180, 255), random(50), random(50), lifespan);
    triangle(location.x + random(-5,5), location.y + random(5), 
              location.x + random(10), location.y - random(5,20), 
              location.x + random(10,30), location.y + random(10));
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


// A random walker object

class Walker {
  int x,y;

  Walker() {
    x = 10;
    y = height-10;
  }

  void render() {
    stroke(200,20,20);
    strokeWeight(20);
    point(x,y);
  }

  // Randomly move up, down, left, right, or stay in one place
 void step() {
    
    float r = random(1);
    // 30% chance of moving to the right!
    if (r < 0.3) {    
      x+=4;
    } else if (r < 0.5) {
      x-=4;
    } else if (r < 0.8) {
      y-=4;
    } else {
      y+=4;
    }
  
    x = constrain(x,0,width-45);
    y = constrain(y,45,height-1);
  }
}
/*------------------------------------------------------------
Sketch 6-3: balls in a box
------------------------------------------------------------*/

class ball {    // Define the ball class
  // Attributes
  PVector location;  // ball's location
  color ballColor;     // its color
  float radius;          // its radius in pixels
  PVector speed;    // dx and dy
  box b;                    // ball is inside Box, b

  ball(box b) {    // Default Constructor
    this(random(width), random(height), 25, color(255, 0, 0), b);
  } // end ball() default constructor
  
  ball(float x, float y, float r, color c, box _b ) {
    location = new PVector(x, y); // set up ball with position (x, y), radius r, color c
    radius = r;        // radius, r pixels
    ballColor = c;  // color, c
    // speed at which the ball travels
    speed = new PVector(random(0.5,2), random(0.5,2));
    // Its enclosing box
    b = _b;
  } // end ball() constructor
  
  // Behaviors...
  
  void display() {
    // display the ball
    // set color attributes
    noStroke();
    fill(ballColor);
    // draw the ball
    ellipse(location.x, location.y, 2*radius, 2*radius);
  } // end display()

void move() {
    location.add(speed);
    bounce();
  } // end move()
  
  // bounce - my fuzzy version
  void bounce() {
    if (location.x > (b.w)) { // bounce against the right fuzzy edge
      location.x = b.h;
      speed.x = -speed.x;
    }
    if (location.x < 0) { // bounce against the left fuzzy edge
      location.x = 0;
      speed.x = -speed.x;
    }
    if (location.y > (b.h)) { // bounce against the bottm fuzzy edge
      location.y = b.h;
      speed.y = -speed.y;
    }
    if (location.y < 0) { // bounce against the top fuzzy edge
      location.y = 0;
      speed.y = -speed.y;
    }
  } // end bounce()

} // class ball

/*------------------------------------------------------------
Sketch 6-3: balls in a box
------------------------------------------------------------*/

class box {  
  float x, y, w, h;  // top left corner (x, y), width (w), height (h)
  int nBalls;        // # of balls in the box
  int ballRadius = 2;
  ball [] balls;  // place to store all the balls in this box
  color ballCol;

// Constructor
  box(float x, float y, float w, float h, int n) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.nBalls = n;    
    // Create balls...
    balls = new ball[nBalls];
    for (int i=0; i < balls.length; i++) {
      ranColBall();
      balls[i] = new ball(random(w), random(h), ballRadius*random(4), ballCol, this);
//      balls[i] = new ball(w/2, h/2, ballRadius*random(4), ballCol, this);
    }
  } // end box() constructor
  
    void display() {
      // draw box
      pushMatrix();
      translate(x, y);
      noStroke();
      fill(115,200,255, 40);
      rect(0, 0, w, h);     
      // draw balls
     for (int i=0; i < balls.length; i++) {
        balls[i].display();
      }
      popMatrix();
    } // end display()
    
    void update() {
      // move each ball...
      for (int i=0; i < balls.length; i++) {
        balls[i].move();
      }
    } // end update
    
    color ranColBall() {
      ballCol = color(random(50),random(100, 200),random(100, 255)); // random blues & greens
      return ballCol;
    }
} // end class box



