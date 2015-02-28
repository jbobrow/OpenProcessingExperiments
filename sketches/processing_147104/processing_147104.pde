
Segment first;
int iterationsLeft;

void setup() {
    size(600,520);
    background(255);
    stroke(0);
    strokeWeight(.5);
    smooth();
    noLoop();
    
    iterationsLeft = 5; //max allowed
    
    first = new Segment(.5*width,.1*height,.8*width,.7*height);
    Segment second = new Segment(first, .2*width, .7*height);
    Segment third = new Segment(second, first.start.x, first.start.y);
        
}

void mousePressed() {
    if ( iterationsLeft > 0 ) {
      first.addBump();
      iterationsLeft--;
    } else { 
      setup();
    }
    
    redraw();
}

void draw() {
    background(255);
    textSize(20);
    fill(0,0,255);
    text("iterations remaining:  " + iterationsLeft,20,40);
    fill(255,0,255);
    text("click anywere to iterate.",20,height-20);
    first.render();
    
}

/*
 * Every line segment has a starting point and ending point, in addition
 * to a reference to the next segment -- a linked list of Segments
 */
class Segment {
    PVector start, end;
    Segment prev, next;

    //create a first segment with start and end
    public Segment(float x1, float y1, float x2, float y2) {
        start = new PVector(x1,y1);
        end = new PVector(x2,y2);
        prev = null; next = null;
    }
    
    //create a second or later segment
    public Segment(Segment last, float x2, float y2) {
        start = last.end;
        last.next = this;
        end = new PVector(x2,y2);
        prev = last;
        next = null;
    }
    
    private float getSlope() {
       return (float)(end.y - start.y)/(end.x - start.x);
    } 
    
    private float getAngle() {
      float theta = atan(getSlope());
      if ( start.x < end.x ) {
         return theta;
      } else {
        return theta + PI;
      }
    }
    
    public void addBump() {
      PVector a, b, c;
      float r = start.dist(end)/3.0;
      float theta = getAngle();
      
      a = new PVector(start.x + r*cos(theta), start.y + r*sin(theta));
      b = new PVector(a.x + r*cos(theta-PI/3), a.y + r*sin(theta-PI/3));
      c = new PVector(end.x - r*cos(theta), end.y - r*sin(theta));
      
      PVector oldEnd = end;
      Segment oldNext = next;
      end = a;
      Segment bump1 = new Segment(this, b.x, b.y);
      Segment bump2 = new Segment(bump1, c.x, c.y);
      Segment bump3 = new Segment(bump2, oldEnd.x, oldEnd.y);
            
      if ( oldNext != null ) { 
        bump3.next = oldNext;
        oldNext.prev = bump3;
        oldNext.addBump();      
      }
    
    }
    
   public void render() {
        line(start.x, start.y, end.x, end.y);
        if ( next != null ) next.render();
    }
}
