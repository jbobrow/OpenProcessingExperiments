
// THERE IS NO INK IN THIS PEN ...

void setup() {
  size(300, 300);
  background(255, 255, 255);
}
int x=0;
int y=0;
void draw() {

  // LINED PAPER BACKGROUND AS FOLLOWS:
  //horizontal lines -
  background(255, 255, 255);
  strokeWeight(1);
  stroke(100, 111, 129);
  line(x, y+40, width, y+40);
  line(x, y+80, width, y+80);
  line(x, y+120, width, y+120);
  line(x, y+160, width, y+160);
  line(x, y+200, width, y+200);
  line(x, y+240, width, y+240);
  line(x, y+280, width, y+280);
  //verticalline -
  strokeWeight(2);
  stroke(185, 34, 72);
  line(x+40, y, x+40, height);
  //PEN SHAFT:
  noStroke();
  fill(x);
  rect(mouseX-40, mouseY+64, width/3.68, height*3);
  //POINT OF PEN:
  noStroke();
  fill(245, 233, 195);
  triangle(mouseX, mouseY, mouseX-40, mouseY+64, mouseX+40, mouseY+64);
  fill(50);
  triangle(mouseX, mouseY, mouseX-7, mouseY+10, mouseX+7, mouseY+10);
  fill(100);
  rect(mouseX-10, mouseY+150, width/20, height*2);
}


