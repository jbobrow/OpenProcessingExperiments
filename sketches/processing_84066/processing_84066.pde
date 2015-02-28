
ArrayList<PVector> points;
float[] d;
float pos = 0;
float vel = 0;
int N = 500;
PGraphics tr;
int curIdx = 0;

void setup() {
  size(800, 500);
  points = new ArrayList<PVector>();
  tr = createGraphics(width, height, JAVA2D);
  tr.beginDraw();
  tr.background(0);
  tr.endDraw();
  
  points.add(new PVector(0,0));
  points.add(new PVector(20,5));
  points.add(new PVector(40,10));
  points.add(new PVector(130,200));
  points.add(new PVector(300,200));
  points.add(new PVector(300,80));
  points.add(new PVector(250,50));
  points.add(new PVector(200,80));
  points.add(new PVector(200,200));
  points.add(new PVector(300,500));
  points.add(new PVector(700,0));
  points.add(new PVector(720,0));
  points.add(new PVector(740,0));
  generateDists();
  drawTrack();
  reset();
}

void draw() {
  background(0);
  image(tr, 0, 0);

  if (points.size() >= 4) {

    PVector p = getPos(getu(pos));
    PVector pt = getPos(getu(pos+0.1));
    PVector tng = PVector.sub(pt, p);
    tng.normalize();
    vel += tng.y/4.;
    pos += vel;
    if (pos > d[d.length-1]-0.2) {
      reset();
    }
    stroke(255);
    fill(255, 0, 0);
    ellipse(p.x, p.y, 8, 8);
  }
}

void reset() {
  pos = 0;
  vel = 0;
  curIdx = 0;
}

void mouseReleased() {
  points.add(new PVector(mouseX, mouseY));
  if (points.size() >= 4) {
    generateDists();
  }
  drawTrack();
}

void drawTrack() {
  tr.beginDraw();
  tr.background(0);
  tr.stroke(100);
  tr.noFill();
  for (int i = 0; i < points.size(); i++) {
    tr.ellipse(points.get(i).x, points.get(i).y, 5, 5);
  }
  if (points.size() >= 4) {
    for (int i = 0; i < points.size()-3; i++) {      
      for (int j = 0; j < 50; j++) {
        PVector prev = getPos(i+j/50.1);
        PVector cur = getPos(i+(j+1)/50.1);
        tr.stroke(255);
        tr.line(prev.x, prev.y, cur.x, cur.y);
      }
    }
  }
  tr.endDraw();
}

void generateDists() {
  d = new float[(points.size()-3)*N];
  d[0]=0;
  for (int i = 1; i<d.length; i++) {
    PVector prev = getPos((i-1)/(N+0.01));
    PVector cur = getPos(i/(N+0.01));
    d[i] = d[i-1] + dist(prev.x, prev.y, cur.x, cur.y);
  }
}

PVector getPos(float u) {
  int i = int(u);
  PVector p0 = points.get(i);
  PVector p1 = points.get(i+1);
  PVector p2 = points.get(i+2);
  PVector p3 = points.get(i+3);
  float x = blendFunction(p0.x, p1.x, p2.x, p3.x, u-i);
  float y = blendFunction(p0.y, p1.y, p2.y, p3.y, u-i);
  return new PVector(x, y);
}

float getu(float l) {
  int idx = -1;
  if (vel >= 0) {
    for (int i = curIdx; i < d.length; i++) {
      if (d[i] > l) {
        idx = i;
        break;
      }
    }
  }
  else {
    for (int i = curIdx+1; i >= 0; i--) {
      if (d[i] < l) {
        idx = i+1;
        break;
      }
    }
  }
  curIdx = idx;
  if (idx <= 0) {
    reset();
    idx = 1;
  }
  float fac = (l-d[idx-1])/(d[idx] - d[idx-1]);
  return (idx-1+fac)/N;
}

float blendFunction(float p0, float p1, float p2, float p3, float t) {
  float g0 = -1*p0 + 3*p1 - 3*p2 + 1*p3;
  float g1 =  3*p0 - 6*p1 + 3*p2;
  float g2 = -3*p0 + 3*p2;
  float g3 = 1*p0 + 4*p1 + 1*p2;
  return (g0*t*t*t + g1*t*t + g2*t + g3)/6;
}

void keyPressed() {
  points.clear();
  drawTrack();
  d=null;
  reset();
}


