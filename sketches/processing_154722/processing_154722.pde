
ArrayList<Wave> waves = new ArrayList<Wave>();

void setup() {
  size(800, 500);
  noStroke();
  waves.add(new Wave(50.0));
  while(waves.size() <= 10) {
    waves.add(new Wave(50 + 50*waves.size()));
  }  
}

void draw() {
  background(255);
  for (Wave w : waves) {
    w.display();
  }
}

class Wave{
  color colour;
  float winkel;
  float a = random(0, 180);
  float inc = TWO_PI/20.0;
  float ampli = random(5, 14);
  float x, y;
  float helper;
  
  Wave(float helper) {
    colour = color(0, 0, int(random(100, 180)));
    this.helper = helper;
  }
  
  public void display() {
    fill(colour);
    for(int i=0; i<width; i=i+5) {
      x = i;
      y = helper + -sin(a) * ampli;
      rect(x, y, 5, height-y);
      a = a + inc;
    }
  }
}
