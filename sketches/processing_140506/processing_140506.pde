


void drawThing(float myX, float myY, float myXdir, float myYdir) {


  rect(myX, myY, 50, 50);



  fill(25, 25, 22, 23);
  strokeWeight(1);
  rect(myX, myY, 10, 10);
  fill(25, 25, 22, 10);
}





boolean active = false;

void keyReleased() {
  if (key == 's' || key == 'S') 
    index = index - 100;
  if (key == 'p' || key == 'P')  
    index = index + 100;
  fill(230, 23, 23, 210);
}


void mousePressed() {
  index = index + 31;
}


//////////
// you should not need to change anything below this line ...
//////////

int numPoints = 5000;


float[] x;
float[] y;

float[] xDirection;
float[] yDirection;

int last_add_time = 1000;

int index = 0;

void setup() {

  size(600, 600);
  x = new float[numPoints];
  y = new float[numPoints];  

  xDirection = new float[numPoints];
  yDirection = new float[numPoints];  

  int i = 0; 
  while ( i < numPoints ) {
    xDirection[i] = random(-2, 2);
    yDirection[i] = random(-2, 2);

    i = i + 1;
  }
}

void draw() {

  background(255);
  noStroke();
  fill(0, 0, 0);

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
  while ( i <index ) {
    drawThing( x[i], y[i], xDirection[i], yDirection[i] );

    x[i] = x[i] + xDirection[i];
    y[i] = y[i] + yDirection[i];

    if ( x[i] > width || x[i] < 0 ) {
      xDirection[i] = xDirection[i] * -1;
    }
    if ( y[i] > height || y[i] < 0 ) {
      yDirection[i] = yDirection[i] * -1;
    }



    i = i + 4;
  }

  if ( mousePressed ) {
    drawThing( x[i], y[i], xDirection[i], yDirection[i] );

    background( random(200, 250), random(200, 250), random(200, 250) );

    line(0, y[i], mouseX, x[i]+100);

    xDirection[i] =2 + x[i];
    yDirection[i] = mouseY + 2 + y[i];
    i = i+ 2;
  }




  i = i +1;
}





