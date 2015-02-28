
List<Line> lines = new ArrayList<Line>();
final int MAX_LINE =50 ;
final color ALPHA_MASK = color(0, 20);


void setup() {
  size(450, 350);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  rectMode(CENTER);

  for (int i = 0; i < MAX_LINE;i++) {
    lines.add(new Line());
  }
}

void draw() {
  noStroke();
  fill(ALPHA_MASK);
  rect(width/2, height/2, width, height);

  for (Line line :lines) {
    line.display();
    line.move();
  }
}

class Line {
  float X_SPEED = 1.5;
  float Y_SPEED = 0;
  
  PVector point;
  PVector speed;
  float rect_w;
  float rect_h;
  float hue = 0;

  Line() {
    speed = new PVector(X_SPEED,Y_SPEED);
    if (round(random(1)) == 1) {
      speed.mult(-1);  
    } 

    rect_w = random(220, 280);
    rect_h = random(1, 10);
    point =  new PVector(random(width), random(height));
  }

  void display() {
    noStroke();
    fill(hue, 100, 100, 50);
    rect(point.x, point.y, rect_w, rect_h);

    hue++;
    hue = hue % 360;
  }

  void move() {
    point.add(speed);
    if (point.x > width + random(1, 5)|| point.x < -random(1, 5)) {
      rect_w = random(220, 280);
      rect_h = random(1, 10);
      point.y = random(width);

      if (speed.x > 0) {
        point.x = - random(1, 4);
      }
      else {
        point.x = width+random(1, 4);
      }
    }
  }
}

