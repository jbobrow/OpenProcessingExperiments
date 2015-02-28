
void setup() {
  size(300, 300);
  smooth();
  colorMode(HSB, width);
}

void draw() {
  //background
  stroke(255);
  fill(180,100,200, 50);
  rect(0, 0, width, height);

  //figure1
  stroke(3);
  fill(100, 100, 200);
  ellipse(width/4, height/4, mouseX, mouseX);
  stroke(2);
  fill(255, 100, 200);
  ellipse(width/4, height/4, 100, 100);
  fill(mouseX);
  ellipse(width/4, height/4, 80, 80);

  //firgure2
  stroke(4);
  fill(0, 100, 200);
  ellipse(width, height, mouseY, mouseY);
  stroke(2);
  fill(220, 100, 200);
  ellipse(width, height, 150, 150);


  //mouse
  fill(100);
  stroke(1);
  ellipse(mouseX, mouseY, 50, 50);
  fill(40, 100, 200);

  //figure3&4
  fill(40, 100, 200);
  ellipse(250, height/4, mouseX-250, mouseX-250);
  ellipse(width/4, 250, mouseY-250, mouseY-250);
  fill(150, 100, 200);
  ellipse(250, height/4, 20, 20);
  ellipse(width/4, 250, 40, 40);
  fill(0);
  ellipse(250, height/4, 10, 10);
  ellipse(width/4, 250, 10, 10);
}


