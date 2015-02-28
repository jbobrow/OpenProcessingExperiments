
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064

void setup() {
  size(800, 800);
  background(255);
  smooth();
  frameRate(15);
}

void draw() {
  //pattern (white and black)
  for (int i = 10; i < width; i += 20) {
    for (int j = 10; j < height; j += 20) {
      rectMode(CENTER);
      fill(0);
      rect(i, j, 0, 5);
      fill(0);
      rect(j, i, 5, 0);
    }
  }


  stroke(100, 600, 600);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(random(300));
  quad(0, 0, width, height, mouseX, mouseY, pmouseX, pmouseY);
  fill(100);
  ellipse(mouseX, mouseY, 30, 30);
  fill(200);
  ellipse(mouseX, mouseY, 25, 25);
  fill(300);
  ellipse(mouseX, mouseY, 18, 18);

  //Clock Text 
  fill(200);
  textSize(15);
  text("KIM Mirae, Untitled, 2014", 550, 730);
}

