
ArrayList<Object> objects;
float angle = 0;

void setup() {
  size(600, 600);
  smooth();
  background(0);
  objects = new ArrayList<Object>();

  for (int i = 0; i < 15; i++) {
    objects.add(new Object());
  }
}

void draw() {
  background(30);
  translate(width/2, height/2);
  rotate(angle);
  angle += 0.003;

  noStroke();
   fill(255, 150, 10, 40);
  //fill(255, 100, 50, 70);
  beginShape(TRIANGLE_FAN);
  for (Object o : objects) {

    if ( (mouseX!=pmouseX) && (mouseX!=pmouseX) ) {
      float m = sqrt((mouseX-pmouseX)*(mouseX-pmouseX) + (mouseY-pmouseY)*(mouseY-pmouseY));
      o.hide(m);
    } else { 
      o.update();
    }

    vertex(o.location.x, o.location.y);
  }
  endShape();
}

class Object {

  PVector location;
  float radius = 50; 
  float theta = random(TWO_PI);
  float pr = random(1000);
  float pt = random(1500);
  float roff = 0.001;
  float toff = 0.001;

  int rRange = 2;
  float thetaRange = PI/300;

  Object() {
  }

  void update() {
   
    float r = map(noise(pr), 0, 1, -rRange, rRange);
    float t = map(noise(pt), 0, 1, -thetaRange, thetaRange);

    radius += r;
    theta += t;

    pr += roff;
    pt += toff;

    location = new PVector(radius*cos(theta), radius*sin(theta));
  }

  void display() {
    noStroke();
    fill(255);

    ellipse(location.x, location.y, 5, 5);
  }

  void hide(float m) {
    
    if (radius > 50) {
      float r = map(noise(pr), 0, 1, 0, 10);
      float t = map(noise(pt), 0, 1, -thetaRange, thetaRange);
      float hideRate = map(m, 0, 500, 0, 30);
      radius -= hideRate;
      theta += t;
    } else {
      radius = 50;
    }

    pr += roff;
    pt += toff;
    location = new PVector(radius*cos(theta), radius*sin(theta));
  }
}
