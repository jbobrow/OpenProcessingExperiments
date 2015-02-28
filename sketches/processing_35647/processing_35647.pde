
void setup() {
  size(300, 300);
  
}

int x = 2;

void draw() {
  //Ellipse around the quagrants
  ellipseMode(CORNERS);
  fill(width, mouseY, width);
  background(100);
  ellipse(mouseX, mouseY, 150, 150);

  fill(mouseX, x, x);

  //Ellipse top Left
  ellipseMode(CENTER);
  ellipse(75, 75, mouseX/x, mouseY/x);

  //Ellipse top Right
  ellipse(225, 75, mouseX/x, mouseY/x);

  //Ellipse bottom Left
  ellipse(75, 225, mouseX/x, mouseY/x);

  //Ellipse bottom Right
  ellipse(225, 225, mouseX/x, mouseY/x);

  //Rectangle, open, close, expand
  rectMode(CENTER);
  fill(x, mouseX, width);
  rect(150, 150, mouseX/x, mouseY/x);

  //Line, lines bounding rotating ellipse
  fill(width, x, height);
  line(mouseX, 300, mouseX, 0);
  line(0, mouseY, 300, mouseY);

  //Rectangle
  rectMode(CENTER);
  fill(mouseY, x, width);

  //Rectangle top Left
  rect(75, 75, mouseX/4, mouseY/4);

  //Rectangle top Right
  rect(225, 75, mouseX/4, mouseY/4);

  //Rectangle bottom Left
  rect(75, 225, mouseX/4, mouseY/4);

  //Rectangle bottom Right
  rect(225, 225, mouseX/4, mouseY/4);
}


