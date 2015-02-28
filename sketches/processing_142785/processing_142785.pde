
int c1; //red
int c2; //green
int c3; //blue

void drawThing(float myX, float myY, float myXdir, float myYdir) {

  ellipse(myX-50, myY, 30, 30);
  ellipse(myX, myY+50, 30, 30);
  ellipse(myX+50, myY, 30, 30);
  ellipse(myX, myY-50, 30, 30);
}

//////////
// you should not need to change anything below this line ...
//////////

int numPoints = 5000;

float[] x;
float[] y;

float[] xDirection;
float[] yDirection;

int last_add_time = 3000;

int index = 0;

void setup() {

  size(800, 800);
  background(255);
  x = new float[numPoints];
  y = new float[numPoints];  

  xDirection = new float[numPoints];
  yDirection = new float[numPoints];  

  int i = 0; 
  while ( i < numPoints ) {
    xDirection[i] = random(-1, 1);
    yDirection[i] = random(-1, 1);

    i = i + 1;
  }
}

void draw() {
  c1 = int(random(0, 255)); //red
  c2 = int(random(0, 255)); //green
  c3 = int(random(0, 255)); //blue

  stroke(0);
  strokeWeight(0.1);
  fill(c1, c2, c3);

  if ( millis() > last_add_time ) {
    x[index] = random(0, width);
    y[index] = random(0, height);
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
    last_add_time = millis() + 3000;
  }

  // use a while loop here to draw the points
  // and update their positions
  int i = 0; 
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



