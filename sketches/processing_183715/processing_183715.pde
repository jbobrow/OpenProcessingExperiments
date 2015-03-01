
ArrayList <Triangle> triangles = new ArrayList<Triangle>();
boolean dividing = false;
boolean zooming = false;
float divideStep = 0;
int zoomStep = 0;
float strokeSize = 4;

void setup() {
  size(700, 700);
  noStroke();
  makeWheel();
  redrawAll(triangles);
  textAlign(CENTER, CENTER);
  textSize(18);
  showMessage("Click with mouse to subdivide triangles!\n \nPress space bar to zoom!");
}

void draw() {
  float triangleSize = dist(triangles.get(0).vert[0].x, triangles.get(0).vert[0].y, triangles.get(0).vert[1].x, triangles.get(0).vert[1].y); 
  strokeSize = triangleSize/50;
  float ds = 0.6*exp(-0.009*triangleSize);
  if (dividing) {
    ArrayList<Triangle> temp = new ArrayList<Triangle>();
    if (divideStep < 1) {
      temp = subdivide(triangles, divideStep);
      redrawAll(temp);
      divideStep += ds;
    } else {
      triangles = subdivide(triangles, 1);
      dividing = false;
      redrawAll(triangles);
    }
  }
  if (zooming) {
    if (zoomStep < 10) {
      triangles = zoom(1.0493);
      redrawAll(triangles);
      zoomStep++;
    } else {
      zooming = false;
      zoomStep = 0;
    }
  }
  if (mousePressed) {
    if (!dividing && !zooming) {
      if (triangles.size() < 1000) {
        dividing = true;
        divideStep = 0;
      } else {
        showMessage("Zoom before subdiving!\n \nPress space bar!");
      }
    }
  }
  if (keyPressed) {
    if (!dividing && !zooming && key==' ') {
      if (triangleSize < width/4) {
        zooming = true;
      } else {
        showMessage("Subdivide before zooming!\n \nClick with mouse!");
      }
    }
  }
}

void showMessage(String msg) {
  fill(0);
  rect(width/2-200, height/2-50, 400, 100);
  fill(224, 224, 224);
  text(msg, width/2, height/2);
}

void makeWheel() {
  PVector origin = new PVector(width/2, height/2);
  float r = 0.5*width;
  for (int i = 0; i < 10; i++) {
    PVector b = new PVector(origin.x + r*cos((2*i-1)*PI/10), origin.y + r*sin((2*i-1)*PI/10));
    PVector c = new PVector(origin.x + r*cos((2*i+1)*PI/10), origin.y + r*sin((2*i+1)*PI/10));
    if (i%2 == 0) { //mirror every second triangle
      PVector temp = b;
      b = c;
      c = temp;
    }
    triangles.add(new Triangle(true, origin, b, c));
  }
}

ArrayList<Triangle> subdivide(ArrayList<Triangle> tList, float s) {
  ArrayList<Triangle> result = new ArrayList<Triangle>();
  float phi = (1 + sqrt(5))/2;
  for (int i = 0; i < tList.size (); i++) {
    Triangle t = tList.get(i);
    Triangle t1, t2, t3;
    if (t.red) {
      PVector p = new PVector(t.vert[0].x +s*(t.vert[1].x - t.vert[0].x)/phi, t.vert[0].y +s*(t.vert[1].y - t.vert[0].y)/phi);
      addToList(result, new Triangle(true, t.vert[2], p, t.vert[1]));
      addToList(result, new Triangle(false, p, t.vert[2], t.vert[0]));
    } else {
      PVector q = new PVector(t.vert[0].x - (1-1/phi)*s*(t.vert[0].x - t.vert[1].x), t.vert[0].y - (1-1/phi)*s*(t.vert[0].y - t.vert[1].y) );
      PVector r = new PVector(t.vert[1].x + (t.vert[2].x - t.vert[1].x)/phi, t.vert[1].y + (t.vert[2].y - t.vert[1].y)/phi );
      addToList(result, new Triangle(false, r, t.vert[2], t.vert[0]));
      addToList(result, new Triangle(false, q, r, t.vert[1]));
      addToList(result, new Triangle(true, r, q, t.vert[0]));
    }
  }
  return result;
}

void redrawAll(ArrayList<Triangle> tList) {
  background(0);
  for (int i = 0; i < tList.size (); i++) {
    tList.get(i).redraw();
  }
}

void addToList(ArrayList<Triangle> tList, Triangle t) {
  if ((t.vert[0].x >= 0 && t.vert[0].x <= width && t.vert[0].y >= 0 && t.vert[0].y <= height) || 
    (t.vert[1].x >= 0 && t.vert[1].x <= width && t.vert[1].y >= 0 && t.vert[1].y <= height) ||
    (t.vert[2].x >= 0 && t.vert[2].x <= width && t.vert[2].y >= 0 && t.vert[2].y <= height)) {
    tList.add(t);
  }
}

ArrayList<Triangle> zoom(float factor) {
  PVector origin = new PVector(width/2, height/2);
  ArrayList<Triangle> result = new ArrayList<Triangle>();
  PVector[] v = new PVector[3];
  for (int i = 0; i < triangles.size (); i++) {
    for (int j = 0; j < 3; j++) {
      float r = dist(origin.x, origin.y, triangles.get(i).vert[j].x, triangles.get(i).vert[j].y);
      float angle = atan2(triangles.get(i).vert[j].y - origin.y, triangles.get(i).vert[j].x - origin.x);
      v[j] = new PVector(origin.x + r*factor*cos(angle), origin.y + r*factor*sin(angle));
    }
    addToList(result, new Triangle(triangles.get(i).red, v[0], v[1], v[2])) ;
  }
  return result;
}

class Triangle {
  
  boolean red;
  PVector[] vert = new PVector[3];
  color c1 = color(0, 0, 0);
  color c2 = color(255, 255, 255);
  color c3 = color(124, 124, 124);
  
  Triangle(boolean red, PVector a, PVector b, PVector c) {
    this.red = red;
    this.vert[0] = a;
    this.vert[1] = b;
    this.vert[2] = c;
  }
  
  void redraw() {
    if (red) {
      fill(c2);
      stroke(c2);
    } else {
      fill(c1);
      stroke(c1);
    }
    strokeWeight(1);
    triangle(vert[1].x, vert[1].y, vert[0].x, vert[0].y, vert[2].x, vert[2].y);
    stroke(c3);
    strokeWeight(strokeSize);
    line(vert[1].x, vert[1].y, vert[0].x, vert[0].y);
    line(vert[0].x, vert[0].y, vert[2].x, vert[2].y);
    noStroke();
  }

  
}


