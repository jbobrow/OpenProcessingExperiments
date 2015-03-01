
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/168573*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="0.jpg";  preload="1.jpg";  */

Boolean javaMode=10/3==(int)(10/3); // auto-detecting java or javascript mode

 Boolean highRes=javaMode;
 
 void keyPressed(){highRes=!highRes; initialize();}
 
int Resolution;
int resolution;
float areaLimiter;
float Radius;
float radius;
float depth = 400;
float gravity = 0.0005;
float spring = 0.15;
float damp = 0.07;
float nominalVolume;
float gas = 0.0000000002;


Boolean slipOnGlassPlane = false;
 
class node{
  PVector x;
  PVector v;
  PVector f;
  node[] attached;
  node(PVector xo){
    x = xo.get();
    attached = new node[0];
    v = new PVector(random(-.4,.4),random(-.4,.4),0.05); 
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
      f.add(new PVector(0,0,(-x.z)*spring));
     if(slipOnGlassPlane) slip = true;
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
    float phi = atan2(a.x.y,a.x.x);
    PVector referenceToNormal = new PVector(
      Radius*cos(phi),Radius*sin(phi));
    if(normalVector().dot(PVector.sub(
      centroid(),referenceToNormal))<0){
      a = ao;
      b = co;
      c = bo;
    }
    if(normalVector().dot(PVector.sub(
      centroid(),referenceToNormal))<0){
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
  PVector[][]uv;
 
  bubble(){
    println("instantiating torus...");
    println("placing nodes...");
    nodes = new node[0];
    for(int i=0;i<Resolution;i++){
      float u = float(i)/Resolution*TWO_PI;
      for(int j=0;j<resolution;j++){
        float v = float(j)/resolution*TWO_PI;
        PVector torusPoint = new PVector(
          (Radius+radius*cos(v))*cos(u),
          (Radius+radius*cos(v))*sin(u),
          radius*sin(v));
        nodes = (node[]) append(nodes,new node(torusPoint));
      }
    }
    println("attaching elements...");
    elements = new element[0];
    for(int i=0;i<Resolution;i++){
      for(int j=0;j<resolution;j++){
        int ip = i+1;
        if(ip==Resolution){ip=0;}
        int jp = j+1;
        if(jp==resolution){jp=0;}
        int a = i * resolution + j;
        int b = ip * resolution + j;
        int c = i * resolution + jp;
        int d = ip * resolution + jp;
        elements = (element[]) append(elements,
          nodes[a].attach(nodes[b]));
        elements = (element[]) append(elements,
          nodes[a].attach(nodes[c]));
        elements = (element[]) append(elements,
          nodes[a].attach(nodes[d]));
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
    PVector center = new PVector(width/2,height/2,-(depth)/2);
    for(int i=0;i<nodes.length;i++){
      nodes[i].x.add(center);
    }
    for(int i=0;i<elements.length;i++){
      elements[i].setLength();
    }
    nominalVolume = 2*sq(PI)*Radius*sq(radius);
    println("torus successfully instantiated.");
    println(nodes.length + " nodes");
    println(elements.length + " elements");
    println(polygons.length + " polygons");
    println("nominalVolume " + nominalVolume);
     
     
      uv=new PVector[polygons.length][3];
   
    for(int i=0;i<polygons.length;i++){
       
     uv[i][0]=new PVector(map(polygons[i].a.x.x,0,width,0,t.width), map(polygons[i].a.x.y,0,height,0,t.height));
     uv[i][1]=new PVector(map(polygons[i].b.x.x,0,width,0,t.width), map(polygons[i].b.x.y,0,height,0,t.height));
     uv[i][2]=new PVector(map(polygons[i].c.x.x,0,width,0,t.width), map(polygons[i].c.x.y,0,height,0,t.height));
       
    }
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


PImage t;
void setup(){ 
size(500,400,P3D);
noCursor();
  noFill();
  noSmooth();
noLights();
initialize();}

void initialize(){    
 Resolution = highRes?32:12;
 resolution = highRes?16:6;
 Radius = highRes?64:32;
 radius = highRes?32:16;
// depth = highRes?400:400;
 //ortho(-width/2, width/2, -height/2, height/2); // JAVAscript-MODE, ugly vertex backsides, remove scale and translate from draw
 
  if(highRes)t=loadImage("1.jpg");
  else t=loadImage("0.jpg");
  t.resize(width,height);

bbl = new bubble();
 
  areaLimiter = sq((Radius+radius)*TWO_PI/Resolution)/2*sq(8);
  println(areaLimiter);
}

PImage shadowMap;

void draw(){
  if(frameCount%60==0){println("frameRate "+frameRate);}
 for(int m=0;m<16;m++){bbl.update();}
  
//   ortho(0, width, 0, height);//java only

  background(255);
  fill(100);
  beginShape(TRIANGLES);
  for(int i=0;i<bbl.polygons.length;i++){
    vertex(bbl.polygons[i].a.x.x  ,bbl.polygons[i].a.x.z+height,0);
    vertex(bbl.polygons[i].b.x.x  ,bbl.polygons[i].b.x.z+height,0);
    vertex(bbl.polygons[i].c.x.x  ,bbl.polygons[i].c.x.z+height,0);
  }
  endShape();
      stroke(100);
  strokeWeight(3);
line(mouseX,0,0,mouseX,height,0);
  noStroke();
//  perspective();//java only

  fill(255);
  
  shadowMap=get();
  
   if(javaMode){ 
   shadowMap.resize(128,128);//java only
   shadowMap.filter(BLUR,2 );//java only
 }
 

  background(#7307E8);




  if(bbl.kineticEnergy()>1073741824){
    bbl=new bubble();
    println("energy limit tripped!");
  }

stroke(255);
  beginShape(/*TRIANGLES*/);
  texture(shadowMap);
    vertex(0,height,-depth,0,0);
    vertex(width,height,-depth,shadowMap.width,0);
    vertex(width,height,0,shadowMap.width,shadowMap.height);
    vertex(0,height,0,0,shadowMap.height);
  endShape();
  
  noFill();
  stroke(255);
  pushMatrix();
  translate(width/2,height/2,-depth/2);
  box(width,height,depth);
  popMatrix();
    stroke(255,0,0);
line(mouseX,mouseY,0,mouseX,mouseY,-depth);
  noStroke();

if(javaMode){
// lights();
 pointLight(255,255,255,width/2,0,-depth/2);//java only
 pointLight(100,100,100,width/2,height/2,+depth/2);//java only
}

  fill(255);
  beginShape(TRIANGLES);
  texture(t);
  for(int i=0;i<bbl.polygons.length;i++){
    vertex(bbl.polygons[i].a.x.x  ,bbl.polygons[i].a.x.y,bbl.polygons[i].a.x.z,bbl.uv[i][0].x  ,bbl.uv[i][0].y);
    vertex(bbl.polygons[i].b.x.x  ,bbl.polygons[i].b.x.y,bbl.polygons[i].b.x.z,bbl.uv[i][1].x  ,bbl.uv[i][1].y);
    vertex(bbl.polygons[i].c.x.x  ,bbl.polygons[i].c.x.y,bbl.polygons[i].c.x.z,bbl.uv[i][2].x  ,bbl.uv[i][2].y);
     
//    vertex(bbl.polygons[i].a.x.x  ,bbl.polygons[i].a.x.y,bbl.polygons[i].a.x.z);
//    vertex(bbl.polygons[i].b.x.x  ,bbl.polygons[i].b.x.y,bbl.polygons[i].b.x.z);
//    vertex(bbl.polygons[i].c.x.x  ,bbl.polygons[i].c.x.y,bbl.polygons[i].c.x.z);
  }
  endShape();
//noLights();//java only
noFill();

}
int hold = -1;
void mousePressed(){
  for(int i=0;i<bbl.nodes.length;i++){
    PVector dx = new PVector();
    dx.x = bbl.nodes[i].x.x - mouseX;
    dx.y = bbl.nodes[i].x.y - mouseY;
    dx.z = 0;
    if(dx.mag()<12){
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
