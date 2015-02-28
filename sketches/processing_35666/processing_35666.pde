
void
setup() {
  size(300, 300);
}

int x=30;

void draw() {
}

void mouseDragged() {

  fill(120, mouseY, 120);
  noStroke();
  rect(0, 250, width, 300);

  stroke(4);
  fill(mouseY, 0, 100);
  ellipse(width/2, height/2, 
  5*width/6, 5*height/6);

  noStroke();
  rect(0, 0, width, 200);

  fill(25, 25, 112);
  rect(0, 250, width, 300);

  fill(255);
  triangle(width/2, height/2+x, width/2-x, height/2+2*x, width/2+x, height/2+2*x);
  x++;

  stroke(5);
  line(width/2, height/2+2*x, width/2, height/2+2*x+10);

  fill(165, 42, 42);
  rect(width/2-.5*x, height/2+2*x+10, x, x/3);
}







