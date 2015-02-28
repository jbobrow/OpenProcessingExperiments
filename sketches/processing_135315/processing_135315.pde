
/* 
 *  2D Tilemap Shadowing
 *  Line of sight with a max radius.
 *
 *  Wally Glutton 2009
 *  http://stungeye.com
 *
 *  License: This is free and unencumbered software released into the public domain.
 *
 */

final static int LIGHT_CIRCLE_VERTICES = 180;
final static float LIGHT_RADIUS = 200;
final static int NUM_OBSTACLES = 120;

Obstacle[] obstacles;
PGraphics pg;

class Obstacle { 
  float x, y, h, w;
  PVector location;
  
  Obstacle(float _x, float _y, float _h, float _w) {
    x = _x;
    y = _y;
    h = _h;
    w = _w;
  }
  
  void draw() {
    stroke(255);
    fill(255);
    rect(x, y, w, h);
  }
  
  // Found here: http://processing.org/hacks/hacks:detecting-line-to-line-intersection
  // An improvement over my original homebrew intersection testing.
  PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
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
  
  PVector draw_intersection_point(PVector character_location, PVector ray_end_point, float radius) {
    float test_y = ((y + h) < character_location.y) ? y + h : y;
    float test_x = ((x + w) > character_location.x) ? x : x + w;
    
    float distance = PVector.dist(character_location, new PVector(test_x, test_y));
    if (distance > radius) return null; // We cannot see beyond the end of our visino radius. 
                                        // Not sure if this boosts our performance at all.
    
    PVector found = null;
    if ((character_location.y > y + h) || (character_location.y < y))
      found = segIntersection(character_location.x, character_location.y, ray_end_point.x, ray_end_point.y, x, test_y, x+w, test_y);
    if (found != null) return found;    
    found = segIntersection(character_location.x, character_location.y, ray_end_point.x, ray_end_point.y, test_x, y, test_x, y+h);
    return found;
  }
 
}

void setup() {
  size(800,600);
  smooth();
  ellipseMode(CENTER); 
  background(0);
  
  
  obstacles = new Obstacle[NUM_OBSTACLES ];
  for(int i = 0; i < NUM_OBSTACLES; i++) { 
    obstacles[i] = new Obstacle(random(width), random(height), 30, 30);
  }
  
}

void draw() {
  background(25);
  PVector character_location = new PVector(mouseX, mouseY);
  float angle = 0; 
  ArrayList points = new ArrayList();
  

  
  for (int i = 0; i < LIGHT_CIRCLE_VERTICES; i++) {
    angle += radians(360.0 / LIGHT_CIRCLE_VERTICES);
    float x = character_location.x + cos(angle) * LIGHT_RADIUS;
    float y = character_location.y + sin(angle) * LIGHT_RADIUS;
    PVector ray_end_point = new PVector(x,y);

    ArrayList hit_vectors = new ArrayList();
    for(int j = 0; j < NUM_OBSTACLES; j++) {
      PVector hit_location = obstacles[j].draw_intersection_point(character_location, ray_end_point, LIGHT_RADIUS);
      if (hit_location != null) {
        hit_vectors.add(hit_location);
      }
    }

    if (hit_vectors.size() == 0) {
      points.add(ray_end_point);
    } else {
      float min_distance = LIGHT_RADIUS + 1;
      PVector min_vector = (PVector)hit_vectors.get(0);
      for (int j = 0; j < hit_vectors.size(); j++) {
        PVector current_vector = (PVector)hit_vectors.get(j);
        float current_distance = PVector.dist(character_location, current_vector);
        if (current_distance < min_distance) {
          min_distance = current_distance;
          min_vector = current_vector;
        }
      }
      points.add(min_vector);
    }
  }
  
  stroke(110,110,110);
  fill(100,100,100);
  beginShape();
  for(int i = 0; i < points.size(); i++) {
    PVector current_point = (PVector)points.get(i);
    vertex(current_point.x, current_point.y);
  }
  endShape(CLOSE);
  
  if (mousePressed) {
    for(int i = 0; i < NUM_OBSTACLES; i++) { 
      obstacles[i].draw();
    }
  }
 
  text(frameRate, 20,20);
}




