
float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements

float proximity;

void setup() {
  size(500, 500);

  numArray = 100;

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];

  proximity = 50;  
  
  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }

  strokeWeight(5);
}

void draw() {

  background(255);
  // iterate over each point
  for (int i=0; i<numArray; i++) {

    x[i] += xInc[i];
    y[i] += yInc[i];

    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) {
      xInc[i] = xInc[i] > 0 ? -random(1) : random(1);
    }

    if (y[i] > height || y[i] < 0 ) {
      yInc[i] = yInc[i] > 0 ? -random(1) : random(1);
    }

    drawElement(x[i], y[i], xInc[i], yInc[i]);
  }

  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      float dist = dist(x[i], y[i], x[j], y[j]  );
      if (dist < proximity) {
        if (i%2 == 0 || j%2==0) {
          stroke(0, 0, 255, 20);
        } 
        else {
          stroke(0, 255, 0, 20);
        }
        line(x[i], y[i], x[j], y[j]  );
      }
    }
  }
}



void drawElement(float x, float y, float dx, float dy ) {

// draw the point in blue
  noFill();
  strokeWeight(5);
  stroke(0, 0, 255);
  point(x, y);


  // draw an arrow in the current direction of travel
 // stroke(0, 100);
  stroke(255, 0, 0);
  float endX = x + (dx*20);
  float endY = y + (dy*20);
  float arX = x + (dx*15);
  float arY = y + (dy*15);
  line(x, y, endX, endY);
  line(endX, endY, arX + (dy * 5), arY - (dx * 5));
  line(endX, endY, arX - (dy * 5), arY + (dx * 5));


  // draw the boundary of proximity
  //stroke(0, 100);
  stroke(10, 255, 10);
  strokeWeight(2);
  ellipse(x, y, proximity, proximity);
  
  stroke(0);
  strokeWeight(5);
  rect(x,y,proximity,proximity);
}
