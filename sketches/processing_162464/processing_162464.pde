
void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  drawMonster(mouseX, mouseY);
}
void drawMonster(int x, int y) {
  int q = 100;
  int n = 100;
  fill(0);
  ellipse(x, y, q, q);
  fill(90);
  rect(x-150, y-150, 300, 300);
  rect(x-15, y-50, 30, 150);
  fill(255);
  ellipse(x-75, y-75, 50, 50);
  ellipse(x+75, y-75, 50, 50);
  fill(0);
  ellipse(x-75,y-75,25,25);
  ellipse(x+75,y-75,25,25);
  fill(0);
  triangle(x-100,y+50,x+100,y+50,x,y+150);


}
