
float diam;
float x;
float y;

void setup() {
  size(400, 600);
  background(50);
  smooth();
}

void draw() {
  diam = random(40, 80);
  x = random(width);
  y = random(height);
  noStroke();

  color[] colorList = {
    color(224, 224, 224), color(192, 192, 192), color(160, 160, 160), color(128, 128, 128), color(96, 96, 96)
  };
  color randomColor = colorList[(int) random(colorList.length)];

  if (mousePressed == true) {
    float ellipseDistance = dist(mouseX, mouseY, pmouseX, pmouseY);
    if (ellipseDistance > 5) {
      fill(randomColor, 80);
    } else {
      return;
    }
  } else {
    fill(224, 224, 224, 30);
  }
  ellipse(mouseX, mouseY, diam, diam);


  fill(240);
  rect(0, 0, width, 20);
  rect(width-20, 0, 20, height);
  rect(0, 0, 20, height);
  rect(0, height-20, width, 20);
}



