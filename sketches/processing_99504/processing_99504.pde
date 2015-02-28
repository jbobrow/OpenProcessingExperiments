
import java.awt.Color;
import java.awt.Graphics;
import java.awt.geom.Line2D;
import java.util.ArrayList;

public class CollisionPolygon {
  private int[]  x, y;
  private int    numPoints;

  public CollisionPolygon(int[] x, int[] y) {
    this.x = x;
    this.y = y;
    numPoints = min(x.length, y.length);
  }

  void draw(int r, int g, int b){
    fill(r, g, b);
    beginShape();
    for (int i=0; i<numPoints; i++){
       vertex(x[i], y[i]); 
    }
    endShape();
  }

  boolean intersects(CollisionPolygon b) {
    ArrayList<FixedVector> axes = new ArrayList<FixedVector>();
    for (FixedVector v : getPotentialSeparatingAxes())
      axes.add(v);
    for (FixedVector v : b.getPotentialSeparatingAxes())
      axes.add(v);
    for (FixedVector v : axes) { // the vectors "v" are all the vectors normal to the faces of the polygons
      Line2D.Double shad = projectShadow(v); //project each shape's "shadow" onto the axis.
      Line2D.Double shadP = b.projectShadow(v);
      double x1, x2, px1, px2;
      x1 = shad.getX1();
      x2 = shad.getX2();
      px1 = shadP.getX1();
      px2 = shadP.getX2();
      if (x1==x2&&x2==px1&&px1==px2) { // if the x's are equal,
        x1 = shad.getY1();
        x2 = shad.getY2();
        px1 = shadP.getY1();
        px2 = shadP.getY2();
        if (Math.max(x1, x2)>Math.max(px1, px2)) { // compare the y's
          double min = Math.min(x1, x2);
          double max = Math.max(px1, px2);
          if (max<min) return false; // return false if the shadows don't overlap.
        } 
        else {
          double max = Math.max(x1, x2);
          double min = Math.min(px1, px2);
          if (max<min) return false; // return false if the shadows don't overlap.
        }
      } 
      else {
        if (Math.max(x1, x2)>Math.max(px1, px2)) {
          double min = Math.min(x1, x2);
          double max = Math.max(px1, px2);
          if (max<min) return false; // return false if the shadows don't overlap.
        } 
        else {
          double max = Math.max(x1, x2);
          double min = Math.min(px1, px2);
          if (max<min) return false; // return false if the shadows don't overlap.
        }
      }
    }
    return true; // return true if all the shadows do overlap.
  }

  public Line2D.Double projectShadow(FixedVector v) {
    double projX, projY, projDX, projDY; // these will be the shadow line's endpoints
    projX = v.getX(); //initially assign them to the axis vector's endpoints
    projY = v.getY();
    projDX = v.getTipX();
    projDY = v.getTipY();
    double minX = 0, minY = 0, maxX = 0, maxY = 0; // the extreme points on the shadow that the polygon casts
    for (int i = 0; i<numPoints; i++) { // for every point in the polygon
      double qx = x[i], qy = y[i];
      double X = qx, Y = qy;
      if (projDX==projX) { // if the shadow is vertical,
        X = projX; // the x position of all the points is the same
        if (Y<minY) { // and we just need to set the max/min of the y coordinate to be the extremes
          minX = X;
          minY = Y;
        } 
        else if (Y>maxY) {
          maxX = X;
          maxY = Y;
        }
      } 
      else { // flips the side of the polygon around, lines it up with the shadow, and projects it onto the shadow. (internet)
        double m = (projDY-projY)/(projDX-projX);
        double b = projY-(m*projX);
        X = (m*qy+qx-m*b)/(m*m+1);
        Y = (m*m*qy+m*qx+b)/(m*m+1);
      }
      if (i==0) { // if it's the first side, these are necessarily the extremes.
        minX = X;
        maxX = X;
        minY = Y;
        maxY = Y;
      } 
      else { // compare the x and y's with the existing extremes.
        if (X<minX) {
          minX = X;
          minY = Y;
        } 
        else if (X>maxX) {
          maxX = X;
          maxY = Y;
        }
      }
    }
    return new Line2D.Double(minX, minY, maxX, maxY); //return the complete shadow of the polygon onto the axis.
  }

  public FixedVector[] getPotentialSeparatingAxes() { // find vectors normal to all the faces, add them to an array, and return it
    FixedVector[] axes = new FixedVector[numPoints];
    float x1, x2, y1, y2;
    for (int i = 0; i<numPoints; i++) {
      x1 = x[i];
      x2 = x[(i+1)%numPoints]; // mod by the number of points to wrap around to the first point again.
      y1 = y[i];
      y2 = y[(i+1)%numPoints];
      axes[i] = FixedVector.getVector(x1, y1, x2, y2);
    }
    return axes;
  }

  // sets the center of the polygon to the given coordinates.
  public void setCenter(double centerX, double centerY) {
    double dX = centerX-avg(x); // get the offset distance
    double dY = centerY-avg(y);
    for (int i = 0; i<numPoints; i++) {
      x[i] += dX; // add it to every point on the polygon
      y[i] += dY;
    }
  }
  
  // shifts the center of the polygon by the given amount
  public void shift(double dX, double dY) {
    for (int i = 0; i<numPoints; i++) {
      x[i] += dX; // add it to every point on the polygon
      y[i] += dY;
    }
  }

  public double getCenterX() {
    return avg(x);
  }

  public double getCenterY() {
    return avg(y);
  }

  double avg(int... vals) {
    double sum = 0.0;
    for (double v : vals)
      sum += v;
    return sum/vals.length;
  }
}


