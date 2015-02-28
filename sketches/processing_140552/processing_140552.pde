
void drawThing(float myX, float myY, float myXdir, float myYdir) {

  // TODO: reimplement this function. Only change code within this
  // code block. Inside this function, the only variables you
  // should use are the four parameters of the function.

  // Draw a more complicated shape here using myX and myY and see what
  // happens. Using if statement(s), change the way your thing is
  // drawn based on which direction it is moving. For example:
  // if ( myXdir > 0 && myYdir > 0 ) {
  //   // draw something
  // }
  // etc ...

  rect(myX,myY,15,15);
  rect(myY,myX,5,5);
 

}

//////////
// you should not need to change anything below this line ...
//////////

int numPoints = 8000;

float[] x;
float[] y;

float[] xDirection;
float[] yDirection;

int last_add_time = 1000;

int index = 0;

void setup() {

  size(600,600);
  x = new float[numPoints];
  y = new float[numPoints];  

  xDirection = new float[numPoints];
  yDirection = new float[numPoints];  

  int i = 0; 
  while ( i < numPoints ) {
    xDirection[i] = random(-1,1);
    yDirection[i] = random(-1,1);

    i = i + 1;
  }
}

void draw() {

  background(253,180,98);
  noStroke ();
  fill(247,67,112);
  
  if ( millis() > last_add_time ) {
    x[index] = random(0,width);
    y[index] = random(0,height);
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
    last_add_time = millis() + 1000;
  }

  // use a while loop here to draw the points
  // and update their positions
  int i = 1; 
  while ( i < index ) {
    drawThing( x[i], y[i], xDirection[i], yDirection[i] );

    x[i] = x[i] + xDirection[i];
    y[i] = y[i] + yDirection[i];
    
    if ( x[i] > width || x[i] < 0 ) {
      xDirection[i] = xDirection[i] * -1;
    }
    if ( y[i] > height || y[i] < 0 ) {
      yDirection[i] = yDirection[i] * -1;
    }
    
    i = i + 1;
  }
}


