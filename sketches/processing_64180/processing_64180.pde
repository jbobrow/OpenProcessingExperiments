
void setup() {
  size(600, 600);
  background(44);
  smooth();
  noStroke();
}
 
void draw() {
  for (float x = width/6; x <= 5 * width/6; x = x + width/6) {
    for (float y = height/6; y <= 5 * height/6; y = y + height/6) {
    arc(x, y, 50, 50, 0, PI/2);
    fill(random(1,250), 30, 40, 50);

    }
  }
}


