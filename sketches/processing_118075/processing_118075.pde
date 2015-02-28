
void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
}
 
void draw() {
  background(0);
 
  for (int x=0; x<=20; x++) {
    for (int y=0; y>=20; y++) {
      stroke(random(255), random(255), random(255), random(255));
      noFill();
      triangle(x*40, y*40, 30, 30, x, y);
    }
  }
 
  int count = 120;
  for (int x = 50; x <= width-50; x += 20) {
    for (int y = 50; y <= height-50; y+=20) {
      float s = map(count, 120, 0, 0, 120*2);
      triangle(x, y, pmouseX, pmouseY, mouseX, mouseY);
      stroke(random(255), random(255), random(255), random(255));
      count--;
    }
  }
}



