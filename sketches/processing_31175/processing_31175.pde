


class Aggregation {
  Circle[] circles;
  Circle current_circle;
  Circle release_circle;
  Circle[] history = new Circle[0];
  int display_index;
  boolean shadow = true;
  
  Aggregation() {
   this(new Circle(width/2.0,height/2.0, random(min_radius.radius, max_radius.radius)));
  } 
  
  Aggregation(Circle c) {
    circles = new Circle[1];
    circles[0] = c;
    display_index = 1;
    release_circle = new Circle(c.x,c.y,c.radius+max_radius.radius*10);
    float theta = random(TWO_PI);
    float startx = release_circle.x+release_circle.radius*cos(theta);
    float starty = release_circle.y+release_circle.radius*sin(theta);
    current_circle = new Circle(startx,starty,random(min_radius.radius,max_radius.radius));
  }
  
  void render() {
    noStroke();
    fill(0);
    for(int i=0;i<min(display_index,circles.length);++i) {
        ellipse(circles[i].x*agg_scale+agg_off_x,circles[i].y*agg_scale+agg_off_y,circles[i].radius*2*agg_scale,circles[i].radius*2*agg_scale);
    }
  }
  
  void step() {
    if(distance(current_circle, release_circle)<release_circle.radius) {
      current_circle.x = current_circle.x+random(-max_inc, max_inc)+cart.xForce*max_inc;
      current_circle.y = current_circle.y+random(-max_inc, max_inc)+cart.yForce*max_inc;
    } else {
      current_circle.x = current_circle.x+random(-max_radius.radius, max_radius.radius)+cart.xForce*max_radius.radius;
      current_circle.y = current_circle.y+random(-max_radius.radius, max_radius.radius)+cart.yForce*max_radius.radius;
    }
    
    if (circles.length > 0) {
      Circle first = circles[0];
      float cent_dist = sqrt((current_circle.x-first.x)*(current_circle.x-first.x)+(current_circle.y-first.y)*(current_circle.y-first.y));
      float x_comp_rad = rad.rForce*max_inc*(current_circle.x-first.x)/cent_dist;
      float y_comp_rad = rad.rForce*max_inc*(current_circle.y-first.y)/cent_dist;
      float x_comp_ang = rad.aForce*max_inc*(-current_circle.y+first.y)/cent_dist;
      float y_comp_ang = rad.aForce*max_inc*(current_circle.x-first.x)/cent_dist;
    
      current_circle.x += x_comp_rad+x_comp_ang;
      current_circle.y += y_comp_rad+y_comp_ang;
    }

    Circle in = intersect(current_circle,this);
    if(in.radius != -99){
      if(distance(in, current_circle) > (in.radius+current_circle.radius)*.200) {
       if(random(1.0) < stick_prob) {
        circles = (Circle[]) append(circles,current_circle);
        display_index++;
        redraw = true;
        release_circle.x = (release_circle.x*(circles.length-1)+current_circle.x)/circles.length;
        release_circle.y = (release_circle.y*(circles.length-1)+current_circle.y)/circles.length;
        float max_dist = 0;

        for(int i=0;i<circles.length;++i) {
          Circle this_c = circles[i];
          max_dist = max(max_dist, distance(release_circle, this_c));
        }
        release_circle.radius = max_dist*4+max_radius.radius*2.0;
        float theta = random(TWO_PI);
        float startx = release_circle.x+release_circle.radius*sin(theta);
        float starty = release_circle.y+release_circle.radius*cos(theta);
        current_circle = new Circle(startx, starty, random(min_radius.radius,max_radius.radius)); 
       }
      }
    }
    if(distance(current_circle, release_circle) > release_circle.radius*3) {
      float theta = random(TWO_PI);
      current_circle.x = release_circle.x+release_circle.radius*cos(theta);
      current_circle.y = release_circle.y+release_circle.radius*sin(theta);
    }
  }
}

Circle intersect(Circle c, Aggregation agg) {
  float least = 99;
  Circle re = NUL;
  for(int i = 0; i < agg.circles.length; i++) {
    Circle c2 = agg.circles[i];
    if(intersect(c,c2)) {
      if(sqrt(pow(c.x-c2.x,2)+pow(c.y-c2.y,2)) <least) {
        least = sqrt(pow(c.x-c2.x,2)+pow(c.y-c2.y,2));
        re = c2;
      }
    }
  }
  return re;
}

boolean intersect(Circle c1, Circle c2) {
  float d = sqrt(pow(c1.x-c2.x,2)+pow(c1.y-c2.y,2));
  if(d < c1.radius+c2.radius) return true;

  return false;

}


class Circle {
  float radius,x,y;
  int age;
  
  Circle(float _x, float _y, float _r) {
    radius = _r;
    x = _x;
    y = _y;
    age = 0;
  }
  
  boolean equals(Object o) {
    Circle c2 = (Circle) o;
    if(c2.radius == radius && c2.x == x && c2.y == y) return true;
    return false;
  }
}

float distance(Circle c1, Circle c2) {
  return sqrt(pow(c1.x-c2.x,2)+pow(c1.y-c2.y,2));
}

