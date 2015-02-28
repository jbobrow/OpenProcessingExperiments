
BoxArray ba;
Box[] bs;
PVector u,v,p;

void setup() {
  size(600, 600);
  bs = new Box[3];
  bs[0] = new Box(4*width/5,2*height/3);
  bs[1] = new Box(width/5,2*height/3);
  bs[2] = new Box(width/2,height/3);
  ba = new BoxArray(bs);
  u = new PVector();
  v = new PVector();
}

void draw() {
  background(100);
  strokeWeight(1);
  stroke(0);
  ba.on(mouseX, mouseY);
  ba.display();
  strokeWeight(2);
  u.set(bs[2].x-bs[1].x, bs[2].y-bs[1].y,0);
  v.set(bs[0].x-bs[1].x, bs[0].y-bs[1].y,0);
  p = Proj(u,v);
  arrow(bs[1].x, bs[1].y, bs[0].x, bs[0].y);
  stroke(0,0,120);
  arrow(bs[1].x, bs[1].y, bs[2].x, bs[2].y);
  stroke(0,255,0);
  arrow(bs[1].x, bs[1].y, bs[1].x+p.x, bs[1].y+p.y);
  stroke(120,0,120);
  arrow(bs[1].x+p.x, bs[1].y+p.y, bs[2].x, bs[2].y);
}
void mousePressed() {
  ba.down();
}
void mouseReleased() {
  ba.up();
}
void keyTyped() {
  if( key == 'u' ) {
    bs[2].x = mouseX;
    bs[2].y = mouseY;
  } else if( key == 'v' ) {
    bs[0].x = mouseX;
    bs[0].y = mouseY;
  } else if( key == 'o' ) {
    bs[1].x = mouseX;
    bs[1].y = mouseY;
  }
}
float Dot(PVector u, PVector v) {
  return u.x*v.x+u.y*v.y+u.z*v.z;
}
float Norm(PVector u) {
  return sqrt(Dot(u,u));
}
PVector Unit(PVector u) {
  return Mult(Norm(u),u);
}
PVector Mult(float c, PVector u) {
  PVector p = new PVector(c*u.x,c*u.y,c*u.z);
  return p;
}
PVector Proj(PVector u, PVector v) { // projection of u onto v: proj_v (u)
  PVector p = Mult(Dot(u,v)/Dot(v,v),v);
  return p;
}


void arrow(float xtail, float ytail, float xtip, float ytip, float magnitude) {
  PVector v = new PVector(xtip-xtail,ytip-ytail);
  v.setMag(magnitude);
  arrow(xtail, ytail, xtail+v.x, ytail+v.y);
}
void arrow(float xtail, float ytail, float xtip, float ytip) {
  // Source: http://mathforum.org/library/drmath/view/54146.html
  float wingtheta = radians(30), arrowlength = dist(xtip,ytip,xtail,ytail), winglength = 0.5*arrowlength;
  float m = (ytip-ytail)/(xtip-xtail), n = tan(wingtheta), xw, yw;
  if( winglength > 10 ) {
    winglength = 10;
  }
  xw = xtip - ((xtip-xtail)-n*(ytip-ytail))/sqrt(1+pow(n,2))*(winglength/arrowlength);
  yw = ytip - ((ytip-ytail)+n*(xtip-xtail))/sqrt(1+pow(n,2))*(winglength/arrowlength);
  line(xtip,ytip,xw,yw);
  n = -n;
  xw = xtip - ((xtip-xtail)-n*(ytip-ytail))/sqrt(1+pow(n,2))*(winglength/arrowlength);
  yw = ytip - ((ytip-ytail)+n*(xtip-xtail))/sqrt(1+pow(n,2))*(winglength/arrowlength);
  line(xtip,ytip,xw,yw);
  line(xtail,ytail,xtip,ytip);
}

void roundarrow(float cx, float cy, float tstart, float tend, float radius) {
  float arclength = (tend-tstart)*radius;
  float sc = arclength/radius*0.4;
  float xstart = cx + radius*cos(tstart);
  float ystart = cy + radius*sin(tstart);
  float xend = cx + radius*cos(tend);
  float yend = cy + radius*sin(tend);
  arc(cx,cy,2*radius,2*radius,tstart,tend);
  arrow(xend+sc*(radius*(sin(tend))),
        yend-sc*(radius*(cos(tend))),
        xend,
        yend);
}

class BoxArray {
  Box[] boxes;
  float[] onboxes;
  int nboxes;
  int closestindex = -1;
  boolean dragging = false;
  PVector downat = new PVector();
  BoxArray(int nboxesin) {
    nboxes = nboxesin;
    boxes = new Box[nboxes];
    onboxes = new float[nboxes];
    for ( int i = 0; i < nboxes; i++ ) {
      boxes[i] = new Box(random(width), random(height));
      onboxes[i] = 0;
    }
  }
  BoxArray(Box[] bin) {
    boxes = bin;
    nboxes = bin.length;
    onboxes = new float[nboxes];
    for ( int i = 0; i < nboxes; i++ ) {
      onboxes[i] = 0;
    }
  }
  void down() {
    if ( closestindex >= 0 && dragging == false ) {
      dragging = true;
      downat.set(mouseX-boxes[closestindex].x, mouseY-boxes[closestindex].y, 0);
    }
  }
  void up() {
    dragging = false;
  }
  void on(float xin, float yin) {
    if ( dragging ) {
      boxes[closestindex].move(xin-downat.x, yin-downat.y);
    } 
    else {
      boolean overone = false;
      for ( int i = 0; i < nboxes; i++ ) {
        onboxes[i] = boxes[i].on(xin, yin);
        if ( onboxes[i] > 0 ) {
          overone = true;
        }
      }
      if ( overone ) {
        float closestdist = boxes[0].w+boxes[0].tolerance+1;
        for ( int i = 0; i < nboxes; i++ ) {
          if ( onboxes[i] != 0 && onboxes[i] < closestdist ) {
            closestindex = i;
            closestdist = onboxes[i];
          }
        }
      } 
      else {
        closestindex = -1;
      }
    }
  }
  void display() {
    fill(255);
    for ( int i = 0; i < nboxes; i++ ) {
      boxes[i].display();
    }
    if ( closestindex >= 0 ) {
      fill(122);
      boxes[closestindex].display();
    }
  }
}
class Box {
  float x, y, w=5;
  float tolerance = 5;

  Box(float xin, float yin) {
    x = xin;
    y = yin;
    rectMode(RADIUS);
  }
  void display() {
    rect(x, y, w, w);
  }
  float on(float xin, float yin) {
    if ( abs(xin-x)<=w+tolerance && abs(yin-y)<=w+tolerance ) {
      return dist(xin, yin, x, y);
    } 
    else {
      return 0;
    }
  }
  void move(float xin, float yin) {
    x = xin;
    y = yin;
  }
}



