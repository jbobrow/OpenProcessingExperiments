
void setup() {
  size(500, 500);
  background(0, 0, 0);
  smooth();
  float x;
}
void draw() {
  float x = map(mouseX, 20, width-50, 10, 100);
  crazy(x);

  if (keyPressed==true) {
    if (key == ' '){
      background(255, 255, 255);
    } 
  }
}


void crazy(float op) {
  for (int i = height/10; i<height+height/10; i+=height/10) {
    float x = map(mouseX, 0, 500, 150, 0);
    fill(random(x, 255), random(x, 255), random(x, 255), op);
    noStroke();
    rect(0, i-height/10, width, i);
  }
}
