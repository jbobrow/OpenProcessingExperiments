
void setup() {
  size(700, 700);
}
void draw() {
  background(0);
  translate(0.5*width, 0.5*height);

  //circle
  stroke(110, 3, 86);
  strokeWeight(5);
  ellipse(0, 0, 0.5*width, 0.5*height);

  //circle stamp

  stamp(new Circle(), 4, 300, 0.7, QUARTER_PI);

  stamp(new Hourglass(), 4, 300, 0.7, HALF_PI);
}


//design: circle stamp
class Circle implements Pattern {
  void draw() {
    color greenColor = color(5, 86, 20, 200);
    float inWidth = 0.1*width;
    float inHeight = 0.1*height;

    noStroke();
    fill(250);
    ellipse(0, 0, 0.2*width, 0.2*height);
    fill(greenColor);
    ellipse(0, -20, inWidth, inHeight);
    ellipse(15, 10, inWidth, inHeight);
    ellipse(-15, 10, inWidth, inHeight);
  }
}

//design: hourglass
class Hourglass implements Pattern {
  void draw() {
    color purpleColor = color(110, 3, 86, 250);
    float width2 = 0.05*width;
    float height2 = 0.1*height;

    noStroke();
    fill(purpleColor);
    arc(0, 25, width2, height2, PI, TWO_PI);
    arc(0, -25, width2, height2, QUARTER_PI-QUARTER_PI, PI);
  }
}


//******************************************************
// Do not make any changes below this line
//******************************************************

interface Pattern { 
  void draw();
}

/*
 * render 'number' copies of the model pattern, with each drawn at
 * given radius from center and at given scale, and with the first
 * placed at angle theta.
 */
void stamp(Pattern model, int number, float radius, float scale, float theta) {
  float incr = TWO_PI/number;
  for (int j=0; j<number; j++) {
    pushMatrix();
    rotate(theta + incr*j);
    translate(radius, 0);
    scale(scale);
    rotate(HALF_PI);
    model.draw();
    popMatrix();
  }
}


void star(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;

  beginShape();
  for (int i=0; i<pointCount; i++) {
    for (int j=0; j<2; j++) {
      tempRadius = innerRadius;

      // true if j is even
      if (j%2==0) {
        tempRadius = outerRadius;
      }

      x = cos(theta)*tempRadius;
      y = sin(theta)*tempRadius;
      vertex(x, y);
      theta += thetaRot;
    }
  }
  endShape(CLOSE);
}

void regularPolygon(int sideCount, float radius) {
  float theta = 0.0;
  beginShape();
  for (int i=0; i < sideCount; i++) {
    float x = radius * cos(theta);
    float y = radius * sin(theta);
    vertex(x, y);
    theta += TWO_PI / sideCount;
  }
  endShape(CLOSE);
}


