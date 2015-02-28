
PImage tracing;
ArrayList tendrils;

void setup() {
  size (360, 180);
  smooth();
  background(0);
  stroke(234, 0, 149, 70);

  tendrils = new ArrayList();
  tracing = loadImage("woaini.jpg");
  tracing.resize(width, height); 

  for (int i = 0; i < tracing.width-1; i ++) {
    for (int j = 0; j < tracing.height-1; j++) {
      color sample = tracing.get(i, j);
      if((brightness(sample) < 1) && (random(10) < 6)) {
        tendrils.add(new Tendril(i, j, random(10000)));
      }
    }
  }
  println(tendrils.size());
}

void draw() {
  background(255);
  for (int i = 0; i < tendrils.size()-1; i++) { 
    Tendril tnd = (Tendril) tendrils.get(i);
    tnd.update();
  }
}


