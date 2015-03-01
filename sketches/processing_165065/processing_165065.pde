

Object[] obj = new Object[5];
Object mouseObj;
boolean done = true;

int t=0;
void setup() {
  rectMode(CENTER);

  size(600, 300);
  noStroke();
  for (int i=0;i<obj.length;i++) {
    obj[i] = new Object(random(width), random(height), random(40,100), random(40,100));
  }
  mouseObj = new Object(20, 20);
  background(255);
}

void draw() {
  background(255);
  mouseObj.position( new Point(mouseX, mouseY) );  
  mouseObj.drawMe(obj);

  done=true;
  for (int i=0;i<obj.length;i++) {
    obj[i].drawMe();
    obj[i].animate();
    obj[i].nearMiddle();

    if ( obj[i].getActive() ) {
      done=false;
    }
  }
  
  if (!done) {  
    t++;
  }
  
  textFont( createFont("Courier", 32) );
  fill(255, 20, 20, 155);
  text(t, 20, 40);
}

void mousePressed() {
  for (int i=0;i<obj.length;i++) {
    obj[i] = new Object(random(width), random(height), random(30, 100), random(30, 100));
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
    c = color(50, 50, 50, 50);
  }
  public void position( Point p) {
    this.p = p;
  }
  public boolean getActive() {
    return active;
  }
  public void nearMiddle() {
    if (  magnatude( width/2, this.p.x) <  40 && magnatude( height/2, this.p.y) <  40 ) {
      active=false;
      c = color(230, 50, 50, 100);
    }
  }

  public void animate() {
    if (!active) {
      return;
    }

    float xDist = width/2 - this.p.x;
    p.x+= map(xDist, width/2, (-1)*(width/2), 1, -1);

    float yDist = height/2 - this.p.y;
    p.y+= map(yDist, height/2, (-1)*(height/2), 1, -1);
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
    rect(p.x, p.y, w, h);
  }

  public void drawMe(Object[] otherThing) {
    for (int i=0;i<otherThing.length;i++) {
      if ( magnatude(this.p.x, otherThing[i].p.x) < (otherThing[i].w/2+this.w/2) &&
        magnatude(this.p.y, otherThing[i].p.y)< (otherThing[i].h/2 + this.h/2) 
        ) {
        fill(255, 0, 0);

        float xDist = this.p.x - otherThing[i].p.x;
        otherThing[i].p.x += map(xDist, ( (-1)*otherThing[i].w), (otherThing[i].w), 3, -3);

        float yDist = this.p.y - otherThing[i].p.y;
        otherThing[i].p.y += map(yDist, ( (-1)*otherThing[i].h), (otherThing[i].h), 3, -3);
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

