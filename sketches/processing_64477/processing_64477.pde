
ArrayList<Circle> circles;
float a;

void setup() {
  size(400, 400);
  circles = new ArrayList<Circle>();
  circles.add(new Circle());
}

void draw() {
  fill(255,20);
  rect(0,0,width,height);
  translate(width/2, height/2);
  circleDisplay();
  a++;
}

void mousePressed() {
  if (circles.size() > 12) {
    circles.clear();
  }
  circles.add(new Circle());
}

void circleDisplay() {
  float px, py;
  Circle c;
  float ans = 360/circles.size();
  for (int i=0; i<circles.size(); i++) {
    c = circles.get(i);
    px =width/3 * sin(radians(ans*i+a));
    py =height/3 * cos(radians(ans*i+a));
    c.setPoint(px, py);
    c.display();
  }
}


class Circle {
  float x, y, w;
  float c; //color
  Circle() {
    w = random(5, 20);
    this.c = random(70, 200);
  }

  void setPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(0, 0, c);
    ellipse(x, y, w, w);
  }
}


