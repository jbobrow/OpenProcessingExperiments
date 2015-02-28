
class ArcSegment {
  float centerx, centery, radius, arcwidth, arcstart, extent, left, top;

  ArcSegment(float centerx, float centery, float radius, float arcwidth, float arcstart, float extent) {
    this.centerx = centerx;
    this.centery = centery;
    this.radius = radius;
    this.arcwidth = arcwidth;
    this.arcstart = arcstart;
    this.extent = extent;
    this.left = centerx - radius;
    this.top = centery - radius;
    //println(radius+":"+arcwidth+":"+arcstart+":"+extent);
  }
  
  //source: http://www.shiffman.net/2011/02/03/rotate-a-vector-processing-js/
  void rotate2D(PVector v, float theta) {
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
  }
  
  boolean mouseOver() {
    PVector v = new PVector(mouseX-centerx,mouseY-centery);
    PVector v0 = new PVector(radius/2,0);
    float mouseAngle = degrees(PVector.angleBetween(v, v0));
    float mouseLength = v.mag();
    if (mouseY < centery) mouseAngle = 360-mouseAngle;
    return (mouseLength > radius-arcwidth && mouseLength < radius && mouseAngle > arcstart && mouseAngle < arcstart+extent);
  }

  void draw() {
    //outer arc
    arc(left, top, 2 * radius, 2 * radius, radians(arcstart), radians(arcstart+extent));

    //inner arc
    fill(255);
    ellipse(left + arcwidth, top + arcwidth, 2 * radius - 2 * arcwidth, 2 * radius - 2 * arcwidth);
    noFill();
    arc(left + arcwidth, top + arcwidth, 2 * radius - 2 * arcwidth, 2 * radius - 2 * arcwidth, radians(arcstart), radians(arcstart+extent));
    
    //lines to connect arcs
    PVector v = new PVector(radius/2,0);
    rotate2D(v,radians(arcstart));
    line(centerx+v.x,centery+v.y,centerx+v.x*2,centery+v.y*2);
    rotate2D(v,radians(extent));
    line(centerx+v.x,centery+v.y,centerx+v.x*2,centery+v.y*2);
  }
}


