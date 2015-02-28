
float separation=0;
boolean dorotation = false;
boolean dofib = false;
int fib1=1,fib2=1;
int coloridx = 40;

class Rect {
  int x1,y1,x2,y2;
  color rfill;

  boolean scratched=false;
  Rect(int xx1,int yy1, int xx2, int yy2) {
    x1=xx1;y1=yy1;x2=xx2;y2=yy2;
    scratched = (x2-x1)>10 && (y2-y1)>12 && random(0,1)<0.25 && separation > 1;
  }
  boolean intersect(Rect r) {
    return max(0,min(x2,r.x2)-max(x1,r.x1)) > 0
          && max(0,min(y2,r.y2)-max(y1,r.y1)) > 0;
  }
  void draw() {
    int nx1 = x1 + separation;
    int nx2 = x2 - separation;
    int ny1 = y1 + separation;
    int ny2 = y2 - separation;
    int sx = nx2-nx1;
    int sy = ny2-ny1;
    if(scratched) {
      PGraphics g = createGraphics(sx+2,sy+2);
      g.beginDraw();
      g.smooth();
      g.noStroke();
      g.background(255,0);
      g.fill(color(hue(rfill)-10,saturation(rfill),brightness(rfill)+10));
      g.rect(2,2,sx,sy);
      g.noFill();
      g.stroke(255,20);
      g.strokeWeight(1);
      for(int i=0;i<200;i++) {
        g.ellipse(random(-10,sx+20),random(-10,sy+20),random(sx),random(sy));
      }
      g.endDraw();
      image(g,nx1-1,ny1-1);
    } else { 
      fill(rfill);
      rect(nx1,ny1,nx2,ny2);
    }
  }
}
 
ArrayList<Rect> rects;
 
void setup() {
  size(450,800);
  noStroke();
  smooth();
  rectMode(CORNERS);
  colorMode(HSB,255);
  initialize();
}

float sizebase;
 
void initialize() {
  background(19,10,235);
  resetMatrix(); 
  separation=random(-1,3);
  dorotation = random(0,1)<0.5;
  rects = new ArrayList<Rect>();
  rects.add(new Rect(0,0,450,120));
  rects.add(new Rect(0,680,450,800));
  rects.add(new Rect(0,0,30,800));
  rects.add(new Rect(420,0,450,800));
  sizebase = 100;
  dofib = random(0,1)<0.25;
  fib1=1;
  fib2=1;
  coloridx = random(0,1)<0.7 ? 0 : (int)random(30,50);
}

void mouseClicked() {
  initialize();
}

void nextFib() {
  int n = fib1 + fib2;
  fib1 = fib2;
  fib2 = n;
}

void draw() {
  
  int size = (int)(sizebase+random(-5,5));
  boolean intersect = true;
  Rect r = null;
  int iters = 0;
  while(intersect && sizebase > 5) {
    int x = (int)random(30,420);
    int y = (int)random(120,680);
    r = new Rect(x,y,x+size+random(-2,2),y+size+random(-2,2));
    boolean n = false;
    for(Rect rr : rects)
      n = n || r.intersect(rr);
    intersect = n;
    iters++;
    if(iters>20000 && intersect) {
      iters = 0;
      sizebase *= 0.95;
      size = (int)(sizebase+random(-5,5));
    } 
  }
   
  if(!intersect) {
    rects.add(r);
  
    pushMatrix();
    if(dorotation) {
     translate(width/2,height/2);
     rotate(random(-0.05,0.05));
     translate(-width/2,-height/2);
    }
     
     
    if(dofib && (rects.size()-15) == fib2) {
      r.rfill=color(30);
      nextFib();
    } else {
      if(coloridx == rects.size())
        r.rfill=color(random(0,255),100,70);
      else
        r.rfill=color(70);
    }
    r.draw();
    popMatrix();
  }

}
