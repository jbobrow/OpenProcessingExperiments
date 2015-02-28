
float a = random(50);

void setup() {
  size (1024, 768);
  background(255);
  smooth();
}

void draw() {
  title();

  //ellipse
  fill(255, 255, 255, 0);
  for (int a=0; a<width; a=a+50) {
    for (int b=0; b<height; b=b+50) {
      fill(100, 100, 100, 1);
      strokeWeight(0.1);
      stroke(255);
      ellipse(a, b, 30, 30);
      ellipse(a+15, b, 30, 30);
      ellipse(a, b+15, 30, 30);
      ellipse(a+15, b+15, 30, 30);
    }
  }

  fill(0);
  stroke(255);
  strokeWeight(10);
  triangle(mouseX, mouseY-40, mouseX-40, mouseY+40, mouseX+40, mouseY+40);
}

void keyPressed() {
  background(0);
  redraw();
}

void title() { 
  fill(255);
  textAlign(RIGHT);
  text("CHOE Goeun, frill, Dynamic Media, 2014", width-50, height-20);
}
