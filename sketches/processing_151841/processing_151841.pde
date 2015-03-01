
// Declare an ArrayList to fill with SpinningTop objects
ArrayList <SpinningTop> tops;

// Declare how many spinning tops will be used
int numberOfSpinningTops = 3;

// Declare palette array
color[] palette = {
  #BD1550, #E97F02, #F8CA00, #8A9B0F, #FCD77E, #E67747, #7D3D75, #8B6D9C, #B0B749, #BCBCBA
};



void setup() {

  // set display windows size and background colour
  size(800, 600);
  background( 0, 0, 0 );
  
  // limit number of spinning tops if greater than number of colours in palette
  if (numberOfSpinningTops > palette.length) {
    numberOfSpinningTops = palette.length;
  }
  
  // Create an empty ArrayList
  tops = new ArrayList<SpinningTop>();
  
  // Create values for ArrayList elements
  for (int i=0; i < numberOfSpinningTops; i++) {
    float x_position  = random( 100, width-100 );  // set starting x-coordinate to a random point on the screen
    float y_position  = random( 100, height-100 ); // set starting y-coordinate to a random point on the screen
    float x_direction = random( -1, 1 );           // set starting x-direction to a random value
    float y_direction = random( -1, 1 );           // set starting y-direction to a random value
    float rad_offset  = random( 200 );             // set moving hand radian offset to a random value
    color colour      = palette[i];                // select colour from pre-selected palette
    float alpha       = random( 5, 32 );              // set spinning top transparency to random value <64
    // Add one element to ArrayList
    tops.add(new SpinningTop( x_position, y_position, x_direction, y_direction, rad_offset, colour, alpha ) );
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
  float x, y, dx, dy, ro, al;
  color c;

  // define how variables are initially set
  SpinningTop ( float x_position, float y_position, float x_direction, float y_direction, float rad_offset, color colour, float alpha )
  {
    x  = x_position;
    y  = y_position;
    dx = x_direction;
    dy = y_direction;
    ro = rad_offset;
    c  = colour;
    al = alpha;
  } // end of definition

  void MoveTop() {
    // calculate radius for moving hand based upon rad_offset added to frameCount 
    float rad = radians( frameCount + ro );

    // calculate new position
    this.x += this.dx;
    this.y += this.dy;

    // set up minimum and maximum values for new random direction and velocity
    float max = 1;
    float min = 0.5;

    //When the shape hits the left or right edge of the window, it reverses its direction and changes velocity
    if (this.x > width-100 || this.x < 100) {
      this.dx = this.dx > 0 ? -random(min, max) : random(min, max);
    } // end if(x)

    //When the shape hits the top or bottom edge of the window, it reverses its direction and changes velocity
    if (this.y > height-100 || this.y < 100) {
      this.dy = this.dy > 0 ? -random(min, max) : random(min, max);
    } // end if(y)

    float bx = this.x + 100 * sin(rad);
    float by = this.y + 100 * cos(rad);

    float radius = 100 * sin(rad*0.1);
    float handX = bx + radius * sin(rad*3);
    float handY = by + radius * cos(rad*3);

    // draw line    
    stroke(this.c, this.al);

    // calculations for a scale model of line coordinates
    float HALF_WIDTH      = width/2;
    float HALF_HEIGHT     = height/2;
    float scale           = 2; //
    float scaled_bx       = bx / scale;
    float scaled_by       = by / scale;
    float scaled_handX    = handX / scale;
    float scaled_handY    = handY / scale;
    // if scale is 2 (i.e 1/2 of the original) then x offset equals 1/4 (i.e. 1/2 /2) from middle of screen
    float scaled_x_offset = HALF_WIDTH - (width/(scale*2)); 
    // if scale is 2 (i.e 1/2 of the original) then y offset equals 1/4 (i.e. 1/2 /2) from middle of screen
    float scaled_y_offset = HALF_HEIGHT - (height/(scale*2));

    // original line() command
    line(bx, by, handX, handY);
    // scaled down and centred version of the original command
    line(scaled_x_offset+scaled_bx, scaled_y_offset+scaled_by, scaled_x_offset+scaled_handX, scaled_y_offset+scaled_handY);

    // draw a line between bx,by and the scaled down centred versions
    line(bx, by, scaled_x_offset+scaled_bx, scaled_y_offset+scaled_by);
    // draw a line between handX,handY and the scaled down centred versions
    line(handX, handY, scaled_x_offset+scaled_handX, scaled_y_offset+scaled_handY);

  } // end MoveTop()

} // end of class SpinningTop
