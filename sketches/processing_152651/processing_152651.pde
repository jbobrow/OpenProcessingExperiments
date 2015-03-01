
/* @pjs preload="000.jpg, 001.jpg, 002.jpg, 003.jpg, 004.jpg, 005.jpg, 006.jpg, 007.jpg, 008.jpg, 009.jpg"; 
 */

// Declare an ArrayList to fill with SpinningTop objects
ArrayList <SpinningTop> tops;

// Declare how many spinning tops will be used
int numberOfSpinningTops = 500;

PImage myImg;
boolean bg = false;
boolean paint = false;
String toggle="OFF";


void setup() {
  size(800, 600);
  colorMode( HSB );
  myImg = loadImage("000.jpg");
  noStroke();
  background(255);


  // Create an empty ArrayList
  tops = new ArrayList<SpinningTop>();

  // Create values for ArrayList elements
  for (int i=0; i < numberOfSpinningTops; i++) {
    // Add one element to ArrayList
    tops.add(new SpinningTop(i));
  } // end for(i)
} // end setup()



void draw() {
  if (!paint) { 
    background(255);
  }
  if (bg) {
    image(myImg, 0, 0);
  }
  // draw all spinning tops
  for (int i=0; i < tops.size (); i++) {
    tops.get(i).MoveTop();
  } // end for(i)

  // on screen display
  fill(0, 128);
  rect ( 0, 0, 170, 85);
  fill(255);
  if (bg) { 
    toggle="OFF";
  } else { 
    toggle="ON";
  }
  text("'b' turns background "+toggle, 5, 15);
  if (paint) { 
    toggle="OFF";
  } else { 
    toggle="ON";
  }
  text("'p' toggles painting mode "+toggle, 5, 30);
  text("'UP' increases circle size", 5, 45);
  text("'DOWN' decreases circle size", 5, 60);
  text("'0-9' selects different images", 5, 75);

} // end draw()



class SpinningTop {

  // declare variables used in this object
  int  index;
  float x, y, dx, dy, ro, s;
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
    s  = random(2, 10);                           // set circle size
  } // end of definition

  void MoveTop() {
    // called by draw() this method calls other methods required to move the spinning tops
    MoveHand();
    TestBoundary();
    DrawShapes();
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
    // calculate new positions
    this.x += this.dx;
    this.y += this.dy;
    float rad = radians( frameCount + this.ro );
    this.bx = this.x + 100 * sin(rad);
    this.by = this.y + 100 * cos(rad);
    float radius = 100 * sin(rad*0.1);
    this.handX = bx + radius * sin(rad*2);
    this.handY = by + radius * cos(rad*2);
  } // end CalculateHane()


  void DrawShapes() {
    // get color and draw shape for bx,by
    color c = myImg.get((int)this.bx, (int)this.by);
    fill( c, 32 );
    ellipse( this.bx, this.by, this.s, this.s );
    // get color and draw shape for bx,by
    c = myImg.get((int)this.handX, (int)this.handY);
    fill( c, 32 );
    ellipse( this.handX, this.handY, this.s, this.s );
  } // end DrawShapes()
} // end of class SpinningTop



void keyPressed() {

  switch(key) {
  case '1':
    myImg = loadImage("001.jpg");
    break;
  case '2':
    myImg = loadImage("002.jpg");
    break;
  case '3':
    myImg = loadImage("003.jpg");
    break;
  case '4':
    myImg = loadImage("004.jpg");
    break;
  case '5':
    myImg = loadImage("005.jpg");
    break;
  case '6':
    myImg = loadImage("006.jpg");
    break;
  case '7':
    myImg = loadImage("007.jpg");
    break;
  case '8':
    myImg = loadImage("008.jpg");
    break;
  case '9':
    myImg = loadImage("009.jpg");
    break;
  case '0':
    myImg = loadImage("000.jpg");
    break;
  // toggle background image
  case 'b':
    if (bg) {
      bg = false;
    } else {
      bg = true;
    } // end if(bg)
break;
  // toggle painting mode
  case 'p':
  if (paint) {
      paint = false;
    } else {
      paint = true;
      bg = false;
      background(255);
    } // end if(bg)
break;
  }

    if (key == CODED ) {
      // increase circle size
      if (keyCode == UP) {
        for (int i=0; i < tops.size (); i++) {
          tops.get(i).s++;
          if (tops.get(i).s > 100) {
            tops.get(i).s = 2;
          } // end if(tops)
        } // end for(i)
      } // end UP

      // decrease circle size
      if (keyCode == DOWN) {
        for (int i=0; i < tops.size (); i++) {
          tops.get(i).s--;
          if (tops.get(i).s <2) {
            tops.get(i).s = 100;
          } // end if(tops)
        } // end for(i)
      } // edn DOWN
    } // end if key(CODED)
  } // end keyPressed()



