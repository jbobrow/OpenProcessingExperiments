
ArrayList<Float> x;
ArrayList<Float> y;
ArrayList<Float> vx;
ArrayList<Float> vy;


void setup() {
  size(400, 400);
  x = new ArrayList<Float>();
  y = new ArrayList<Float>();
  vx = new ArrayList<Float>();
  vy = new ArrayList<Float>();


  //add 100 particles
  for (int i = 0; i < 100; ++i) {
    x.add(random(width));
    y.add(random(height));
    vx.add(random(-5, 5));
    vy.add(random(-5, 5));
  }
}
void update() {
  for (int i = 0; i < x.size (); ++i) {
    x.set(i, x.get(i) + vx.get(i));
    y.set(i, y.get(i) + vy.get(i));

    if (x.get(i) < 0 || x.get(i) > width || y.get(i) < 0 || y.get(i) > height) {
      x.set(i, random(width));
      y.set(i, random(height));
      vx.set(i, random(-5, 5));
      vy.set(i, random(-5, 5));
    }
  }
}

void draw() {
  background(0);   

noStroke();

  update();
   fill(random(255), 100, 255);
  for (int i = 0; i < x.size (); i++) {
    ellipse(x.get(i), y.get(i), 10, 10);
  }
}
