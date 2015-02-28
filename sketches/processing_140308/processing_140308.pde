

float j = 10; 
float k = 50;

void drawThing(float myX, float myY, float myXdir, float myYdir) {
  float a = 50;
  float b = 50;
  if ( keyPressed ) {
  }

  noStroke();
  fill(random (0, 255), random (0, 100));
  ellipse (myX, myY, random(10, 100), random(10, 300));

  if (myXdir > 0 && myYdir >0) {
    fill(0, 0, random(0, 255));
  }
  else if (myXdir <= 0 && myYdir <= 0) {
    fill(random(0, 255), 0, 0);
  }

  if (myXdir > 0 && myYdir >0) {
    ellipse(myX*5, myY, j, j);
  }
  else if (myXdir <= 600 && myYdir <=600) {
    ellipse(myX*5, myY, k, k);
  }

  if (myXdir > 300 && myYdir >300) {
    ellipse(myX, myY*10, j*2, j*2);
  }
  else if (myXdir <= 300 && myYdir <=300) {
    ellipse(myX, myY*10, k*2, k*2);
  }

  if ( millis() > 0) { // && millis() < start_time + 4500) {  t

    int bga = 0;
    int bgb = 0;
    int bgc = 0;
    int bgd = 0;

    float bga_transparency = map( millis(), 0, 20000, 0, 5 );
    if ( bga_transparency > 100 ) {
      bga_transparency = 100;
    }

    while ( bga <= 900 ) {
      fill(random(0, 255));
      stroke(random(0, 255), bga_transparency); 
      line(bga, 0, 900, 900);
      bga = bga + 20;
    }

    while ( bgb <= 900 ) {
      fill(random(0, 255)); 
      stroke(random(0, 255), 50); 
      line(0, bgb, 100, 900);
      bgb = bgb + 20;
    }

    while ( bgc <= 900 ) {
      fill(random(0, 255)); 
      stroke(random(0, 255), 50);
      line(0, 0, bgc, 900);
      bgc = bgc + 20;
    }
  }
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

  background(255);
  stroke(50, 50, 150);
  fill(150, 150, 255);

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

