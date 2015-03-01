
Vector start;
float distance = 80;

int limit = 7;


void setup() {
  size(800, 600);

  start = new Vector(width / 2, height / 2 + height * .2);
}

void draw() {
  background(0);
  stroke(255);
  smooth();
  
  line(start.x, start.y, start.x, height);
  
  float ratio = (float)mouseX / (float)width;
  float angle = ratio * TWO_PI * .25;
  drawLine(start, distance, TWO_PI * .75, angle, limit);
}

void drawLine(Vector point, float distance, float angle, float angleDelta, int limit) {
  if (limit == 0) return;

  float leftAngle = angle + angleDelta;
  float rightAngle = angle - angleDelta;

  Vector left = point.angle(leftAngle, distance);
  Vector right = point.angle(rightAngle, distance);
  

  float distanceDamp = .85;
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

