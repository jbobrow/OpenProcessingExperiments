
float MAX_ANGLE = radians(50);
int MARGIN = 50;
int DISTANCE = 300;
int FRAMES_PER_DISTANCE = 80;
int NUM_POINTS = 230;
Path path;
Line lines[];

int screen_x, screen_y;

void setup() {
  size(400,400);
//  smooth();
  frameRate(30);
  path = new Path();
  lines = new Line[] { new Line(color(0,255,0), 30f, 80, 20f), new Line(color(0), 15.0f, 50, 15f), new Line(color(0), -15.0f, 45, 15f) };
}

void draw() {
  background(255);
  path.update();
  for(int i=0;i<lines.length;i++) {
    lines[i].update(); 
    lines[i].draw();
  }
}

class Path {
  Point points[];
  Point lastPoint;
  float lastAngle;
  int counter;
  
  Path() {
    points = new Point[4];

    counter = 0;
    points[0] = new Point(width/2,height/2);
    points[1] = generate_destination(points[0],270);
    for(int i=2;i<points.length;i++)
      points[i] = generate_destination(points[i-1],angle(points[i-2],points[i-1]));
  }
  
  float getLastAngle() {
    return lastAngle; 
  }
  
  Point getLastPoint() {
    return lastPoint;
  }
  
  void update() {
    generate_point(counter++);
    if(counter == FRAMES_PER_DISTANCE) {
      counter = 0;
      for(int i=1;i<points.length;i++)
        points[i-1] = points[i];
      points[3] = generate_destination(points[2],angle(points[1],points[2]));
    }
    pan_camera();
    //center_camera();
  }
  
  void center_camera() {
    screen_x = int(points[counter].x - width/2);
    screen_y = int(points[counter].y - height/2);
 //   translate(screen_x, screen_y); // doesn't work with beginShape?
  }
  
  void pan_camera() {
    Point p = lastPoint;
    if(p.x + screen_x <= MARGIN)
      screen_x = MARGIN - int(p.x);
    else if(p.x + screen_x >= width - MARGIN)
      screen_x = width - MARGIN - int(p.x);
    if(p.y + screen_y <= MARGIN)
      screen_y = MARGIN - int(p.y);
    else if(p.y + screen_y >= height - MARGIN)
      screen_y = height - MARGIN - int(p.y);
//    translate(screen_x, screen_y);
  }
  
  Point generate_destination(Point base, float prev_angle) {
    float angle = prev_angle + random(-MAX_ANGLE,MAX_ANGLE);
    //println("From " + degrees(prev_angle) + " to " + degrees(angle));   
    return new Point(base.x + DISTANCE * cos(angle), base.y + DISTANCE * sin(angle));
  }
  
  void generate_point(int counter) {
    float t = counter / float(FRAMES_PER_DISTANCE);
    float x = curvePoint(points[0].x, points[1].x, points[2].x, points[3].x, t);
    float y = curvePoint(points[0].y, points[1].y, points[2].y, points[3].y, t);
    lastPoint = new Point(x,y);
    float tx = curveTangent(points[0].x, points[1].x, points[2].x, points[3].x, t);
    float ty = curveTangent(points[0].y, points[1].y, points[2].y, points[3].y, t);
    lastAngle = atan2(ty, tx) + HALF_PI;
  }
  
  float angle(Point p1, Point p2) {
    return atan2(p2.y - p1.y, p2.x - p1.x); 
  }
  
  float distance(Point p1, Point p2) {
    return sqrt(sq(p1.x-p2.x) + sq(p1.y-p2.y));
  }
  
  void draw() {
    curve(screen_x + points[0].x,screen_y + points[0].y,screen_x + points[1].x,screen_y + points[1].y,
      screen_x + points[2].x,screen_y + points[2].y,screen_x + points[3].x,screen_y + points[3].y);
  }
}

class Line {
  Point points[];
  float angles[];
  float amplitude, starting_thickness;
  float angle_inc, angle;
  color col;
  int counter;
  
  Line(color col, float amplitude, int period, float starting_thickness) {
    points = new Point[NUM_POINTS];
    angles = new float[NUM_POINTS];
    this.col = col;
    this.amplitude = amplitude;
    this.starting_thickness = starting_thickness;
    this.angle_inc = TWO_PI / (float)period;
    angle = 0;
  }
 
  void draw() {
    fill(col);
    stroke(col);
    beginShape(QUAD_STRIP);
    float thickness = 1;
    for(int i=counter;i!=(counter+1)%NUM_POINTS;i=(i-1+NUM_POINTS)%NUM_POINTS) {
      if(points[i] == null) continue;
      
      float val_x = thickness * cos(angles[i]);
      float val_y = thickness * sin(angles[i]);
      vertex(screen_x + points[i].x + val_x,screen_y + points[i].y + val_y);
      vertex(screen_x + points[i].x - val_x,screen_y + points[i].y - val_y);
      thickness += starting_thickness / NUM_POINTS;
    } 

    endShape();
  }
  
  void update() {
    Point p = path.getLastPoint();
    counter = (counter + 1) % NUM_POINTS;
    angles[counter] = path.getLastAngle();
    float val = amplitude * cos(angle);
    angle += angle_inc;
    points[counter] = new Point(p.x +  val * cos(angles[counter]), p.y + val * sin(angles[counter]));
  }
}

class Point {
  float x,y;
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  } 
}

