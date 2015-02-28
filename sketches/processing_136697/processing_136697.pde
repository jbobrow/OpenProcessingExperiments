

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
  
  void draw(float t) {
    if (t > 1) t = 1;
    float x1 = start.x;
    float y1 = start.y;
    float x2 = end.x;
    float y2 = end.y;
    
    float x = x1 + t * (x2 - x1);
    float y = y1 + t * (y2 - y1);
    
    pushStyle();
    stroke(c);
    line(start.x, start.y, x, y);
    popStyle();
  }
  
  PVector circle_intersection(float cx, float cy, float cr ) {
    float x1 = start.x;
    float y1 = start.y;
    float x2 = end.x;
    float y2 = end.y;
    
    float dx = x2 - x1;
    float dy = y2 - y1;
    float a = dx * dx + dy * dy;
    float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
    float c = cx * cx + cy * cy;
    c += x1 * x1 + y1 * y1;
    c -= 2 * (cx * x1 + cy * y1);
    c -= cr * cr;
    float bb4ac = b * b - 4 * a * c;
   
    if (bb4ac < 0) {  // Not intersecting
      return null;
    } else {
      float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
      float ix1 = x1 + mu*(dx);
      float iy1 = y1 + mu*(dy);
      mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
      float ix2 = x1 + mu*(dx);
      float iy2 = y1 + mu*(dy);
      
      PVector intersection_1 = new PVector(ix1, iy1);
      PVector intersection_2 = new PVector(ix2, iy2);
      
      float distance_to_1 = distance_between_points(start, intersection_1);
      float distance_to_2 = distance_between_points(start, intersection_2);
      
      if (distance_to_1 < distance_to_2) {
        return intersection_1;
      } else {
        return intersection_2;
      }
    }
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
  
  PVector random_point_on_line() {
    float t = random(0,100) / 100;
    float x1 = start.x;
    float y1 = start.y;
    float x2 = end.x;
    float y2 = end.y;
    
    float x = x1 + t * (x2 - x1);
    float y = y1 + t * (y2 - y1);
    
    return new PVector(x, y);
  }
  
  String to_s() {
    return "("+start.x+","+start.y+") ("+end.x+","+end.y+")";
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
  
 int rand = (int)random(6);
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

Line random_line_from_existing(Line other) {
  int rand = (int)random(4);
  
  PVector start = other.random_point_on_line();
  
  switch(rand) {
    case 0: 
      return new Line(start, northern_vector(), color(0));
    case 1:
      return new Line(start, eastern_vector(), color(0));
    case 2:
      return new Line(start, southern_vector(), color(0));
    case 3:
      return new Line(start, western_vector(), color(0));
  }
  
  return other;
}


float distance_between_points(PVector one, PVector two) {
  return sqrt(sq(one.x - two.x) + sq(one.y - two.y));
}

Line the_others[];
int NUMBER_OF_OTHERS = 1000;
int lines_created;
float scale;
boolean create_next;

void setup() {
  size(470, 600);
  smooth();
  frameRate(55);
  initialize();
  stroke(0);
  scale = 1;
}

void initialize() {
  background(255);

  lines_created = 1;
  the_others = new Line[NUMBER_OF_OTHERS];
  the_others[0] = random_cross_screen_line();
    PVector circle_intersection = the_others[0].circle_intersection(width/2, height/2, width * 0.4);
    if (circle_intersection != null) {
      the_others[0].set_end(circle_intersection);
    }
    
  the_others[0].draw(1);
  create_next = true;

}

void mousePressed() {
  initialize();
}



void draw() {

  if (lines_created != NUMBER_OF_OTHERS) {
    
    if (create_next) {
      create_next = false;
      int starting_place = 0;
      
      if (lines_created > 150) {
        starting_place = lines_created - 100;
      } 
      
      the_others[lines_created] = random_line_from_existing(the_others[(int)random(starting_place, lines_created)]);
  
      
      PVector circle_intersection = the_others[lines_created].circle_intersection(width/2, height/2, width * 0.4);
      if (circle_intersection != null) {
        the_others[lines_created].set_end(circle_intersection);
      }
      
      
  
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
    }
    float length_of_line = distance_between_points(the_others[lines_created].get_start(),the_others[lines_created].get_end());
    if ( length_of_line > 15) {
      background(255);
      for (int i = 0; i < lines_created; i++) {
        the_others[i].draw(1);
      }
      the_others[lines_created].draw(scale/length_of_line);
      scale += 15;
      if (scale > length_of_line) {
        //println("leveled");
        lines_created++;
        scale = 1;
        create_next = true;
      }
    } else {
      create_next = true;
    }
    
  }

  

  
}


