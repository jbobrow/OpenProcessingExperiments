
ArrayList Lines;
Line L1;
Line L2;
PVector I;
float radius;

float anglerange = 0.6;
int numlines = 2000;

void setup(){
  size(600,600);
  background(255);
  smooth();
  strokeWeight(1.0);
  radius = width*0.45;
  Lines = new ArrayList();
  firstLine();
}



void draw(){
  background(150);
  translate(width/2,height/2);

  stroke(255);
  for (int l=0; l<Lines.size(); l++){
    Line L = (Line) Lines.get(l);
    //strokeWeight(5/(1 + l*0.01));
    L.render();
  }
  addLine();
}


void firstLine(){
  float theta = random(TWO_PI);
  float sx = cos(theta)*radius;
  float sy = sin(theta)*radius;

  float delta = theta + PI + random(-anglerange,anglerange);
  float sx2 = cos(delta)*radius;
  float sy2 = sin(delta)*radius;


  Line L = new Line(new PVector(sx,sy), new PVector(sx2,sy2));
  Lines.add(L);
}

void addLine(){
  if (Lines.size() > numlines) {
    return;
  }

  float theta = random(TWO_PI);
  float sx = cos(theta)*radius;
  float sy = sin(theta)*radius;

  float delta = theta + PI + random(-anglerange,anglerange);
  float sx2 = cos(delta)*radius;
  float sy2 = sin(delta)*radius;

  Line L = new Line (new PVector(sx,sy),new PVector(sx2,sy2));
  float nearestIntDist = 1000;
  PVector nearestIntPoint = null;
  for (int l=0; l<Lines.size(); l++){
    Line CL = (Line) Lines.get(l);
    PVector Int = CL.findIntersection(L);
    if (Int != null){
      if (PVector.dist(Int,L.p1) < nearestIntDist) {
        nearestIntPoint = Int; // if this intersection is closer, set the nearestInt   
        nearestIntDist = PVector.dist(Int,L.p1);
      }
    }
  }
  if (nearestIntPoint != null) {
    L.p2 = nearestIntPoint;
    Lines.add(L);
  }
}

void keyPressed(){
  reset();
}

void reset(){
  Lines.clear();
  anglerange = random(0.2,1.5);
  firstLine();
}


class Line{

  PVector p1;
  PVector p2;

  Line(PVector _p1, PVector _p2){
    p1 = _p1;
    p2 = _p2;
  }

  PVector findIntersection(Line L) {
    // based on Marius Watz' line intersection code: http://workshop.evolutionzone.com/2007/09/10/code-2d-line-intersection/ 
    
    PVector p3 = L.p1;
    PVector p4 = L.p2;

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
    PVector pt=new PVector(0,0,0);
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

    // if the point isn't on the line, return null
    if(abs(len1-segmentLen1)>0.01 || abs(len2-segmentLen2)>0.01)
      return null;

    // return the valid intersection
    return pt;
  }

  void render(){
    line(p1.x,p1.y,p2.x,p2.y);
  }

}





