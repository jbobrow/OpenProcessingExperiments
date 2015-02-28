
import java.util.ArrayList;

PVector ballPos = null;
PVector ballVel = null;
final int BALL_RADIUS = 10;

public class Triangle {
  public PVector p1;
  public PVector p2;
  public PVector p3;
  public int hue;
  
  public Triangle(PVector pos1, PVector pos2, PVector pos3) {
    p1 = pos1;
    p2 = pos2;
    p3 = pos3;
    hue = 0;
  }
}

ArrayList<Triangle> triangles;
final int TRIANGLE_LENGTH = 20;

final int MAX_TRIANGLES = 40;
int TRIANGLE_SPAWN_TIME = 20;
int timeSinceLastSpawn = 0;
int currentHue = 0;
final int HUE_INCREASE = 1;

void setup() {
  size(480, 320);
  smooth();
  
  colorMode(HSB, 100);
  
  timeSinceLastSpawn = millis();
  
  PVector center = new PVector(width / 2.0f, height / 2.0f);
  
  ballPos = center;
  ballVel = new PVector(-2.5, -2.5);
  
  triangles = new ArrayList<Triangle>();
  float triangleHeight = sqrt(sq(TRIANGLE_LENGTH) - sq(TRIANGLE_LENGTH / 2.0));
  PVector p1 = new PVector(-1 * TRIANGLE_LENGTH / 2.0 + center.x, -1 * triangleHeight / 2.0 + center.y);
  PVector p2 = new PVector(TRIANGLE_LENGTH / 2.0 + center.x, -1 * triangleHeight / 2.0 + center.y);
  PVector p3 = new PVector(center.x, triangleHeight / 2.0 + center.y);
  triangles.add(new Triangle(p1, p2, p3));
  
  timeSinceLastSpawn = millis();
}

void draw() {
  update();
  
  background(0, 0, 100);
  
  //ellipse(ballPos.x, ballPos.y, BALL_RADIUS * 2, BALL_RADIUS * 2);
  
  for(int i = 0; i < triangles.size(); i++) {
    Triangle t = triangles.get(i);
    fill(t.hue, (i + 1) / (float)triangles.size() * 255, 186);
    triangle(t.p1.x, t.p1.y, t.p2.x, t.p2.y, t.p3.x, t.p3.y);
  }
  
  //point(width / 2.0, height / 2.0);
}

void update() {
  ballPos.x = ballPos.x + ballVel.x;
  ballPos.y = ballPos.y + ballVel.y;
  
  if(ballPos.x - BALL_RADIUS <= 0) {
    ballPos.x = -1 * (ballPos.x - BALL_RADIUS) + BALL_RADIUS;
    ballVel.x = -ballVel.x;
  } else if(ballPos.x + BALL_RADIUS > width) {
    ballPos.x = width - ((ballPos.x + BALL_RADIUS) - width) - BALL_RADIUS;
    ballVel.x = -ballVel.x;
  }
  
  if(ballPos.y - BALL_RADIUS <= 0) {
    ballPos.y = -1 * (ballPos.y - BALL_RADIUS) + BALL_RADIUS;
    ballVel.y = -ballVel.y;
  } else if(ballPos.y + BALL_RADIUS > height) {
    ballPos.y = height - ((ballPos.y + BALL_RADIUS) - height) - BALL_RADIUS;
    ballVel.y = -ballVel.y;
  }
  
  int currentTime = millis();
  if(currentTime - timeSinceLastSpawn > TRIANGLE_SPAWN_TIME) {
    extendTriangle();
    timeSinceLastSpawn = currentTime;
  }
}

void extendTriangle() {
  Triangle lastTriangle = triangles.get(triangles.size() - 1);
  PVector lastPoint = lastTriangle.p3;
  PVector secondToLastPoint = lastTriangle.p2;
  PVector thirdToLastPoint =  lastTriangle.p1;
  
  PVector newPoint1 = findNewPoint(lastPoint, secondToLastPoint, thirdToLastPoint);
  PVector newPoint2 = findNewPoint(lastPoint, thirdToLastPoint, secondToLastPoint);
  
  Triangle newTriangle = null;
  if(distanceBetween(newPoint1, ballPos) < distanceBetween(newPoint2, ballPos)) {
    newTriangle = new Triangle(lastPoint, secondToLastPoint, newPoint1);
  } else {
    newTriangle = new Triangle(lastPoint, thirdToLastPoint, newPoint2);
  }
  newTriangle.hue = currentHue;
  currentHue = (currentHue + HUE_INCREASE) % 128;
  triangles.add(newTriangle);
  
  if(triangles.size() > MAX_TRIANGLES) {
    triangles.remove(0);
  }
}

PVector findNewPoint(PVector a, PVector b, PVector awayFrom) {
  float dist = distanceBetween(a, b);
  float dx = b.x - a.x;
  float dy = b.y - a.y;
  PVector norm = new PVector(dx / dist, dy / dist);
  PVector midPoint = new PVector((a.x + b.x) / 2.0, (a.y + b.y) / 2.0);
  float triangleHeight = sqrt(sq(TRIANGLE_LENGTH) - sq(TRIANGLE_LENGTH / 2.0));
  
  PVector p1 = new PVector(-1 * norm.y * triangleHeight + midPoint.x, norm.x * triangleHeight + midPoint.y);
  PVector p2 = new PVector(norm.y * triangleHeight + midPoint.x, -1 * norm.x * triangleHeight + midPoint.y);
  
  if(distanceBetween(p1, awayFrom) > distanceBetween(p2, awayFrom)) {
    return p1;
  } else {
    return p2;
  }
}

float distanceBetween(PVector a, PVector b) {
  return sqrt(sq(b.x - a.x) + sq(b.y - a.y));
}

void swapPVector(PVector a, PVector b) {
  PVector temp = new PVector(a.x, a.y);
  a.x = b.x;
  a.y = b.y;
  
  b.x = temp.x;
  b.y = temp.y;
}

void printPVector(PVector p) {
  print(p.x + " - " + p.y);
}


