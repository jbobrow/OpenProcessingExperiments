
void setup() { 
  size(300, 300);
}

int increment = 50;

void draw() {
  background(mouseY, mouseY, mouseY);

  ellipseMode(RADIUS);
  fill(255);
  noStroke();

  ellipse(width/2-100, 0, width/4, height/4);
  ellipse(width/2, 0, width/6, height/6);
  ellipse(width/2+100, 0, width/4, height/4);

  strokeWeight(2);
  stroke(255);
  point(increment, 75+mouseY);
  point(increment+50, 100+mouseY);
  point(increment+100, 75+mouseY);
  point(increment+150, 50+mouseY);
  point(increment+200, mouseY);
  mouseY++;
}











