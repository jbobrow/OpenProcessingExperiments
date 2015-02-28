
/**
 This is a different version of the Sierpinski triangle that uses a
 recursive structure (rather than a recursive fucntion). This is a
 class that contains smaller instances of itself inside. 
 
 C. Andrews
 2014-01-23
 **/

// Our fractal is now an object
Sierpinski fractal;

void setup() {
  size(600, 600);

  background(255);
  noLoop();
}

/**
 We pick three points, create the Sierpinski object and then draw it.
 **/
void draw() {
  PVector[] points = new PVector[3];
  points[0] = new PVector(width/2, 50);
  points[1] = new PVector(width/8, height - 50);
  points[2] = new PVector(width - width/8, height - 50);
  fractal = new Sierpinski(points, 6);
  fractal.draw();
}


/**
 This is the class that creates the fractal. 
 
 Note that it contains three instances of itself in an array called
 branches. We can think of the Sierpinski triangle as being made of
 three Sierpinski triangles stacked together to make a triangle that
 has sides that are twice as long.
 **/
class Sierpinski {
  PVector[] points; // the bounding points of the triangle
  Sierpinski[] branches; // the three smaller versions
  int level; // which level are we on?


  /**
   The constructor. This is responsable for creating the structure. 
   This calculates the three midpoints and then creates three 
   smaller Sierpinski triangles using combinations of the original
   points and the midpoints.
   **/
  Sierpinski(PVector[] thePoints, int levels) {
    points = thePoints;
    level = levels;

    if (level > 0) {
      branches =  new Sierpinski[3];
      PVector m01 = midpoint(points[0], points[1]);
      PVector m02 = midpoint(points[0], points[2]);
      PVector m12 = midpoint(points[1], points[2]);

      PVector[] branch0 = {
        points[0], m01, m02
      };
      branches[0] = new Sierpinski(branch0, level - 1);
      PVector[] branch1 = {
        m01, points[1], m12
      };
      branches[1] = new Sierpinski(branch1, level - 1);
      PVector[] branch2 = {
        m02, m12, points[2]
      };
      branches[2] = new Sierpinski(branch2, level - 1);
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
   through the three branches and tell them to draw themselves.
   **/
  void draw() {

    if (level != 0) {
      for (Sierpinski branch: branches) {
        branch.draw();
      }
    }
    else {
      fill(100, 0, 255);
      beginShape();
      for (int i = 0;i < points.length; i++) {
        vertex(points[i].x, points[i].y);
      }
      vertex(points[0].x, points[0].y);
      endShape();
    }
  }
}



