
int subdivisions = 4;
float goldenRatio;
float elementLength;
float areaLimiter;
float radius = 96;
float depth = 400;
float gravity = 0.002;
float spring = 0.15;
float damp = 0.05;
float nominalVolume;
float gas = 0.0000000001;
class node{
  PVector x;
  PVector v;
  PVector f;
  node[] attached;
  node(PVector xo){
    x = xo.get();
    attached = new node[0];
    v = new PVector();
    f = new PVector(); 
  }
  element attach(node a){
    attached = (node[]) append(attached,a);
    a.attached = (node[]) append(a.attached,this);
    element e = new element(this,a);
    return e;
  }
  void update(){
    boolean slip = false;
    if(x.x<0){
      f.add(new PVector(-x.x*spring,0));
      slip = true;
    }
    if(x.x>width){
      f.add(new PVector((x.x-width)*-spring,0));
      slip = true;
    }
    if(x.y<0){
      f.add(new PVector(0,-x.y*spring));
      slip = true;
    }
    if(x.y>height){
      f.add(new PVector(0,(x.y-height)*-spring));
      slip = true;
    }
    if(x.z>0){
      f.add(new PVector(0,0,-x.z*spring));
      slip = true;
    }
    if(x.z<-depth){
      f.add(new PVector(0,0,(x.z+depth)*-spring));
      slip = true;
    }
    if(slip){f.sub(PVector.mult(v,damp));}
    v.add(f);
    f = new PVector(0,gravity,0);
    x.add(v);
  }
  void grip(){
    v = new PVector(mouseX-pmouseX,mouseY-pmouseY);
    x.x = mouseX;
    x.y = mouseY;
  }
}
class element{
  node a;
  node b;
  float L;
  element(node ao,node bo){
    a = ao;
    b = bo;
  }
  void setLength(){
    L = PVector.sub(b.x,a.x).mag();
  }
  void update(){
    PVector dx = PVector.sub(b.x,a.x);
    if(dx.mag()>L){
      float restore = (dx.mag()-L)*spring;
      dx.normalize();
      PVector dv = PVector.sub(b.v,a.v);
      float damper = dx.dot(dv)*damp;
      b.f.sub(PVector.mult(dx,restore+damper));
      a.f.add(PVector.mult(dx,restore+damper));
    }
  }
}
class polygon{
  node a;
  node b;
  node c;
  polygon(node ao,node bo,node co){
    a = ao;
    b = bo;
    c = co;
    if(normalVector().dot(centroid())<0){
      a = ao;
      b = co;
      c = bo;
    }
    if(normalVector().dot(centroid())<0){
      println("normal inverted");
    }
  }
  PVector normalVector(){
    PVector N = PVector.sub(b.x,a.x).cross(
      PVector.sub(c.x,a.x));
    N.normalize();
    return N;
  }
  PVector centroid(){
    PVector oid = new PVector();
    oid.add(a.x);
    oid.add(b.x);
    oid.add(c.x);
    oid.mult(1.0/3);
    return oid;
  }
  float hydrostaticArea(){
    float A = PVector.sub(b.x,a.x).mag();
    float B = PVector.sub(c.x,b.x).mag();
    float C = PVector.sub(a.x,c.x).mag();
    float s = (A+B+C)/2;
    float area = s*(s-A)*(s-B)*(s-C);
    if(area>areaLimiter){area=areaLimiter;}
    return area;
  }
}
class bubble{
  node[] nodes;
  element[] elements;
  polygon[] polygons;
  bubble(){
    println("instantiating bubble...");
    nodes = new node[12];
    nodes[0] = new node(new PVector(0,1,goldenRatio));
    nodes[1] = new node(new PVector(0,-1,goldenRatio));
    nodes[2] = new node(new PVector(0,1,-goldenRatio));
    nodes[3] = new node(new PVector(0,-1,-goldenRatio));
    nodes[4] = new node(new PVector(1,goldenRatio,0));
    nodes[5] = new node(new PVector(-1,goldenRatio,0));
    nodes[6] = new node(new PVector(1,-goldenRatio,0));
    nodes[7] = new node(new PVector(-1,-goldenRatio,0));
    nodes[8] = new node(new PVector(goldenRatio,0,1));
    nodes[9] = new node(new PVector(goldenRatio,0,-1));
    nodes[10] = new node(new PVector(-goldenRatio,0,1));
    nodes[11] = new node(new PVector(-goldenRatio,0,-1));
    PVector dx;
    elementLength = 2;
    if(subdivisions>0){
      println("subdividing nodes...");
      for(int m=0;m<subdivisions;m++){
        node[] newNodes = new node[0];
        for(int i=1;i<nodes.length;i++){
          for(int j=0;j<i;j++){
            dx = PVector.sub(nodes[j].x,nodes[i].x);
            if(dx.mag()<elementLength*1.001){
              newNodes = (node[]) append(newNodes,new node(
                PVector.add(nodes[i].x,PVector.mult(dx,0.5))));
            }
          }
        }
        int nodesLength = nodes.length;
        nodes = (node[]) expand(nodes,
          nodesLength+newNodes.length);
        for(int i=0;i<newNodes.length;i++){
          nodes[nodesLength+i] = newNodes[i];
        }
        elementLength/=2;
      }
    }
    println("attaching elements...");
    elements = new element[0];
    for(int i=1;i<nodes.length;i++){
      for(int j=0;j<i;j++){
        dx = PVector.sub(nodes[j].x,nodes[i].x);
        if(dx.mag()<elementLength*1.001){
          elements = (element[]) append(elements,
            nodes[i].attach(nodes[j]));
        }
      }
    }
    println("knitting polygons...");
    polygons = new polygon[0];
    for(int i=0;i<nodes.length;i++){
      for(int j=0;j<nodes[i].attached.length;j++){
        for(int k=0;k<nodes[i].attached[j].attached.length;k++){
          for(int h=0;h<nodes[i].attached[j]
            .attached[k].attached.length;h++){
            if(nodes[i].attached[j]
              .attached[k].attached[h]==nodes[i]){
              boolean isDuplicate = false;
              if(polygons.length>0){
                for(int m=0;m<polygons.length;m++){
                  if(nodes[i]==polygons[m].a
                    ||nodes[i]==polygons[m].b
                    ||nodes[i]==polygons[m].c){
                    if(nodes[i].attached[j]==polygons[m].a
                      ||nodes[i].attached[j]==polygons[m].b
                      ||nodes[i].attached[j]==polygons[m].c){
                      if(nodes[i].attached[j].attached[k]==polygons[m].a
                        ||nodes[i].attached[j].attached[k]==polygons[m].b
                        ||nodes[i].attached[j].attached[k]==polygons[m].c){
                        isDuplicate = true;
                      }
                    }
                  }
                }
              }
              if(isDuplicate==false){
                polygons = (polygon[]) append(polygons,
                  new polygon(nodes[i],
                    nodes[i].attached[j],
                    nodes[i].attached[j].attached[k]));
              }
            }
          }
        }
      }
    }
    float radDenominator = sqrt(goldenRatio*sqrt(5));
    elementLength *= radius/radDenominator;
    areaLimiter = (sqrt(3)/4*sq(elementLength))*4;
    PVector center = new PVector(width/2,height/2,-depth/2);
    for(int i=0;i<nodes.length;i++){
      nodes[i].x.normalize();
      nodes[i].x.mult(radius);
      nodes[i].x.add(center);
    }
    for(int i=0;i<elements.length;i++){
      elements[i].setLength();
    }
    nominalVolume = 4.0/3*PI*pow(radius,3);
    println("bubble successfully instantiated.");
    println(nodes.length + " nodes");
    println(elements.length + " elements");
    println(polygons.length + " polygons");
    println("nominalVolume " + nominalVolume);
  }
  float volume(){
    float vol = 0;
    for(int i=0;i<polygons.length;i++){
      polygon poly = polygons[i];
      float area = 0;
      area += poly.a.x.x*poly.b.x.y-poly.b.x.x*poly.a.x.y;
      area += poly.b.x.x*poly.c.x.y-poly.c.x.x*poly.b.x.y;
      area += poly.c.x.x*poly.a.x.y-poly.a.x.x*poly.c.x.y;
      area /= 2;
      vol += area*poly.centroid().z;
    }
    return vol;
  }
  void update(){
    float pressure = (nominalVolume-volume())*gas;
//    if(frameCount%60==0){println("volume "+volume());}
    for(int i=0;i<polygons.length;i++){
      polygon poly = polygons[i];
      PVector F = PVector.mult(poly.normalVector(),
        pressure*poly.hydrostaticArea());
      poly.a.f.add(F);
      poly.b.f.add(F);
      poly.c.f.add(F);
    }
    for(int i=0;i<elements.length;i++){
      elements[i].update();
    }
    for(int i=0;i<nodes.length;i++){
      nodes[i].update();
      if(hold==i){
        nodes[i].grip();
      }
    }
  }
  float kineticEnergy(){
    float sum = 0;
    for(int i=0;i<nodes.length;i++){
      sum += 0.5*sq(nodes[i].v.mag());
    }
    return sum;
  }
}
bubble bbl;
void setup(){
  size(500,400,P3D);
  ortho(-width/2, width/2, -height/2, height/2, -10, 10);
  fill(#FF4800);
  noSmooth();
  noStroke();
  goldenRatio = (1.0+sqrt(5))/2;
  bbl = new bubble();
}
void draw(){
  if(frameCount%60==0){println("frameRate "+frameRate);}
  background(#7307E8);
  bbl.update();
  bbl.update();
  directionalLight(255, 255, 255, -1, 1, -1);
  directionalLight(128, 128, 128, 1, -1, 1);
  if(bbl.kineticEnergy()>1073741824){
    bbl=new bubble();
    println("energy limit tripped!");
  }
  beginShape(TRIANGLES);
  for(int i=0;i<bbl.polygons.length;i++){
    vertex(bbl.polygons[i].a.x.x
      ,bbl.polygons[i].a.x.y,bbl.polygons[i].a.x.z);
    vertex(bbl.polygons[i].b.x.x
      ,bbl.polygons[i].b.x.y,bbl.polygons[i].b.x.z);
    vertex(bbl.polygons[i].c.x.x
      ,bbl.polygons[i].c.x.y,bbl.polygons[i].c.x.z);
  }
  endShape();
}
int hold = -1;
void mousePressed(){
  for(int i=0;i<bbl.nodes.length;i++){
    PVector dx = new PVector();
    dx.x = bbl.nodes[i].x.x - mouseX;
    dx.y = bbl.nodes[i].x.y - mouseY;
    dx.z = 0;
    if(dx.mag()<elementLength/2){
      if(hold!=-1){
        if(bbl.nodes[i].x.z>
          bbl.nodes[hold].x.z){
          hold = i;
        }
      }else{
        hold = i;
      }
    }
  }
}
void mouseReleased(){
  hold = -1;
}

