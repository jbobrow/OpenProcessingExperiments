
// Exercise 9-7. A refactoring of Example 9-8, creating a snake object that leaves a trail.

Snake snake = new Snake();

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  snake.move(new Point(mouseX, mouseY));
  snake.draw();
}

// A simple Point.
class Point {

  int x;
  int y;

  Point() {
    x = 0;
    y = 0;
  }

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

}

// A simple snake.

public class Snake {

  public static final int TRAIL_LENGTH = 50;
  Point[] bodySegments;

  public Snake() {
    bodySegments = new Point[TRAIL_LENGTH];
    initializeBodySegments();
  }

  public void saveLatestPosition(Point position) {
    bodySegments[TRAIL_LENGTH - 1] = position;

  }

  public void draw() {
    for (int i = 0; i < TRAIL_LENGTH; ++i) {
      noStroke();
      fill(255 - i * 5);
      ellipse(bodySegments[i].x, bodySegments[i].y, i, i);
    }
  }

  private void initializeBodySegments() {
    for (int i = 0; i < TRAIL_LENGTH; ++i) {
      bodySegments[i] = new Point(0, 0);
    }
  }

  private void move(Point location) {
    shiftExistingPositions();
    saveLatestPosition(location);
  }

  private void shiftExistingPositions() {
    for (int i = 0; i < TRAIL_LENGTH - 1; ++i) {
      bodySegments[i] = bodySegments[i + 1];
    }
  }

}
