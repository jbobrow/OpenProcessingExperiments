

Object[] obj = new Object[5];
Object mouseObj;

void setup() {
  rectMode(CENTER);

  size(600, 300);
  noStroke();
  for (int i=0;i<obj.length;i++) {
    obj[i] = new Object(random(width), random(height), random(100), random(100));
  }
  mouseObj = new Object(20, 20);
  background(255);
}

void draw() {
  background(255);

  mouseObj.p.x = mouseX;
  mouseObj.p.y = mouseY;

  mouseObj.drawMe(obj);

  for (int i=0;i<obj.length;i++) {
    obj[i].drawMe();
  }
}

void mousePressed() {
  for (int i=0;i<obj.length;i++) {
    obj[i] = new Object(random(width), random(height), random(100), random(100));
  }
}

class Object {
  Point p;
  float w;
  float h;

  public Object(float x, float y) {
    this.p = new Point(x, y);
    w=20;
    h=20;
  }

  public Object(float x, float y, float w, float h) {
    this.p = new Point(x, y);
    this.w = w;
    this.h = h;
  }

  public void drawMe() {
    noFill();
    fill(50, 50, 50,50);
    rect(p.x, p.y, w, h);
  }

  public void drawMe(Object otherThing) {
    if ( magnatude(this.p.x, otherThing.p.x) < (otherThing.w/2+this.w/2) &&
      magnatude(this.p.y, otherThing.p.y)< (otherThing.h/2 + this.h/2) 
      ) {
      fill(255, 0, 0);
      
    }
    else {
      fill(50, 50, 50);
    }
    rect(p.x, p.y, w, h);
  }
  public void drawMe(Object[] otherThing) {
    for (int i=0;i<otherThing.length;i++) {
      if ( magnatude(this.p.x, otherThing[i].p.x) < (otherThing[i].w/2+this.w/2) &&
           magnatude(this.p.y, otherThing[i].p.y)< (otherThing[i].h/2 + this.h/2) 
        ) {
        fill(255, 0, 0);
        otherThing[i] = new Object(random(width), random(height), random(100), random(100));
      }
      else {
        //fill(50, 50, 50);
      }
    }
    rect(p.x, p.y, w, h);
  }
  private float magnatude(float a, float b) {
    float returnValue = a - b;

    if ( returnValue < 0) {
      returnValue*=(-1);
    }
    return returnValue;
  }
}

class Point {
  float x=0;
  float y=0;
  public Point(float x, float y) {
    this.x=x;
    this.y=y;
  }
}

