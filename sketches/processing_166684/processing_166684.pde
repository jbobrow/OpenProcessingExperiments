
Bar bar;
Ball ball;

void setup() {
  size(800, 500);
  frameRate(60);
  bar = new Bar();
  ball = new Ball();
}

void draw() {
  background(0);
  bar.move_bar();
  bar.draw_bar();
  ball.move_ball();
  ball.draw_ball();
}

class Ball {
  int size, bounds;
  float x, y, dX, dY;

  Ball() {
    size = 20;
    bounds = (size / 2) - 1;
    x = 250;
    y = 250;
    dX = 3;
    dY = 3;
  }

  void draw_ball() {
    fill(255);
    ellipse(x, y, size, size);
  }

  void move_ball() {
    x += dX;
    y += dY;

    performHitDetection();
  }
  
  void performHitDetection() {
      if (hitTop()) {
          dX *= -1;
      }
      if (hitBottom()) {
          dY *= -1;
      }
      if (hitBar()) {
          dX *= -1;
          dY *= -1;
      }
  }
  
  boolean hitTop() {
      return x > width;
  }
  
  boolean hitBottom() {
      return y > height || y < 0;
  }
  
  boolean hitBar() {
      return isInsideBarWidth() && isInsideBarHeight();
  }
  
  boolean isInsideBarWidth() {
      return (bar.x + bar.barWidth) > x - bounds;
  }
  
  boolean isInsideBarHeight() {
      return (bar.y + bar.barHeight) > y - bounds;
  }
  
}

class Bar {
  int barWidth, barHeight;
  float x, y;

  Bar() {
    barWidth = 15;
    barHeight = 80;
    x = 20;
    y = 50;
  }

  void draw_bar() {
    stroke (0);
    fill (255);
    rect (x, y, barWidth, barHeight);
  }

  void move_bar() {
    parseInput();
    performHitDetection();
  }
  
  void parseInput() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == UP) {
          bar.y = bar.y - 10;
        } else if (keyCode == DOWN) {
          bar.y = bar.y + 10;
        }
      } else {
        bar.y = bar.y;
      }
    }
  }
  
  void performHitDetection() {
    if (y > height - 80) {
      y = height - 80;
    }
    if (y < 0) {
      y = 0;
    }
  }
  
}


