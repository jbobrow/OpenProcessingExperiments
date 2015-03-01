
color bg = #352238, f = #87334F;
int step = 50;
float diam = 20;
 
void setup() {
  size(400, 600);
  background(bg);
  fill(f);
  noStroke();

  for (int y=step/2; y<height; y +=step) {
    for (int x=step/2; x< width; x += step) {
      ellipse(x, y, diam, diam);
      diam += 0.5;
    }
  }
}

