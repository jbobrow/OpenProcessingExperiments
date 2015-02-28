
public class Leaf {

  float xpos;
  float ypos;
  float angle;
  float unitsize;
  int detail;
  float luminance;
  float lineColor;
  // Basic quantity descriptors
  float l;    // maximum length
  float w;    // maximum width
  float a;    // area
  float h;    // Convex hull
  float p;    // perimeter
  // Dimensionless shape factors
  float c;    // Compactness 
  float r;    // Roundness 
  float e;    // Elongation 
  float g;    // Roughness 
  // Bezier descriptors  
  float dx1 = 0;
  float dy1 = 0;
  float dx2 = 0;
  float dy2 = 0;
  int index;
  color col;
  
  Leaf(float x, float y, int i, float rotation) {
    this.xpos = x;
    this.ypos = y;
    this.index = i;
    this.p = 360;
    angle = rotation;
    unitsize = angle*2;
    //render();
  };
  
  void setDimension(float l_, float w_) {
    this.h = l_;
    this.l = l_;
    this.w = w_;
    this.a = l*w;
    this.shapeFactors();
  }

  void setBezier(float x1, float y1, float x2, float y2) {
    this.dx1 = x1;
    this.dy1 = y1;
    this.dx2 = x2;
    this.dy2 = y2;
  }
  
  void setColor(color c) {
    this.col = c;
  }
  void setLineColor(float c) {
    this.lineColor = c;
  }
  
  public void setLuminance(float lum) {
    this.luminance = lum;
  }
  
  void setDetail(int d) {
    detail = d;
  }

  void shapeFactors() {
    this.c = 4*PI*this.a/(this.p*this.p);
    this.r = 4*this.a/(PI*(this.l*this.l));
    this.e = this.w/this.l;
    this.r = this.h/this.p;
  }

  void renderLines() {
    this.shapeFactors();
    xpos = 0;
    ypos = 0;
    rotate(radians(angle)); 
    stroke(128, 128);
    line(0,0,0,this.l + 20);
    ellipse(0,this.l,3,3);
  }
  
  void render(boolean rot) {
    this.shapeFactors();
    xpos = 0;
    ypos = 0;
    stroke(this.lineColor, this.luminance);
    fill(this.col, this.luminance);
    beginShape(POLYGON);
    // http://www.openprocessing.org/visuals/?visualID=2123
    // #0
    curveVertex(xpos,ypos);
    curveVertex(xpos,ypos);
    // #1
    curveVertex(xpos+dx1,ypos+dy1);
    // #2
    curveVertex(xpos+dx2,ypos+dy2);
    // #3
    curveVertex(xpos,ypos+l);
    //curveVertex(xpos,ypos+l);
    // #4
    curveVertex(xpos-dx2,ypos+dy2);
    // #5
    curveVertex(xpos-dx1,ypos+dy1);
    // #6
    curveVertex(xpos,ypos);
    curveVertex(xpos,ypos);
    if (rot) {
      rotate(radians(angle)); 
    } else {
      translate(w/4+10,30);
      scale(0.25);
    }
    endShape();
    stroke(128,128);

    // anchors
    ellipse(dx1,dy1,3,3);
    ellipse(dx2,dy2,3,3);
    ellipse(-dx1,dy1,3,3);
    ellipse(-dx2,dy2,3,3);

/******
    // bounding rect
    //stroke(this.lineColor, 75);
    fill(this.col, 75);
    rect(0,0,w,l);
    rect(0,0,-w,l);
    
    // leaf middle line
    //line(0,0,0,this.l + 20);

    // ** servo control
    // outer vertex
    // 1 servos needed
    // X/Y Servo
    line(xpos,ypos,xpos+dx2,ypos+dy2); // hypothenuse
    line(xpos,ypos,xpos-dx2,ypos+dy2); // hypothenuse
    // outer lines hypothenuse   
    line(xpos,this.l,xpos+dx2,ypos+dy2); // hypothenuse
    line(xpos,this.l,xpos-dx2,ypos+dy2); // hypothenuse
    // inner vertex
    // 2 servos needed
    // X/Y Servo
    line(xpos,this.l,xpos-dx1,ypos+dy1); // hypothenuse
    line(xpos,this.l,xpos+dx1,ypos+dy1); // hypothenuse
    line(xpos,ypos,xpos+dx1,ypos+dy1); // hypothenuse
    line(xpos,ypos,xpos-dx1,ypos+dy1); // hypothenuse
    // Width Servo
    line(0,dy1,dx1,dy1);
    line(0,dy1,-dx1,dy1);
*/
    //fill(this.col, this.luminance - 50);
    //line(xpos,ypos,xpos,ypos+l);
  };
};

