

void setup() {
  size(400, 400);
}

void draw() {
  float a=random(255);
  float b=random(255);
  float c=random(255);
  background(a,b,c,a);
  drawmonster(mouseX, mouseY);
}

void drawmonster (int x, int y) {
  fill(0);
  triangle(x+10,y-10,x+20,y-20,x+40,y-40);
  triangle(x-10,y-10,x-20,y-20,x-40,y-40);
  ellipse(x, y, 80, 110);
  fill(255);
  ellipse(x-10, y-10, 12, 10);
  ellipse(x+10, y-10, 12, 10);
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(x, y+15, 40, 10);
  
}


