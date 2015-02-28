
//By Homero Rosas
//Inspired by Open Processising
//10/11/11


int n = 250;
int edgeBuffer = 20;
int neighborDistance = 20;
boolean threeD = true;
boolean followMouse = true;
boolean showLines = false;
float accDamp = 0.1;
float clr;
float clg;
float clb;

PVector[] loc;
PVector[] vel;
PVector avgLoc;
PVector center;

PVector[] trace;
int traceIndex;
int traceCount;

void setup() {
  size(1000, 500);
  smooth();
  noStroke();
  
  fill(0, 230);
  clr = 0;
  clg = 500;
  clb = 0;
  
  reset();
  update();
}

void reset() {
  loc = new PVector[n];
  vel = new PVector[n];

  for (int i = 0; i < n; i++) {
    loc[i] = new PVector(random(width), random(height), threeD ? random(height) : 0);
    vel[i] = new PVector(random(-100, 100), random(-100, 100), threeD ? random(-100, 100) : 0);
    vel[i].normalize();
  }

  avgLoc = new PVector(width/2, height/2, threeD ? height/2 : 0);
  center = new PVector(width/2, height/2, threeD ? height/2 : 0);

  trace = new PVector[1000];
  traceIndex = round(random(n));
  traceCount = 0;
}

void draw() {
  background(255);

  // draw locs
  noStroke();
  fill(clr,clg,clb);
  PVector l;
  for (int i = 0; i < n; i++) {
    l = loc[i];
    rect(l.x, l.y, 10, 10);
  }
if (key == 'q')
 {clr= 500;
 clg= 0;
 clb= 0;
 }
 
 if (key == 'e')
 {clr= 0;
 clg= 0;
 clb= 500;
 }
 
  if (showLines) {

    // draw lines
    stroke(0, 50);
    noFill();
    ellipse(avgLoc.x, avgLoc.y, 10, 10);
    line(0, avgLoc.y, width, avgLoc.y);
    line(avgLoc.x, 0, avgLoc.x, height);

    // draw trace
    noStroke();
    fill(255, 0, 0, 30);
    for (int i = 0; i < trace.length; i++) {
      if (trace[i] != null) {
        ellipse(trace[i].x, trace[i].y, 2, 2);
      }
    }
  }

  recordTrace();
  update();
}

void recordTrace() {
  trace[traceCount++ % trace.length] = PVector.mult(loc[traceIndex], 1);
}

void update() {
  float xsum = 0;
  float ysum = 0;
  float zsum = 0;

  PVector l;
  PVector v;
  PVector a;
  PVector diff;
  for (int i = 0; i < n; i++) {
    l = loc[i];
    v = vel[i];

    a = PVector.sub(avgLoc, l); // gravitate towards avgLoc

    // avoid edges
    if (l.x < edgeBuffer || l.y < edgeBuffer || l.x > width-edgeBuffer || l.y > height-edgeBuffer) {
      a.add(PVector.sub(center, l));
    }

    // avoid neighbors
    if (true || random(1) > 0.25) {
      //for (int j = i+1; j < n; j++) {  // avoid first I see
      for (int j = 0; j < n; j++) {  // avoid any
        if (i != j) {
          diff = PVector.sub(l, loc[j]);
          if (diff.mag() < neighborDistance) {
            a.add(diff);
          }
        }
      }
    }

    a.normalize();
    a.mult(accDamp);

    xsum += l.x;
    ysum += l.y;
    zsum += l.z;

    v.add(a);
    v.normalize();
    l.add(v);
  }

  avgLoc = followMouse ? new PVector(mouseX, mouseY) : new PVector(xsum / n, ysum / n, zsum / n);
}

void mouseClicked() {
  reset();
  clr=205;
  clg=255;
  clb=25;
}

void keyPressed() {
  if (key == 'x') {
    showLines = !showLines;
  }
  if (key == 'a') {
    mouseX=mouseX-5;
  }  
  if (key == 's') {
    mouseY=mouseY+5;
  }  
  if (key == 'd') {
    mouseX=mouseX+5;
  }  
  if (key == 'w') {
    mouseY=mouseY-5;
  }
}




