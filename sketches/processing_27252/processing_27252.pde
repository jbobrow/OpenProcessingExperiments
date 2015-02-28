
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/27252*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float radius = 16;
int nodesPerBlob = 12;
int blobNumber = 64;
float spring = 0.2;
float damping = 0.1;
float gas = -0.02;
float feildStrength = 0.001;
float gravity = 0.01;
float nominalArea;
float springLength;
class blob{
  node[] nodes;
  float area;
  PVector centroid;
  blob(PVector xo){
    nodes = new node[nodesPerBlob];
    for(int i=0;i<nodes.length;i++){
      float phi = TWO_PI*i/nodes.length;
      nodes[i] = new node(new PVector(
        xo.x+radius*cos(phi),xo.y+radius*sin(phi)));
    }
  }
  void update(){
    for(int i=0;i<nodes.length;i++){
      int j = i+1;
      if(j>=nodes.length){j=0;}
      PVector dx = PVector.sub(nodes[j].x,nodes[i].x);
      float restore = springLength-dx.mag();
      restore*=spring;
      nodes[i].N.add(dx);
      nodes[j].N.add(dx);
      dx.normalize();
      PVector dv = PVector.sub(nodes[j].v,nodes[i].v);
      float damper = dv.dot(dx)*-damping;
      PVector F = PVector.mult(dx,restore+damper);
      nodes[j].f.add(F);
      nodes[i].f.sub(F);
    }
    float pressure = gas*(nominalArea-area+32);
    for(int i=0;i<nodes.length;i++){
      nodes[i].update(pressure);
    }
  }
  void getArea(){
    area = 0;
    for(int i=0;i<nodes.length;i++){
      int j = i+1;
      if(j>=nodes.length){j=0;}
      area+=nodes[i].x.x*nodes[j].x.y;
      area-=nodes[j].x.x*nodes[i].x.y;
    }
    area*=0.5;
  }
  void getCentroid(){
    float Cx = 0;
    float Cy = 0;
    for(int i=0;i<nodes.length;i++){
      int j = i+1;
      if(j>=nodes.length){j=0;}
      Cx+=(nodes[i].x.x+nodes[j].x.x)
        *(nodes[i].x.x*nodes[j].x.y
          -nodes[j].x.x*nodes[i].x.y);
      Cy+=(nodes[i].x.y+nodes[j].x.y)
        *(nodes[i].x.x*nodes[j].x.y
          -nodes[j].x.x*nodes[i].x.y);
    }
    centroid = new PVector(Cx,Cy);
    centroid.mult(1.0/(6.0*area));
  }
  void draw(){
    beginShape();
    for(int i=0;i<nodes.length;i++){
      vertex(nodes[i].x.x,nodes[i].x.y);
    }
    endShape(CLOSE);
    ellipse(centroid.x,centroid.y,radius/2,radius/2);
  }
  PVector forceFeild(PVector testPoint, boolean Newtons3rd){
    PVector[] sides = new PVector[nodes.length];
    PVector[] intermediates = new PVector[nodes.length];
    PVector[] normals = new PVector[nodes.length];
    boolean[] isInside = new boolean[nodes.length];
    float[] normDist = new float[nodes.length];
    for(int i=0;i<nodes.length;i++){
      intermediates[i] = new PVector();
    }
    for(int i=0;i<nodes.length;i++){
      int j = i+1;
      if(j>=nodes.length){j=0;}
      sides[i] = PVector.sub(nodes[j].x,nodes[i].x);
      sides[i].normalize();
      normals[i] = new PVector(-sides[i].y,sides[i].x);
      normDist[i] = PVector.sub(testPoint,nodes[i].x)
        .dot(normals[i]);
      if(normDist[i]>0){isInside[i] = true;
      }else{isInside[i] = false;}
      intermediates[i].add(sides[i]);
      intermediates[j].add(sides[i]);
    }
    for(int i=0;i<nodes.length;i++){
      intermediates[i].normalize();
    }
    float minDist = 1000000000;
    PVector feildForce = new PVector();
    int equalOpposite = -1;
    for(int i=0;i<nodes.length;i++){
      int j = i+1;
      if(j>=nodes.length){j=0;}
      if(PVector.sub(testPoint,nodes[i].x)
        .dot(intermediates[i])>0
        &&PVector.sub(testPoint,nodes[j].x)
        .dot(intermediates[j])<0
        &&PVector.sub(testPoint,nodes[i].x)
        .dot(normals[i])>0){
        if(minDist>normDist[i]){
          minDist = normDist[i];
          feildForce = PVector.mult(normals[i],minDist*-spring);
          equalOpposite = i;
        }
      }
    }
    if(equalOpposite>=0&&Newtons3rd){
      int i = equalOpposite;
      int j = i+1;
      if(j>=nodes.length){j=0;}
      nodes[i].f.sub(PVector.mult(feildForce,0.5));
      nodes[j].f.sub(PVector.mult(feildForce,0.5));
    }
    return(feildForce);
  }
  boolean pointIsInPolygon(PVector testPoint){
    boolean c = false;
    for(int i=0;i<nodes.length;i++) {
      int j = i-1;
      if(j==-1){j=nodes.length-1;}
      if(((nodes[i].x.y>testPoint.y)!=(nodes[j].x.y>testPoint.y))&&
  	 (testPoint.x<(nodes[j].x.x-nodes[i].x.x)
         *(testPoint.y-nodes[i].x.y)
         /(nodes[j].x.y-nodes[i].x.y)+nodes[i].x.x))
         c = !c;
    }
    return c;
  }
}
class node{
  PVector x;
  PVector v;
  PVector f;
  PVector N;
  node(PVector xo){
    x = xo.get();
    v = new PVector();
    f = new PVector();
    N = new PVector();
  }
  void update(float pressure){
    boolean dampen = false;
    if(x.x<0){
      f.x -= x.x*spring;
      dampen = true;
    };
    if(x.x>width){
      f.x -= (x.x-width)*spring;
      dampen = true;
    };
    if(x.y<0){
      f.y -= x.y*spring;
      dampen = true;
    };
    if(x.y>height){
      f.y -= (x.y-height)*spring;
      dampen = true;
    };
    if(dampen){v.mult(0.2);}
    N = new PVector(-N.y,N.x);
    N.normalize();
    f.add(PVector.mult(N,pressure));
    N = new PVector();
    v.add(f);
    f = new PVector(0,gravity);
    x.add(v);
  }
}
blob[] blobs;
void setup(){
  size(400,300);
  nominalArea = PI*pow(radius,2);
  springLength = TWO_PI*radius/nodesPerBlob;
  blobs = new blob[blobNumber];
  int blobRows = floor(width/(2*radius));
  for(int i=0;i<blobs.length;i++){
    PVector xo = new PVector(
      radius+(i%blobRows)*2*radius,
      height-(radius+floor(i/blobRows)*2*radius*pow(3,0.5)/2));
    if(floor(i/blobRows)%2==0){xo.x+=radius;}
    blobs[i] = new blob(xo);
  }
  stroke(0);
  fill(#00FF00,128);
  strokeWeight(0.5);
  smooth();
  ellipseMode(CENTER);
}
void draw(){
  if(frameCount%60==1){println(frameRate);}
  background(255);
  PVector mouseV = new PVector(mouseX,mouseY);
  PVector pmouseV = new PVector(pmouseX,pmouseY);
  float pushrad = 8;
  if(mousePressed){
    for(int i=0;i<blobs.length;i++){
      for(int j=0;j<blobs[i].nodes.length;j++){
        PVector dx = PVector.sub(blobs[i].nodes[j].x,mouseV);
        if(dx.mag()<pushrad){
          blobs[i].nodes[j].v.add(PVector.mult(PVector.sub(
            PVector.sub(mouseV,pmouseV),
            blobs[i].nodes[j].v),0.5));
        }
      }
    }
  }
  for(int i=0;i<blobs.length;i++){
    blobs[i].getArea();
    blobs[i].getCentroid();
  }
  for(int i=1;i<blobs.length;i++){
    for(int j=0;j<i;j++){
      PVector dx = PVector.sub(
        blobs[j].centroid,blobs[i].centroid);
      if(dx.mag()<radius){
        float restore = (radius-dx.mag())*spring;
        dx.normalize();
        dx.mult(restore);
        for(int k=0;k<blobs[j].nodes.length;k++){
          blobs[j].nodes[k].f.add(dx);
        }
        for(int k=0;k<blobs[i].nodes.length;k++){
          blobs[i].nodes[k].f.sub(dx);
        }
      }
    }
  }
  for(int i=1;i<blobs.length;i++){
    for(int j=0;j<i;j++){
      for(int k=0;k<blobs[j].nodes.length;k++){
        if(blobs[i].pointIsInPolygon(blobs[j].nodes[k].x)){
          blobs[j].nodes[k].f.add(blobs[i].forceFeild(
            blobs[j].nodes[k].x,true));
        }
      }
      for(int k=0;k<blobs[i].nodes.length;k++){
        if(blobs[j].pointIsInPolygon(blobs[i].nodes[k].x)){
          blobs[i].nodes[k].f.add(blobs[j].forceFeild(
            blobs[i].nodes[k].x,true));
        }
      }
    }
  }
  for(int i=0;i<blobs.length;i++){
    blobs[i].update();
    blobs[i].draw();
  }
}


