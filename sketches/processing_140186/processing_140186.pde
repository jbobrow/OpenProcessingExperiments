
void drawThing(float myX, float myY, float myXdir, float myYdir) {

  if ( myXdir > 0 && myYdir > 0 ) {

    fill( random(0, 80), random(0, 150) );
    rect(random(0, 600), random(0, 600), 20, 20);
  }

  if ( myXdir < 0 && myYdir < 0 ) {

    fill( random(150, 255) );
    ellipse(400, 400, 10, 10);
  }

  if ( mousePressed) {
    stroke(255, 30);

    for (int y = 0; y <= height; y += 70) {
      for (int x = 0; x <= width; x += 70) {
        line(x, y, width/2, height/2);
      }
    }
  }

  if ( myY < 300) {
    fill (#8CE8C1, 50);
    rect(0, 300, 600, 300);
  } 
  else {
    fill( 0, 50);
    rect(0, 0, 600, 300);
  }

  if ( myX < 0) {
    fill(130, 100);
    rect(0, 300, 600, 300);
  } 
  else {
    fill(130, 150);
    rect(0, 0, 600, 300);
  }

  noStroke();
  ellipse(myX, myY, 10, 10);
}

//////////
// you should not need to change anything below this line ...
//////////

int numPoints = 5000;

float[] x;
float[] y;

float[] xDirection;
float[] yDirection;

int last_add_time = 2000;

int index = 0;

void setup() {

  size(600, 600);
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

  background(130);
  fill( random(130, 200), random(0, 40), random( 30, 130)); 

  if ( millis() > last_add_time ) {
    x[index] = random(0, width);
    y[index] = random(0, height);
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
    last_add_time = millis() + 2000;
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



