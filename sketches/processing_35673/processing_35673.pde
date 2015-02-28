
void setup() {
  size(300, 300);
  colorMode(RGB);
}

int x = width;

void draw() {
  background(40, 40, 40);
  stroke(230, 230, 230);
  strokeWeight(3);
  line(0, height/3+5, width, height/3+5);
  line(0, height-5, width, height-5);
  strokeWeight(2);
  stroke(255, 255, 0, 200);
  line(0, height*2/3+2.5, width, height*2/3+2.5);
  line(0, height*2/3-2.5, width, height*2/3-2.5);
  //the lines and road ^
  noStroke();
  fill(0, 255, 0, 175);
  rectMode(CORNER);
  rect(0, 0, width, height/3);
  //the grass ^

  rectMode(CENTER);
  fill(0);
  rect(mouseX-45, mouseY, 20, 65);
  rect(mouseX+45, mouseY, 20, 65);
  fill(mouseX, mouseX, mouseX);
  rect(mouseX, mouseY, 120, 60);
  fill(75, 75, 75);
  rect(mouseX, mouseY, 60, 60);
  fill(mouseX, mouseX, mouseX);
  rect(mouseX, mouseY, 45, 55);
  //the car ^
}

void mouseDragged() {

  rectMode(CENTER);
  fill(0);
  rect(mouseX-45, mouseY, 20, 65);
  rect(mouseX+45, mouseY, 20, 65);
  fill(240, 240, 240);
  rect(mouseX, mouseY, mouseX+120, 60);
  fill(75, 75, 75);
  rect(mouseX, mouseY, mouseX+60, 60);
  fill(240, 240, 240);
  rect(mouseX, mouseY, mouseX+45, 55);
  //this is how you make it a limo. ^
}


