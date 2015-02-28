
float y = 50;
float speed = 6;
float radius = 3;
float radius2 = 2;

void setup(){
  size(250, 250);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw(){
  frameRate(200);
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  radius2 += 1;
  ellipse(mouseX, mouseY, radius, radius);
  noFill();
  stroke(250);
  ellipse(mouseX, mouseY, radius2, radius2);
}

void mouseClicked(){
  radius2 = 0;
}

