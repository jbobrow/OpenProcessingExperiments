
int minSize=30;
int maxSize=80;
Object[] obj = new Object[40];

float targetDim = 40;

void setup() {
  rectMode(CENTER);
  textFont( createFont("Courier",14));
  //size(1380, 800);
   size(800, 400);
  noStroke();
  for (int i=0;i<obj.length;i++) {
    float s =  random(minSize, maxSize);
    obj[i] = new Object(random(width), random(height), s, s);
  }

  background(0);
}
int t=0;
void draw() {
  background(255);

  for (int i=0;i<obj.length;i++) {
    obj[i].drawMe(obj);
    obj[i].animate();
  }  
}

void keyPressed() {
  background(0);
}

void mousePressed() {
  for (int i=0;i<obj.length;i++) {
    float s = random(minSize, maxSize);
    obj[i] = new Object(random(width), random(height), s, s);
  }
}

class Object {

  Point p;
  float w;
  float h;
  boolean active=true;
  color c;
  public Object(float x, float y) {
    this.p = new Point(x, y);
    w=20;
    h=20;
  }

  public Object(float x, float y, float w, float h) {
    this.p = new Point(x, y);
    this.w = w;
    this.h = h;
    c = color(10, 250, 50, 90);
  }
  public void position( Point p) {
    this.p = p;
  }
  public boolean getActive() {
    return active;
  }


  public void animate() {
    if (!active) {
      return;
    }

    float xDist = width/2 - this.p.x;
    p.x+= map(xDist, width/2, (-1)*(width/2), w/40, -1*(w/40) )*1;

    float yDist = height/2 - this.p.y;
    p.y+= map(yDist, height/2, (-1)*(height/2), h/40, -1*(h/40) )*1;
  }

  public void drawMe() {
    noFill();
    fill(c);
    rect(p.x, p.y, w, h);
  }

  public void drawMe(Object otherThing) {
    if ( magnatude(this.p.x, otherThing.p.x) < (otherThing.w/2+this.w/2) &&
      magnatude(this.p.y, otherThing.p.y) < (otherThing.h/2 + this.h/2) 
      ) {
      fill(255, 0, 0);
    }
    else {
      fill(50, 50, 50);
    }
//    rect(p.x, p.y, w, h);

  }

  public void drawMe(Object[] otherThing) {
    for (int i=0;i<otherThing.length;i++) {
      if ( magnatude(this.p.x, otherThing[i].p.x) < (otherThing[i].w/2+this.w/2) &&
        magnatude(this.p.y, otherThing[i].p.y)< (otherThing[i].h/2 + this.h/2) 
        ) {

        float xDist = this.p.x - otherThing[i].p.x;
        otherThing[i].p.x += map(xDist, ( (-1)*otherThing[i].w), (otherThing[i].w), w/40, -1*(w/40) )*1;

        float yDist = this.p.y - otherThing[i].p.y;
        otherThing[i].p.y += map(yDist, ( (-1)*otherThing[i].h), (otherThing[i].h), h/40, -1*(h/40) )*1;
      }
    }

    stroke(0);
    fill(c);
    strokeWeight(0.4);
    rect(p.x, p.y, w, h);
    point(p.x, p.y);
        fill(0);
    text("hello",int(p.x)-w/2+2,int(p.y)+10);
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

