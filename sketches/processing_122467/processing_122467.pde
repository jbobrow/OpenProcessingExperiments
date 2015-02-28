
void setup () {

  size (500, 500);
}

void draw() {
  background(255);

  stroke(0);
  fill(255);

  line(mouseX, mouseY+25, mouseX, mouseY+150);
  //benen lr
  line(mouseX, mouseY+150, mouseX-50, mouseY+250);
  line(mouseX, mouseY+150, mouseX+50, mouseY+250);
  //armen lr
  line(mouseX, mouseY+75, mouseX+60, mouseY+150);
  line(mouseX, mouseY+75, mouseX-60, mouseY-25);
  //hoofd
  ellipse(mouseX, mouseY, 50, 50);
  //oogleden lr
  fill(0);
  //ogen lr
  fill(255);
  ellipse(mouseX-10, mouseY+8, 10, 5);
  ellipse(mouseX+10, mouseY+8, 10, 5);
  fill(255, 0, 0);
  triangle(mouseX-25, mouseY, mouseX+25, mouseY, mouseX, mouseY-75);
}

