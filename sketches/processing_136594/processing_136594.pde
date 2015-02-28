
class Line {
  PVector start, end;
  color c;
  
  Line(PVector _start, PVector _end, color _c) {
    start = _start;
    end   = _end;
    c     = _c;
  }
  
  void set_start(PVector _start) {
    start = _start;
  }
  
  void set_end(PVector _end) {
    end = _end;
  }
  
  PVector get_start() {
    return start;
  }
  
  PVector get_end() {
    return end;
  }
  
  void draw() {
    pushStyle();
    stroke(c);
    line(start.x, start.y, end.x, end.y);
    popStyle();
  }
  
  PVector line_itersection(Line one, Line two) {
    float x1 = one.get_start().x;
    float y1 = one.get_start().y;
    float x2 = one.get_end().x;
    float y2 = one.get_end().y;
    
    float x3 = two.get_start().x;
    float y3 = two.get_start().y;
    float x4 = two.get_end().x;
    float y4 = two.get_end().y;
    
    float bx = x2 - x1;
    float by = y2 - y1;
    float dx = x4 - x3;
    float dy = y4 - y3;
   
    float b_dot_d_perp = bx * dy - by * dx;
   
    if(b_dot_d_perp == 0) return null;
   
    float cx = x3 - x1;
    float cy = y3 - y1;
   
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) return null;
   
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) return null;
   
    return new PVector(x1+t*bx, y1+t*by);
  }
  
  PVector intersects_at(Line other) {
    return line_itersection(this, other);
  }
}
  
PVector random_bounded_vector() {
  return new PVector(random(width), random(height));
}

PVector northern_vector() {
  return new PVector(random(width), 0);
}

PVector eastern_vector() {
  return new PVector(width, random(height));
}

PVector southern_vector() {
  return new PVector(random(width), height);
}

PVector western_vector() {
  return new PVector(0, random(height));
}

Line random_cross_screen_line() {
  
 int rand = (int)random(7);
  switch(rand) {
    case 0: 
      return new Line(western_vector(), northern_vector(), color(0));
    case 1:
      return new Line(northern_vector(), eastern_vector(), color(0));
    case 2:
      return new Line(eastern_vector(), southern_vector(), color(0));
    case 3:
      return new Line(southern_vector(), western_vector(), color(0));
    case 4:
      return new Line(western_vector(), eastern_vector(), color(0));
    case 5:
      return new Line(northern_vector(), southern_vector(), color(0));
  }
  // Comment out the top switch to allow for straight up random lines.
  return new Line(random_bounded_vector(), random_bounded_vector(), color(0));
}


float distance_between_points(PVector one, PVector two) {
  return sqrt(sq(one.x - two.x) + sq(one.y - two.y));
}

Line the_others[];
int NUMBER_OF_OTHERS = 2500;
int lines_created;

void setup() {
  size(950, 600);
  smooth();
  frameRate(35);
  initialize();
  stroke(0);
}

void initialize() {
  lines_created = 0;
  the_others = new Line[NUMBER_OF_OTHERS];
  background(255);
}

void mousePressed() {
  initialize();
}

void draw() {

  if (lines_created != NUMBER_OF_OTHERS) {
    the_others[lines_created] = random_cross_screen_line();
    for (int i = 0; i < lines_created; i++) {
      PVector intersection = the_others[lines_created].intersects_at(the_others[i]);
      if (intersection != null) {
        float distance_to_start = distance_between_points(the_others[lines_created].get_start(), intersection);
        float distance_to_end = distance_between_points(the_others[lines_created].get_end(), intersection);
        if (distance_to_end > distance_to_start) {
          the_others[lines_created].set_start(intersection);
        } else {
          the_others[lines_created].set_end(intersection);
        }
      }  
    }
    lines_created++;
  }

    the_others[lines_created - 1].draw();

  
}


