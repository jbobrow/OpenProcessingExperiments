
Rain[] rain = new Rain[500];

void setup() {
  size(400, 300);
  smooth();
  textSize(50);
  textAlign(CENTER);

  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(5));
  }
}


void draw() {
  background(80);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }

  int s = second();
  int m = minute();
  int h = hour();

  noStroke();
  fill(255,80);
  rect(0, height - s*5, width, height);

  fill(255);
  String t = h + ":" + nf(m, 2);
  text(t, width/2, height/2);
}

class Rain {
  float x, y, s;

  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }

  void move() {
    y += s;
    if (y > height) y = 0;
  }

  void display() {
    stroke(255,random(100,255));
    line(x,y,x,y + random(70));
  }
}


