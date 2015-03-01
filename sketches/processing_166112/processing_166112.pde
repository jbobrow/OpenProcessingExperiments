
PImage bk1;

ArrayList<Ball> firebugs;

void setup() {
  bk1=loadImage("fireflies.jpg");  //load image once in setup
  size(800, 600, P2D);
  frameRate(30);
  smooth();
  firebugs=new ArrayList<Ball>();
  for (int i=0; i<120; i++) {
    firebugs.add(new Ball(int(random(width)), int(random(height)), int(random(-2, 2)), int(random(-2, 2)),int(random(4,9))));
  }
}

void draw() {
  image(bk1, 0, 0);

for(Ball f:firebugs){
  f.display();
  f.moveBug();
  for(Ball other:firebugs){
    if(f!=other){
      if(f.overlaps(other)){
        f.gravity();
      }
    }
  }
}

  for (int i=0;i<firebugs.size()-1; i++) {
    Ball firebug=firebugs.get(i);
    firebug.moveBug();
  }
}

void mousePressed() {
  firebugs.add(new Ball(mouseX, mouseY, int(random(-2, 2)), int(random(-2, 2)),int(random(2,5))));
}


class Ball {
  float x;
  float y;
  float xdir;   
  float ydir;   
  float diameter;
//  float xoff=0.0;
//  float yoff=1000;

  Ball(int tx, int ty, int txdir, int tydir, int tdiameter) {
    x=tx;
    y=ty;
    xdir=txdir;
    ydir=tydir;
    diameter=tdiameter;
  }

  void display() {
    int bcolor=color(255, 255, random(13), random(255));
    fill(bcolor, 100);
    stroke(bcolor);
    ellipse(x, y, diameter+10, diameter+10);
    fill(255, 180);
    ellipse(x, y, diameter, diameter);
  }

  void moveBug() {
    y=y-ydir;
    x=x-xdir;
    //    xoff = xoff + .01;
    //    yoff = yoff + .01;
    //    x=map(noise(xoff),0,1,0,width);
    //    y=map(noise(yoff),0,1,0,height);
  }

  void gravity() {
    ydir=ydir+0.2;
    xdir=xdir+0.1;
    diameter=diameter+0.3;
  }

  boolean overlaps(Ball other) {
    float d = dist(x, y, other.x, other.y);
    if (d < diameter + other.diameter) {
      return true;
    } else {
      return false;
    }
  }
}



