
Coaster coaster;

void setup () {
  size(640, 360, P3D);
  frustum(-10, 10, -5, 5, 5, 4000);
  coaster = new Coaster();
}

void draw() {
  coaster.placeCamera();
  coaster.step();
  background(0,0,80);
  directionalLight(128, 128, 128, 0, 1, -0.5);
  ambientLight(50,50,50);
  coaster.draw();
}

class Coaster {
  float d;
  float vel;
  float acc;
  float g = 0.1;
  float friction = 0.9993;
  PVector pos, tng;

  ArrayList<Section> sections;
  ArrayList<Float> startDists;

  Coaster() {
    reset();
  }

  PVector getPos(float l) {
    int curIdx = getSection(l);
    if (curIdx == -1) {
      reset();
      curIdx=0;
    }
    Section curSec = sections.get(curIdx);
    return curSec.getPos(curSec.getu(l-startDists.get(curIdx)));
  }

  PVector getTangent(float l) {
    int curIdx = getSection(l);
    if (curIdx == -1) {
      reset();
      curIdx=0;
    }
    Section curSec = sections.get(curIdx);
    return curSec.getTangent(curSec.getu(l-startDists.get(curIdx)));
  }

  void reset() {
    sections = new ArrayList<Section>();
    startDists = new ArrayList<Float>();
    startDists.add(0.);
    float startX = random(2000);
    float startY = 0;
    for (int i = 0; i < 50; i++) {
      Section s;
      float endX = random(1000);
      float endY = random(1200);
      s = new ValleySection(        
      startX, i*100+startY, -1000*i, 
      startX, i*100+startY, -1000*i-500, 
      endX, i*100+endY+100, -1000*i-500, 
      endX, i*100+endY+100, -1000*i-1000);
      startX = endX;
      startY = endY;
      sections.add(s);
      startDists.add(s.len+startDists.get(i));
    }
    startDists.remove(startDists.size()-1);
    d = 0;
    vel = 1;
    pos = getPos(d);
    tng = getTangent(d);
    tng.normalize();
  }

  int getSection(float l) {
    for (int i = 0; i < startDists.size(); i++) {
      if (l < startDists.get(i) + sections.get(i).len) {
        return i;
      }
    }
    return -1;
  }

  void step() {
    acc = tng.y/tng.mag()*g;
    vel = vel*friction + acc;
    d += vel;
    pos = getPos(d);
    tng = getTangent(d);
    tng.normalize();
    vel = max(vel, 1.5);
  }

  void placeCamera() {
    camera(pos.x, pos.y-15, pos.z, 
    pos.x+tng.x, pos.y+tng.y-15, pos.z+tng.z, 0, 1, 0);
  }

  void draw() {
    int idx = getSection(d);
    for (int i = idx; i < min(sections.size(),idx+5); i++) {
      shape(sections.get(i).geom);
    }
  }
}

abstract class Section {
  float x0, y0, z0;
  float x1, y1, z1;
  float x2, y2, z2;
  float x3, y3, z3;

  int N = 2000;
  float[] d = new float[N];
  float len;
  
  PShape geom;

  Section(float x0, float y0, float z0, 
  float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float x3, float y3, float z3) {
    this.x0=x0;
    this.y0=y0;
    this.z0=z0;
    this.x1=x1;
    this.y1=y1;
    this.z1=z1;
    this.x2=x2;
    this.y2=y2;
    this.z2=z2;
    this.x3=x3;
    this.y3=y3;
    this.z3=z3;
    generateDists();
    generateGeom();
  }
  
  abstract void generateGeom();

  void draw() {
    bezierDetail(100);
    bezier(x0, y0, z0, 
    x1, y1, z1, 
    x2, y2, z2, 
    x3, y3, z3);
  }

  PVector getPos(float u) {
    float ou = 1-u;    
    float x = ou*ou*ou*x0 + 3*ou*ou*u*x1 + 3*ou*u*u*x2 + u*u*u*x3;
    float y = ou*ou*ou*y0 + 3*ou*ou*u*y1 + 3*ou*u*u*y2 + u*u*u*y3;
    float z = ou*ou*ou*z0 + 3*ou*ou*u*z1 + 3*ou*u*u*z2 + u*u*u*z3;
    return new PVector(x, y, z);
  }

  PVector getTangent(float u) {
    float ou = 1-u;
    float x = -3*ou*ou*x0 + (3*ou*ou - 6*ou*u)*x1 + (6*ou*u - 3*u*u)*x2 + 3*u*u*x3;
    float y = -3*ou*ou*y0 + (3*ou*ou - 6*ou*u)*y1 + (6*ou*u - 3*u*u)*y2 + 3*u*u*y3;
    float z = -3*ou*ou*z0 + (3*ou*ou - 6*ou*u)*z1 + (6*ou*u - 3*u*u)*z2 + 3*u*u*z3;
    return new PVector(x, y, z);
  }

  void generateDists() {
    PVector curPos;
    PVector prevPos = this.getPos(0);
    for (int i = 1; i < N; i++) {
      float u = i/float(N-1);
      curPos = getPos(u);
      d[i] = d[i-1] + 
      sqrt((curPos.x-prevPos.x)*(curPos.x-prevPos.x) +
      (curPos.y-prevPos.y)*(curPos.y-prevPos.y) +
      (curPos.z-prevPos.z)*(curPos.z-prevPos.z));
      prevPos = curPos;
    }
    len = d[N-1];
  }

  //todo: replace this with a binary search or a linear search in an interval around the last found index
  float getu(float l) {
    int end = 1;
    for (int i = 1; i < N; i++) {
      if (d[i] > l) {
        end = i;
        break;
      }
    }
    float fac = (l-d[end-1])/(d[end] - d[end-1]);
    return (end-1+fac)/float(N);
  }
}





class ValleySection extends Section {
  ValleySection(float x0, float y0, float z0, 
  float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float x3, float y3, float z3) {
    super(x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3);
  }

  void generateGeom() {
    noFill();
    stroke(255);
    geom = createShape(PShape.GROUP);
    int M = 30;
    PShape t = createShape(QUAD_STRIP);
    for (int i = 0; i <= M; i++) {
      PVector pos = getPos(getu(i*len/(M)-0.02));
      PVector tng = getTangent(getu(i*len/(M)-0.02));
      PVector yy = new PVector(0, 1, 0);
      PVector ort = yy.cross(tng);
      ort.normalize();
      ort.mult(10);
      t.vertex(pos.x+ort.x, pos.y+ort.y, pos.z+ort.z);
      t.vertex(pos.x-ort.x, pos.y-ort.y, pos.z-ort.z);
    }
    t.stroke(130);
    t.end();
    geom.addChild(t);
    
    t = createShape(QUAD_STRIP);
    for (int i = 0; i <= M; i++) {
      PVector pos = getPos(getu(i*len/(M)-0.02));
      PVector tng = getTangent(getu(i*len/(M)-0.02));
      PVector yy = new PVector(0, 1, 0);
      PVector ort = yy.cross(tng);
      ort.normalize();
      ort.mult(10);
      t.vertex(pos.x+ort.x, pos.y+ort.y, pos.z+ort.z);
      t.vertex(pos.x+ort.x*8, pos.y+ort.y*8-70, pos.z+ort.z*8);
    }
    t.noStroke();
    t.end();
    
    geom.addChild(t);
    
    t = createShape(QUAD_STRIP);
    for (int i = 0; i <= M; i++) {
      PVector pos = getPos(getu(i*len/(M)-0.02));
      PVector tng = getTangent(getu(i*len/(M)-0.02));
      PVector yy = new PVector(0, 1, 0);
      PVector ort = yy.cross(tng);
      ort.normalize();
      ort.mult(10);
      t.vertex(pos.x-ort.x, pos.y-ort.y, pos.z-ort.z);
      t.vertex(pos.x-ort.x*8, pos.y-ort.y*8-70, pos.z-ort.z*8);
    }
    t.noStroke();
    t.end();
    
    geom.addChild(t);
    geom.fill(65,100,222);
  }
}





























