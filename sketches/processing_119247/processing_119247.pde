
int h, m, s;
void setup() {
  size(400, 400);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  s = second ();
  m = minute ();
  h = hour ();

  background(255);
  translate(width/2, height/2);
  noStroke();

  bubble(5, 150, 90);
  bubble(5, 160, 30);
  //bubble(5, 170, 15);
  bubble(5, 180, 6);
  bubble(20, 0, 1);

  noFill();
  stroke(100);
  strokeWeight(3);
  //ellipse(0, 0, width-10, height-10);

  // hour
  strokeWeight(10);
  pushMatrix();
  rotate(radians (30*h));
  line(0, 0, 0, -60);
  popMatrix();

  //minute
  strokeWeight(10);
  pushMatrix();
  rotate(radians (6*m));
  line(0, 0, 0, -120);
  popMatrix(); 

  //second
  strokeWeight(5);
  pushMatrix();
  rotate(radians (6*s));
  line(0, 0, 0, -150);
  popMatrix();
}

void bubble(int size, int rd, int pt) {
  int radius = rd;
  int point = pt;
  for (int deg = 0; deg<360;deg+=point) {
    float angle = radians(deg);
    float x = (cos(angle)*radius);
    float y = (sin(angle)*radius);
    fill(100);
    ellipse (x, y, size, size);
  }
}
