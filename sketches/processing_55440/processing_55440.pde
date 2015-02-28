
// LineIntersection2D.pde
// Marius Watz - http://workshop.evolutionzone.com

// calculates valid intersection between two lines,
// so that the intersection will lie on the specified
// line segment.

Point p[];
int num;

void setup() {
  size(500,250);

  num=12;
  p=new Point[num*2];
  for(int i=0; i< num*2; i++) p[i]=new Point(0,0);
  initPt();
}

void draw() {
  background(200);

  p[num-1].set(mouseX,mouseY);

  // check intersections with all lines
  for(int j=0; j< num; j++) {
    line(p[j*2].x,p[j*2].y, p[j*2+1].x,p[j*2+1].y);
    for(int i=0; i< num; i++) if(i!=j) {
      Point pt=findIntersection(
        p[i*2],p[i*2+1], p[j*2],p[j*2+1]);
      if(pt!=null) ellipse(pt.x,pt.y, 14,14);
    }
  }

}

void initPt() {
  for(int i=0; i< num; i++) {
    if(random(100)>50) {
      p[i*2].set(20,random(20,height-20));
      p[i*2+1].set(width-20,random(20,height-20));
    }
    else {
      p[i*2].set(random(20,width-20),20);
      p[i*2+1].set(random(20,width-20),height-20);
    }
  }
}

void mousePressed() {
  initPt();
  p[num-2].set(mouseX,mouseY);
}

// calculates intersection and checks for parallel lines.
// also checks that the intersection point is actually on
// the line segment p1-p2
Point findIntersection(Point p1,Point p2,
  Point p3,Point p4) {
  float xD1,yD1,xD2,yD2,xD3,yD3;
  float dot,deg,len1,len2;
  float segmentLen1,segmentLen2;
  float ua,ub,div;

  // calculate differences
  xD1=p2.x-p1.x;
  xD2=p4.x-p3.x;
  yD1=p2.y-p1.y;
  yD2=p4.y-p3.y;
  xD3=p1.x-p3.x;
  yD3=p1.y-p3.y;  

  // calculate the lengths of the two lines
  len1=sqrt(xD1*xD1+yD1*yD1);
  len2=sqrt(xD2*xD2+yD2*yD2);

  // calculate angle between the two lines.
  dot=(xD1*xD2+yD1*yD2); // dot product
  deg=dot/(len1*len2);

  // if abs(angle)==1 then the lines are parallell,
  // so no intersection is possible
  if(abs(deg)==1) return null;

  // find intersection Pt between two lines
  Point pt=new Point(0,0);
  div=yD2*xD1-xD2*yD1;
  ua=(xD2*yD3-yD2*xD3)/div;
  ub=(xD1*yD3-yD1*xD3)/div;
  pt.x=p1.x+ua*xD1;
  pt.y=p1.y+ua*yD1;

  // calculate the combined length of the two segments
  // between Pt-p1 and Pt-p2
  xD1=pt.x-p1.x;
  xD2=pt.x-p2.x;
  yD1=pt.y-p1.y;
  yD2=pt.y-p2.y;
  segmentLen1=sqrt(xD1*xD1+yD1*yD1)+sqrt(xD2*xD2+yD2*yD2);

  // calculate the combined length of the two segments
  // between Pt-p3 and Pt-p4
  xD1=pt.x-p3.x;
  xD2=pt.x-p4.x;
  yD1=pt.y-p3.y;
  yD2=pt.y-p4.y;
  segmentLen2=sqrt(xD1*xD1+yD1*yD1)+sqrt(xD2*xD2+yD2*yD2);

  // if the lengths of both sets of segments are the same as
  // the lenghts of the two lines the point is actually
  // on the line segment.

  // if the point isn�t on the line, return null
  if(abs(len1-segmentLen1)>0.01 || abs(len2-segmentLen2)>0.01)
    return null;

  // return the valid intersection
  return pt;
}

class Point{
  float x,y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }

  void set(float x, float y){
    this.x = x;
    this.y = y;
  }
}

