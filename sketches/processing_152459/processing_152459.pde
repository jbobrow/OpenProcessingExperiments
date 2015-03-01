
ArrayList<Circle> circs;
int circleID = 0;
PGraphics lines;
boolean showLines = false;
int maxSize = 100;
int strokeSize = 2;

void setup() {
  size(600, 600);
  lines = createGraphics(width, height);
  lines.beginDraw();
  lines.background(0);
  lines.endDraw();
  background(255);
  circs = new ArrayList<Circle>();
}

void draw() {
  background(255);
  for (int i=0; i < circs.size (); i++) {
    circs.get(i).update();
  }
  for (int i=0; i < circs.size (); i++) {
    for (int j=0; j < circs.size (); j++) {
      if (collision(circs.get(i), circs.get(j))) {
        circs.get(i).colliding = true;
        break;
      } else {
        circs.get(i).colliding = false;
      }
    }
  }

  if (showLines) {
    image(lines, 0, 0);
  } else {
    for (int i=0; i < circs.size (); i++) {
      circs.get(i).draw();
    }
  }
}

void mousePressed() {
  if (mousePressed && (mouseButton == LEFT)) {
    circs.add(new Circle(mouseX, mouseY, random(10, maxSize), circleID++));
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    showLines = !showLines;
  }
  if (mousePressed && (mouseButton == CENTER)) {
    circs.clear();
  }
}

boolean collision(Circle test1, Circle test2) {
  if (test1.id == test2.id) return false;
  boolean result = false;
  float testdist = dist(test1.x, test1.y, test2.x, test2.y);
  if (testdist <= (test1.radius + test2.radius)) {
    result = true;
    drawLines(test1.x, test1.y, test2.x, test2.y, int(test1.id%3));
  } else {
    result = false;
  }
  return result;
}

void drawLines(float x1, float y1, float x2, float y2, int col) {
  lines.beginDraw();
  int s = strokeSize;
  int w = s*4+1;
  int a = w - 1;
  for (int i = w; i >= 1; i-=s) {
    lines.strokeWeight(i);
    if (col == 0) lines.stroke(#2edb3a, a-i);
    if (col == 1) lines.stroke(#db3a2e, a-i);
    if (col == 2) lines.stroke(#3a2edc, a-i);
     lines.line(x1, y1, x2, y2);
  }
  lines.endDraw();
}

// a to increase stroke size, z to decrease, r to erase
void keyPressed() {
  if (key=='a') {
    strokeSize++;
    if (strokeSize > 100) strokeSize = 100;
  }
  if (key=='z') {
    strokeSize--;
    if (strokeSize < 1) strokeSize = 1;
  }
  if (key=='r') {
    lines.beginDraw();
    lines.background(0);
    lines.endDraw();
  }
}

class Circle {
  float x, y, radius;
  float dx, dy;
  boolean colliding = false;
  int id;

  Circle(float x, float y, float radius, int id) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.dx = random(-2, 2);
    this.dy = random(-2, 2);
    this.id = id;
  }

  void update() {
    x += dx;
    y += dy;
    if ( x  - radius < 0) {
      dx = -dx;
      x = 0 + radius;
    }
    if ( x  + radius > width) {
      dx = -dx;
      x = width - radius;
    }
    if ( y  - radius < 0) {
      dy = -dy;
      y = 0 + radius;
    }
    if ( y  + radius > height) {
      dy = -dy;
      y = height - radius;
    }
  }

  void draw() {
    if (colliding) {
      fill(0);
    } else {
      fill(255);
    }
    ellipse(x, y, radius*2, radius*2);
    float endX = x + dx*(0.4*radius);
    float endY = y + dy*(0.4*radius);
    float arX = x + dx*(0.2*radius);
    float arY = y + dy*(0.2*radius);
    stroke(#003333);
    line(x, y, endX, endY);
    line(endX, endY, arX + (dy * 0.1*radius), arY - (dx * 0.1*radius));
    line(endX, endY, arX - (dy * 0.1*radius), arY + (dx * 0.1*radius));
    stroke(0);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    text(id, x, y-2);
    textAlign(LEFT, BOTTOM);
    fill(255);
    rect(2, height - 20, 110, 15);
    fill(0);
    text("Strokeweight: "+strokeSize, 5, height - 5);
  }
}
