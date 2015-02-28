
/**
 This example is a varient of the same process that produces the 
 Sierpinski triangle. The main difference is that we use a pentagon
 instead of a triangle. The second difference is that after we find
 the midpoints on the sides of the pentagon, we start to draw a line
 to the point on the opposite side, stopping before we get there. 
 Connecting these inner points creates six new smaller pentagons. 
 
 For implementation, this is designed to be very close to the recursive
 class we built for the Sierpinski triangle.
 
 C. Andrews
 2014-01-23
 
 **/


Pentagon fractal;
// this is the percentage of the distance the inner struts travel 
// across the center of the pentagon
float strutFactor = .2; 
void setup() {
  size(600, 600);

  background(255);
  noLoop();
}

/**
 Setup the initial pentagon. We are using our basic circle algorithm
 to calculate the initial points.
 **/
void draw() {
  translate(width/2, height / 2);
  PVector[] points = new PVector[5];

  float angle = TWO_PI/5;

  int radius = width/3;

  for (int i = 0; i < 5; i++) {
    float x = radius * cos(angle*i);
    float y = radius * sin(angle * i);
    points[i] = new PVector(x, y);
  }

  fractal = new Pentagon(points, 4);

  fractal.draw();
}


/**
 Our recursive class for creating the fractal. Notice how similar it
 is to the Sierpinski triangle.
 **/
class Pentagon {
  PVector[] points; // the outer points of this pentagon
  Pentagon[] branches; // the six inner pentagons
  int level;

  Pentagon(PVector[] thePoints, int levels) {
    points = thePoints;
    level = levels;

    if (level > 0) {
      // create our array of inner pentagons
      branches =  new Pentagon[6];

      // find the midpoints on each edge
      PVector[] midpoints;
      midpoints = new PVector[5];
      for (int i = 0; i < points.length;i++) {
        midpoints[i] = midpoint(points[i], points[(i+1)%points.length]);
      }


      // find the inner points  
      PVector[] innerPoints = new PVector[5];

      for (int i = 0; i < midpoints.length;i++) {
        PVector opposite = points[(i+3)%points.length];
        float x = midpoints[i].x + (opposite.x - midpoints[i].x) * strutFactor;
        float y = midpoints[i].y + (opposite.y - midpoints[i].y) * strutFactor;
        innerPoints[i]= new PVector(x, y);
      }


      // Create the Pentagon objects representing the six inner
      // pentagons
      // the shape is very regular, so we can build the ring of five
      // using a loop
      for (int i = 0; i < points.length; i++) {

        PVector[] p = new PVector[points.length];
        p[0] = midpoints[i];
        p[1] = innerPoints[i]; 
        p[2] = innerPoints[(i+1)%points.length];
        p[3] = midpoints[(i+1)%points.length];
        p[4] = points[(i+1)%points.length];
        branches[i] = new Pentagon(p, level-1);
      }

      // add the final innermost pentagon  
      branches[5] = new Pentagon(innerPoints, level-1);
    }
  }

  /**
   This is a simple helper function that takes in two points and
   returns the midpoint between them.
   **/
  PVector midpoint(PVector point1, PVector point2) {
    return new PVector(point1.x + (point2.x - point1.x)/2, point1.y + (point2.y - point1.y)/2);
  }

  /**
   This draws the fractal. If this is on level 0, we just draw the triangle
   formed by the three points in points. If it isn't level 0, we iterate
   through the six branches and tell them to draw themselves.
   **/
  void draw() {

    if (level != 0) {
      for (Pentagon branch: branches) {
        if (branch != null) {
          branch.draw();
        }
      }
    }
    else {
      noFill();
      beginShape();
      for (int i = 0;i < points.length; i++) {
        vertex(points[i].x, points[i].y);
      }
      vertex(points[0].x, points[0].y);
      endShape();
    }
  }
}



