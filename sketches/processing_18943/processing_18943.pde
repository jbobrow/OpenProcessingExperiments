
public class Crack {
  PVector position;
  float angle;
  float length;
  float curvature;
  float decay;
  
  boolean active;
  BoundingBox box;

  float BRANCH_CHANCE = .1;
  float STOP_CRACK_CHANCE = .9; 
  ArrayList<Segment> segments;
  ArrayList<Crack> fellowCracks;
 
  
  public Crack() {
    this(new PVector(0,0), 0, 50, .95, .05, null);
  }
  
  public Crack(PVector iPosition, float iAngle, float iLength, float iDecay, float iCurvature, ArrayList<Crack> fellows) {
    this.position = new PVector(iPosition.x, iPosition.y);
    this.angle = iAngle;
    this.length = iLength;
    this.curvature = iCurvature;  
    this.decay = iDecay;
    this.active = true;
    this.fellowCracks = fellows;
    
    this.box = new BoundingBox(this.position, this.position);
    
    this.segments = new ArrayList<Segment>();
  }
  
  public void update() {
    if(this.active) {
      PVector end = PVector.add(this.position, new PVector(cos(this.angle) * this.length,
                                                           sin(this.angle) * this.length));
      Segment nextSegment = new Segment(this.position.x, this.position.y, end.x, end.y);
      PVector collision = getCollision(nextSegment);
      if(collision == null) {
        this.segments.add(nextSegment);
        this.angle += this.curvature;
        //this.length *= this.decay;
        if(this.length < 1) this.active = false;
        
        position.set(end); 
        
        // Randomly branch
        if(random(0,1) < BRANCH_CHANCE && this.active) {
          this.fellowCracks.add(new Crack(position, this.angle + random(-PI/6, PI/6), random(this.length, this.length*2), random(.8,.95), random(-.05,.05), this.fellowCracks));
        }
      }
      else {
        nextSegment.end = collision;
        this.segments.add(nextSegment);
        this.active = false;
        // And spawn a new crack?
        //this.fellowCracks.add(new Crack(collision, this.angle + random(-PI/4, PI/4), random(5,30), random(.8,.99), random(0,.05)));
      }
      this.box.updateToInclude(nextSegment.start);
      this.box.updateToInclude(nextSegment.end);
    }
  }
  
  
  public void draw() {
    for(int i=0; i<segments.size(); i++) {
      segments.get(i).draw();
      
      rectMode(CORNERS);
      noFill();
      strokeWeight(.1);
      //rect(this.box.corner1.x, this.box.corner1.y, this.box.corner2.x, this.box.corner2.y);
    }  
  }
  
  private PVector getCollision(Segment s) {
    if(fellowCracks != null) {
      PVector collision;
      if(s.end.x > width || s.end.x < 0 || s.end.y > height || s.end.y < 0)
        return new PVector(s.end.x, s.end.y); 
        
      for(int i=0; i<fellowCracks.size(); i++) {
        if(fellowCracks.get(i).box.contains(s.start) || fellowCracks.get(i).box.contains(s.end)) {
          for(int j=0; j<fellowCracks.get(i).segments.size(); j++) {
            collision = fellowCracks.get(i).segments.get(j).collides(s);
            if(collision != null && random(0,1) < STOP_CRACK_CHANCE) {
              return collision;
            }
          }
        }
      }
      return null;
    }
    else return null;
  }
  
}

public class BoundingBox { 
  PVector corner1;
  PVector corner2;
  public BoundingBox(PVector a, PVector b) {
    this.corner1 = new PVector(a.x, a.y);
    this.corner2 = new PVector(b.x, b.y);
  }  
  
  public void updateToInclude(PVector p) {
    // Expand to the right?
    if(p.x > corner1.x && p.x > corner2.x) {
      if(corner1.x > corner2.x)
        corner1.x = p.x;
      else
        corner2.x = p.x;
    }
    // Expand to the left?
    if(p.x < corner1.x && p.x < corner2.x) {
      if(corner1.x < corner2.x)
        corner1.x = p.x;
      else
        corner2.x = p.x;
    }    
    // Expand to the top?
    if(p.y < corner1.y && p.y < corner2.y) {
      if(corner1.y < corner2.y)
        corner1.y = p.y;
      else
        corner2.y = p.y;
    }     
    // Expand to the bottom?
    if(p.y > corner1.y && p.y > corner2.y) {
      if(corner1.y > corner2.y)
        corner1.y = p.y;
      else
        corner2.y = p.y;
    }         
  }
  
  public boolean contains(PVector p) {
    float left = corner1.x < corner2.x ? corner1.x : corner2.x;  
    float right = corner1.x > corner2.x ? corner1.x : corner2.x;
    float top = corner1.y < corner2.y ? corner1.y : corner2.y;  
    float bottom = corner1.y > corner2.y ? corner1.y : corner2.y;
    if(p.x < left || p.x > right || p.y < top || p.y > bottom)
      return false;
    else return true;
  }
}

public class Segment {
  PVector start;
  PVector end;
   
  public Segment(PVector start, PVector end) {
    this.start = new PVector(start.x, start.y);
    this.end = new PVector(end.x, end.y);
  }
  
  public Segment(float startx, float starty, float endx, float endy) {
    this.start = new PVector(startx, starty);
    this.end   = new PVector(endx, endy);
  }
  
  public void draw() {
    //strokeWeight(sqrt((sq(start.x-end.x) + sq(start.y-end.y))/100.));
    strokeWeight(1);
    stroke(0,0,0,180);
    line(start.x+1, start.y-1, end.x+1, end.y-1);    
    strokeWeight(1);
    stroke(0,0,255,255);
    line(start.x, start.y, end.x, end.y);
  }
  
  public PVector collides(Segment s) {
    // Algorithm by Ryan Alexander from http://wiki.processing.org/w/Line-Line_intersection
    float x1 = s.start.x;
    float y1 = s.start.y;
    float x2 = s.end.x;
    float y2 = s.end.y;
    float x3 = this.start.x;
    float y3 = this.start.y;
    float x4 = this.end.x;
    float y4 = this.end.y;
    
    float bx = x2 - x1; 
    float by = y2 - y1; 
    float dx = x4 - x3; 
    float dy = y4 - y3;
    float b_dot_d_perp = bx * dy - by * dx;
    if(b_dot_d_perp == 0) {
      return null;
    }
    float cx = x3 - x1;
    float cy = y3 - y1;
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t <= 0 || t >= 1) {
      return null;
    }
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u <= 0 || u >= 1) { 
      return null;
    }    
    
    return new PVector(x1+t*bx, y1+t*by);
  }
}

