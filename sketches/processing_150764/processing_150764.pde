
Vector start;
float distance = 40;

int limit = 7;
float rec = 0;


void setup() {
  size(800, 600);
  smooth();
  strokeWeight(2);

  start = new Vector(width / 2, height / 2);
}

void draw() {
  background(0);
  stroke(255);
  smooth();
  
  float angle1 = sin(rec++ / 60) * TWO_PI * .25;
  drawLine(start, distance, TWO_PI * .75, angle1, limit);
  drawLine(start, distance, TWO_PI * 0, angle1, limit);
  drawLine(start, distance, TWO_PI * .25, angle1, limit);
  drawLine(start, distance, TWO_PI * .5, angle1, limit);
}

void drawLine(Vector point, float distance, float angle, float angleDelta, int limit) {
  if (limit == 0) return;

  float leftAngle = angle + angleDelta;
  float rightAngle = angle - angleDelta;

  Vector left = point.angle(leftAngle, distance);
  Vector right = point.angle(rightAngle, distance);
  

  float distanceDamp = .75;
  line(point.x, point.y, left.x, left.y);
  drawLine(left, distance * distanceDamp, leftAngle, angleDelta, limit - 1);
  drawLine(right, distance * distanceDamp, rightAngle, angleDelta, limit - 1);

  line(point.x, point.y, right.x, right.y);
}

public class Vector {

  float x, y;

  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Vector angle(float angle, float distance) {
    // cos theta = adjacent / hypotneuse
    // cos(angle) = adjacent / distance
    // cos(angle) * distance = adjacent
    float x = cos(angle) * distance + this.x;

    // sin theta = opposite / hypotneuse
    // sin(angle) = opposite / distance
    // sin(angle) * distance = opposite
    float y = sin(angle) * distance + this.y;

    return new Vector(x, y);
  }

  Vector add(Vector vector) {
    return new Vector(this.x + vector.x, this.y + vector.y);
  }

  Vector multiply(float value) {
    return new Vector(this.x * value, this.y * value);
  }

  Vector multiply(Vector vector) {
    return new Vector(this.x * vector.x, this.y * vector.y);
  }

  public String toString() {
    return "(" + (int)this.x + ", " + (int)this.y + ")";
  }
}

