
float x1speed = 2.0;      //
float y1speed = 3.0;      // 'Speed' of shape vector 1,3
float x2speed = 3.0;      //
float y2speed = 2.0;      // 'Speed' of shape vector 2,4

float fRate   = 1000.0;   // framerate: frames/second
int   _size   = 150;      // length matje

float xmin, xmax, ymin, ymax;

int   currStroke = _size;
int   prevStroke = _size - 1;
int   currWipe = 2;
int   prevWipe = 1;

float [] x1 = new float [_size + 1];       // x-shape vector 1
float [] y1 = new float [_size + 1];       // y-shape vector 1
float [] x2 = new float [_size + 1];       // x-shape vector 2
float [] y2 = new float [_size + 1];       // y-shape vector 2

void setup() 
{
  size(900, 450); 
  background(#000000); 
  frameRate(fRate);

  fill(0);
  stroke(#4aed05);
  rect(0, 0, width - 1, height - 1);   // draw Bouncing Arena...

  smooth();                    // smooth() actually leaves Background Radiation of the Smoothing Process !!!

  xmin = 1;                    //
  xmax = width - 1;            // protect our border against Wiping...
  ymin = 1;                    //
  ymax = height - 1;           //

  // set up initial shape; shape x1,x2 upper left...

  x1[prevStroke] = xmin; 
  y1[prevStroke] = ymin;
  x2[prevStroke] = xmin; 
  y2[prevStroke] = ymin;

  x1[currStroke] = x1[prevStroke] + 10;
  y1[currStroke] = y1[prevStroke] + 10;
  x2[currStroke] = x2[prevStroke] + 10 + (xmax+xmin)/8;
  y2[currStroke] = y2[prevStroke] + 10;
}

void draw() 
{
  // what happens here? we seem to run four separate shape's now... in fact: we are mirroring one shape, negative...
  //
  // drawing starts at vector1 x,y[_size] and wiping is always 1 step 'ahead'... [_size] is drawn, 1 is wiped; 1 is drawn, 2 is wiped, ... _size-1 is drawn, etc; in fact we wipe the head of the tail...

  stroke(#4aed05);

  // Draw the shape's; but what do we draw? An empty array? No: we first draw vector x,y[_size-1,_size], zero to initial position...

  line(x1[prevStroke], y1[prevStroke], x1[currStroke], y1[currStroke]);   // upper left...
  line(x1[currStroke], y1[currStroke], x2[currStroke], y2[currStroke]);
  line(x2[currStroke], y2[currStroke], x2[prevStroke], y2[prevStroke]);

  line(xmax - x1[prevStroke], y1[prevStroke], xmax - x1[currStroke], y1[currStroke]);    // upper right
  line(xmax - x1[currStroke], y1[currStroke], xmax - x2[currStroke], y2[currStroke]);
  line(xmax - x2[currStroke], y2[currStroke], xmax - x2[prevStroke], y2[prevStroke]);

  line(x1[prevStroke], ymax - y1[prevStroke], x1[currStroke], ymax - y1[currStroke]);    // lower left
  line(x1[currStroke], ymax - y1[currStroke], x2[currStroke], ymax - y2[currStroke]);
  line(x2[currStroke], ymax - y2[currStroke], x2[prevStroke], ymax - y2[prevStroke]);

  line(xmax - x1[prevStroke], ymax - y1[prevStroke], xmax - x1[currStroke], ymax - y1[currStroke]);    // lower right
  line(xmax - x1[currStroke], ymax - y1[currStroke], xmax - x2[currStroke], ymax - y2[currStroke]);
  line(xmax - x2[currStroke], ymax - y2[currStroke], xmax - x2[prevStroke], ymax - y2[prevStroke]);

  stroke(#000000);

  // Eat the 'tail'... Eating starts at vector x,y[1,2], which is not yet in scope from the initial run... drawing is in the 'previous' element...

  line(x1[prevWipe], y1[prevWipe], x1[currWipe], y1[currWipe]);
  line(x1[currWipe], y1[currWipe], x2[currWipe], y2[currWipe]);
  line(x2[currWipe], y2[currWipe], x2[prevWipe], y2[prevWipe]);

  line(xmax - x1[prevWipe], y1[prevWipe], xmax - x1[currWipe], y1[currWipe]);
  line(xmax - x1[currWipe], y1[currWipe], xmax - x2[currWipe], y2[currWipe]);
  line(xmax - x2[currWipe], y2[currWipe], xmax - x2[prevWipe], y2[prevWipe]);

  line(x1[prevWipe], ymax - y1[prevWipe], x1[currWipe], ymax - y1[currWipe]);
  line(x1[currWipe], ymax - y1[currWipe], x2[currWipe], ymax - y2[currWipe]);
  line(x2[currWipe], ymax - y2[currWipe], x2[prevWipe], ymax - y2[prevWipe]);

  line(xmax - x1[prevWipe], ymax - y1[prevWipe], xmax - x1[currWipe], ymax - y1[currWipe]);
  line(xmax - x1[currWipe], ymax - y1[currWipe], xmax - x2[currWipe], ymax - y2[currWipe]);
  line(xmax - x2[currWipe], ymax - y2[currWipe], xmax - x2[prevWipe], ymax - y2[prevWipe]);

  // initialize next wipe vector, and 'push' wipe index to last draw index...

  prevWipe = currWipe;
  currWipe = currWipe + 1; 
  if (currWipe > _size) { 
    currWipe = 1;
  }

  // Test to see if the (next) shape-vector exceeds the screen; If so, reverse its direction; dangerous trick, here: for now the shapes are the same... Bearing the same speed...

  if (x1[currStroke] + x1speed > xmax - 1 || x1[currStroke] + x1speed < xmin + 1) { 
    x1speed *= -1;
  }
  if (y1[currStroke] + y1speed > ymax - 1 || y1[currStroke] + y1speed < ymin + 1) { 
    y1speed *= -1;
  }
  if (x2[currStroke] + x2speed > xmax - 1 || x2[currStroke] + x2speed < xmin + 1) { 
    x2speed *= -1;
  }
  if (y2[currStroke] + y2speed > ymax - 1 || y2[currStroke] + y2speed < ymin + 1) { 
    y2speed *= -1;
  }

  // initialize next draw vector, and 'push' index; in the first

  prevStroke = currStroke;
  currStroke = currStroke + 1;
  if (currStroke > _size) { 
    currStroke = 1;
  }

  // fill the next draw vector, and draw it in the next loop...

  x1[currStroke] = x1[prevStroke] + x1speed;
  y1[currStroke] = y1[prevStroke] + y1speed;
  x2[currStroke] = x2[prevStroke] + x2speed;
  y2[currStroke] = y2[prevStroke] + y2speed;
}


