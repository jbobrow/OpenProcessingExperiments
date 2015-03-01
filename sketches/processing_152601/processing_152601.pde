
// Declare and ArrayList with the intention to fill with Form1 objects
ArrayList <Form1> circle;

// Declare how many Form1's will be used
int numberOfCircles = 15;


void setup() {
  size( 800, 800 );
  background( 255 );
  noFill();

  // create an empty ArrayList
  circle = new ArrayList<Form1>();

  // populate ArrayList variables
  for (int i=0; i<numberOfCircles; i++) {
    circle.add(new Form1(i));
  } // end for(i)
} // end of setup()



void draw() {
  //background( 255);
  for (int i=0; i<numberOfCircles; i++) {
    //circle.get(i).DrawCircle();
    circle.get(i).ImplementBehaviour();
    circle.get(i).ImplementProcess0();
  } // end for(i)
} // end of draw()



class Form1 {
  // declare variables used in this object
  int index, diameter;
  float x, y, dx, dy, transparency;

  // define how variables are initially set
  Form1 ( int index ) {
    this.index   = index;
    diameter     = 200;
    x            = random( width );
    y            = random( height );
    dx           = random( -1, 1 );
    dy           = random( -1, 1 );
    transparency = 64;
    // make sure dx and dy are not zero
    if (dx==0) { 
      dx = random( 0.3, 1 );
    }
    if (dy==0) { 
      dy = random( 0.3, 1 );
    }
  } //end of definition


  // ImplementBehaviour() function
  // form 1 = circle
  // behaviour 1 = move in a straight line
  // behaviour 2 = constarin to surface
  void ImplementBehaviour() {
    Behaviour1();
    Behaviour2();
  } // end ImplementBehaviour()


  // Behaviour1 function - move in a straight line
  void Behaviour1() {
    // update circle position
    this.x += this.dx;
    this.y += this.dy;
  } // end Behaviour1()


  // Behaviour2 function - constrain to surface
  void Behaviour2() {
    // check boundary limits and change direction if necessary
    if (this.x < 0 || this.x > width ) { 
      dx = -dx;
    }
    if (this.y < 0 || this.y > height ) { 
      dy = -dy;
    }
  } // end Behaviour2()


  // draw circle
  void DrawCircle() {
    stroke( 0, 64 );
    ellipse(this.x, this.y, this.diameter, this.diameter);
  } // end DrawCircle()


  // ImplementProcess0() function
  // if two elements intersect then draw a line connecting centres
  // colouring the line based on the circle being odd or even
  void ImplementProcess0() {
    for (int i=0; i<numberOfCircles; i++ ) {
      // do not check circle intersection against itself
      if (i != this.index) {
        float proximity = dist(this.x, this.y, circle.get(i).x, circle.get(i).y);
        // set transparency based upon the proximity of the circles to one another
        this.transparency = map(this.diameter-proximity, 0, this.diameter, 0, 5);
        // check for collision
        if ( proximity < this.diameter ) {
          // colour line based on whether circle index is odd or even
          if (this.index%2 == 0) { 
            stroke( 0, 255, 0, this.transparency ); // green
          } else { 
            stroke( 0, 0, 255, this.transparency ); // blue
          } // end if(index)
          line( this.x, this.y, circle.get(i).x, circle.get(i).y );
        } // end if(dist)
      } // end if(i)
    } // end for(i)
  } // end ImplementProcess0()
} // end of class Form1

