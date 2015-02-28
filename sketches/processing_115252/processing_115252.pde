

float[] x = new float[5];
float anchor = 250;
float[] y = new float[5];
float[] angle = new float[5];
float[] freq = new float[5];

color penisColor = color(234, 196, 144);

ArrayList<Semen> semenList;

void setup() {
  size(400, 400);

  x[0] = width/2 - 30;
  x[1] = width/2 - 33;
  x[2] = width/2;
  x[3] = width/2 + 33;
  x[4] = width/2 + 30;

  for (int i = 0; i < freq.length; i++) {
    freq[i] = random(PI/2.4, 3.4*PI/2);
  }

  semenList = new ArrayList<Semen>();
}

void draw() {
  background(0);

  setPoints();

  fill(penisColor);
  ellipse(width/2 - 50, height, 80, 40);
  ellipse(width/2 + 50, height, 80, 40);
  curveTightness(map(anchor, 250, 100, 0, 0.5));
  beginShape();
  for (int i = 0; i < 2; i++) {
    curveVertex(width/2 - 30, height);
    for (int j = 0; j < x.length; j++) {
      curveVertex(x[j], y[j]);
    }
    curveVertex(width/2 + 30, height);
  }
  endShape();
  stroke(0, 100);
  line(x[2], anchor, x[2], anchor + 10);
  noStroke();

  for (int i = 0; i < 5; i++) {
    x[i] = x[i] + sin(angle[i]);
    y[i] = y[i] + sin(angle[i]);
    angle[i] += freq[i];
  }

  changeErectness();

  for (int i = 0; i < semenList.size(); i++) {
    Semen sem = semenList.get(i);
    sem.display();
    if (sem.life <= 0) {
      semenList.remove(i);
    }
  }
}

void setPoints() {
  if (anchor < 250) {
    anchor += 0.5;
  }
  y[0] = anchor + 50;
  y[1] = anchor + 30;
  y[2] = anchor;
  y[3] = anchor + 30;
  y[4] = anchor + 50;
}

boolean isOnPenis() {
  if (get(mouseX, mouseY) == penisColor) {
    return true;
  }
  else {
    return false;
  }
}

void changeErectness() {
  if (isOnPenis() && abs(mouseY - pmouseY) > 20 && anchor > 100) {
    anchor -= 3;
  }
  if (anchor < 101) {
    ejaculate();
  }
}

void ejaculate() {
  for (int i = 0; i < 3; i++) {
    semenList.add(new Semen(width/2, anchor));
  }
}


class Semen {

  PVector pos;
  PVector vel;
  PVector accel;
  int life;
  color c;

  Semen(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-10, 10), random(-20, -1));
    accel = new PVector(0, 0.1);
    life = 100;
  }

  void display() {
    pos.add(vel);
    vel.add(accel);
    life--;
    c = color(255, map(life, 100, 0, 255, 0));
    fill(c);
    ellipse(pos.x, pos.y, 2, 2);
  }
  
}



