
//koch snowflake

ArrayList<Segment> segments = new ArrayList<Segment>();
int maxIterations;

void setup() {  
  size(500, 500);
  background(100, 150, 250);
  stroke(255);
  smooth();
  noFill();
  maxIterations = 5;
 
}

void mouseClicked() {
  //addBump();
}

 Segment first = new Segment(.2*width, .7*height, .8*width, .7*height);
 

void draw() {
  segments.add(first);
  textSize(20);
  text("Iterations Left: " + maxIterations, 40, 20);

  for (int i = 0 ; i < segments.size() ; i++) {
    if ( maxIterations > 0 ) {
      a.addBump();
     maxIterations--;
    }
  }
  first.render();
}
//focus on koch curve  w/ 1 segment
class Segment {

  PVector start, end;

  public Segment(float x1, float y1, float x2, float y2) {
    start = new PVector(x1, y1);
    end = new PVector(x2, y2);
  }

  private float getLength() {
    float length = start.dist(end);
    return length;
  }

  private float getAngle() {
    float theta = atan(end.y - start.y/end.x - start.x);
    return theta;
  }

  public void addBump() {

    ArrayList<Segment> tmp = new ArrayList<Segment>();

    for (Segment s : segments) {  

      Segment a = new Segment(.2*width, .7*height, .8*width, .7*height); //1st segment, start
      a.start = a.start;
      a.end = new PVector((1/3 * a.getLength() * cos(a.getAngle())), 
      (1/3 * a.getLength() * sin(a.getAngle())));

      Segment b = new Segment(.2*width, .7*height, .8*width, .7*height); //2nd segment up 60 clockwise
      b.start = a.end;
      b.end = new PVector((1/3 * a.getLength() * cos(a.getAngle())), 
      (1/3 * a.getLength() * sin(a.getAngle())));
      b.end.rotate(radians(-60)); 

      Segment c = new Segment(.2*width, .7*height, .8*width, .7*height); //3rd segment down 60 clockwise
      c.start = b.end;
      c.end = new PVector((1/3 * a.getLength() * cos(a.getAngle())), 
      (1/3 * a.getLength() * sin(a.getAngle())));
      c.end.rotate(radians(60));

      Segment d = new Segment(.2*width, .7*height, .8*width, .7*height); //4th segment, end
      d.start = c.end;
      d.end = a.end;
    }


    segments = tmp;

    public void render() {
        line(start.x, start.y, end.x, end.y);
        if(a != null) {
             a.render();
        }
    }
     
  }
}

