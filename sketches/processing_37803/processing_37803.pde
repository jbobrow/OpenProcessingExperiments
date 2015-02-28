
void setup() {
  size (300, 300);
  colorMode(HSB, width);
}

//nested for loop to create background design
void draw() {
  background(0);
  ellipseMode(CENTER);
  for (int x=0; x<320; x+=50) {
    for (int y=0; y<300; y+=25) {
      noFill();
      stroke(mouseX, x, width);
      ellipse(x, y, 80, 80);
    }
  }
  // to create the bands
  for (int t=0; t<300; t+=5) {
    stroke(mouseY, t, width);
    fill(mouseY, t, width);
    rectMode(CENTER);
    rect(t, 50, t, 10);
    rect(50, t, 10, t);
    ///changes the rate of color change for the right/bottom side
    stroke(mouseY*2, t, width);
    fill(mouseY*2, t, width);
    rect(250, t, 10, t);
    rect(t, 250, t, 10);
  }
}


