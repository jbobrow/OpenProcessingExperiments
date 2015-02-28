
//epilepsy warning


void setup() {
  size(800, 800);
  frameRate(15);
}

void draw() {
  fill(random(255), random(255), random(255));
  rect(0, 0, width+20, height+20);
  float r =random(70);
  ellipseMode(CENTER);

  for (int a = 0; a<width; a+=50) {
    for (int b = 0; b<height; b+=50) {

      if (mousePressed) {
        ellipse(mouseX, mouseY, r/2, r/2);
      }
      else {
        ellipse(a+20, b+20, r-50, r-50);
      }
    }
  }
}


