
Segment first, last, seg;
int hu;

void setup(){
  first = null;
  last = null;
  size(600,600);
  strokeWeight(5);
  smooth();
  colorMode(HSB);
  hu = 0;
}

void draw(){
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  
  if (first != null){
    if(frameCount%2 == 0){
      first = first.next;
      if (first != null)
        first.prev = null;
    }
  }
  
  if (last != null){
    if (last.prev != null){
      seg = last.prev;
      while (seg != null){
        seg.x += seg.xv;
        seg.y += seg.yv;
        seg = seg.prev;
      }
    }
  }
  
  stroke( 100, 160, map(sin(frameCount*0.3),-1,1,80,250));
  hu+=5;
  if (hu>255) hu=0;
  
  noFill();
  beginShape();
  if (first != null)
    curveVertex(first.x, first.y);
  seg = first;
  while (seg != null){
    curveVertex(seg.x, seg.y);
    seg = seg.next;
  }
  if (last != null)
    curveVertex(last.x, last.y);
  endShape();
}

class Segment{
  public float x,y;
  public float xv,yv;
  public Segment next, prev;
  
  public Segment(float xx, float yy){
    x = xx;
    y = yy;
    next = null;
  }
}

void mouseDragged(){
  Segment mo = new Segment(mouseX,mouseY);
  if (first == null){
    first = mo;
    last = mo;
    last.xv = 0;
    last.yv = 0;
  } else {
    last.next = mo;
    mo.prev = last;
    last = mo;
    last.xv = constrain((last.x-last.prev.x)*0.3, -4,4);
    last.yv = constrain((last.y-last.prev.y)*0.3, -4,4);
  }
}


