
// Declare an ArrayList to fill with SpinningTop objects
ArrayList <SpinningTop> tops;

// Declare how many spinning tops will be used
int numberOfSpinningTops = 10;

// Declare palette array
color[] palette = {
  #BD1550, #E97F02, #F8CA00, #8A9B0F, #FCD77E, #E67747, #7D3D75, #8B6D9C, #B0B749, #BCBCBA
};



void setup() {

  // set display windows size and background colour and turn off fill()
  size(800, 600);
  background( 0, 0, 0 );
  noFill();

  // limit number of spinning tops if greater than number of colours in palette
  if (numberOfSpinningTops > palette.length) {
    numberOfSpinningTops = palette.length;
  }

  // Create an empty ArrayList
  tops = new ArrayList<SpinningTop>();

  // Create values for ArrayList elements
  for (int i=0; i < numberOfSpinningTops; i++) {
    // Add one element to ArrayList
    tops.add(new SpinningTop(i));
  } // end for(i)

} // end setup()



void draw() {

  // draw all spinning tops
  for (int i=0; i < tops.size (); i++) {
    tops.get(i).MoveTop();
  } // end for(i)

} // end draw()



class SpinningTop {

  // declare variables used in this object
  int  index;
  float x, y, dx, dy, ro, al;
  color c;
  float bx, by, handX, handY;
  float HALF_WIDTH  = width/2;
  float HALF_HEIGHT = height/2;

  // set inital variables for an element
  SpinningTop ( int index ) {
    this.index=index;
    x  = random( 100, width - 100 );  // set starting x-coordinate to a random point on the screen
    y  = random( 100, height - 100 ); // set starting y-coordinate to a random point on the screen
    dx = random( -1, 1 );             // set starting x-direction to a random value
    dy = random( -1, 1 );             // set starting y-direction to a random value
    ro = random( 200 );               // set moving hand radian offset to a random value
    c  = palette[ index ];            // select colour from pre-selected palette
    al = random( 5, 16 );             // set spinning top transparency to random value <64
  } // end of definition

  void MoveTop() {

    // called by draw() this method calls other methods required to move the spinning tops
    MoveHand();
    TestBoundary();
    TestCollision();

  } // end MoveTop()


  void TestBoundary() {

    // set up minimum and maximum values for new random direction and velocity
    float max = 1;
    float min = 0.5;

    //When the shape hits the left or right edge of the window, it reverses its direction and changes velocity
    if ( this.x > width - 100 || this.x < 100 ) {
      this.dx = this.dx > 0 ? - random(min, max) : random(min, max);
    } // end if(x)

    //When the shape hits the top or bottom edge of the window, it reverses its direction and changes velocity
    if ( this.y > height - 100 || this.y < 100 ) {
      this.dy = this.dy > 0 ? -random(min, max) : random(min, max);
    } // end if(y)

  }// end TestBoundary()


  void MoveHand() {

    // calculate new position
    this.x += this.dx;
    this.y += this.dy;

    // calculate radius for moving hand based upon rad_offset added to frameCount 
    float rad = radians( frameCount + this.ro );
    this.bx = this.x + 100 * sin(rad);
    this.by = this.y + 100 * cos(rad);

    float radius = 100 * sin(rad*0.1);
    this.handX = bx + radius * sin(rad*2);
    this.handY = by + radius * cos(rad*2);

  } // end CalculateHane()


  void TestCollision() {

    // iterate through all spinning tops
    for (int i=0; i < tops.size (); i++) {

      // if spinning top 'i' is not the current spinning top being checked
      if ( i != this.index ) {

        // if the current element is within 100 pixels of the tested element then draw the shapes
        if ( dist(this.bx, this.by, tops.get(i).bx, tops.get(i).by) < 100 ) {
          DrawShapes();
        } // end if(dist)

      } //end if( i != index )

    } // end for(i)

  } // end TestCollision()


  void DrawShapes() {

    // set colour for this line
    stroke( this.c, this.al );

    // draw this line
    line( this.bx, this.by, this.handX, this.handY );

    // calculations for a scale model of line coordinates
    float scale        = 2; //
    float scaled_bx    = this.bx / scale;
    float scaled_by    = this.by / scale;
    float scaled_handX = this.handX / scale;
    float scaled_handY = this.handY / scale;

    // if scale is 2 (i.e 1/2 of the original) then x offset equals 1/4 (i.e. 1/2 /2) from middle of screen
    float scaled_x_offset = HALF_WIDTH - ( width /(scale*2) ); 

    // if scale is 2 (i.e 1/2 of the original) then y offset equals 1/4 (i.e. 1/2 /2) from middle of screen
    float scaled_y_offset = HALF_HEIGHT - ( height / (scale*2) );

    // set colour for this scaled down line
    stroke( this.c, this.al );

    // scaled down and centred version of the original command
    line( scaled_x_offset + scaled_bx, scaled_y_offset + scaled_by, scaled_x_offset + scaled_handX, scaled_y_offset + scaled_handY );

    // set colour with alpha/2 for the joining lines
    stroke( this.c, this.al/2 );

    // draw a line between bx,by and the scaled down centred versions
    line( this.bx, this.by, scaled_x_offset + scaled_bx, scaled_y_offset + scaled_by);

    // draw a line between handX,handY and the scaled down centred versions
    line( this.handX, this.handY, scaled_x_offset + scaled_handX, scaled_y_offset + scaled_handY);

  } // end DrawShapes()

} // end of class SpinningTop

