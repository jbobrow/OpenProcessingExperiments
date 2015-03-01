
void setup(){
size(500, 500);
background(255, 215, 0);
}

void drawShape(int x, int y)
{fill(255,235,0);
  noStroke();
  rect(x, y, 50, 20);
fill(255, 255, 0);
rect(x, y, 20, 15);
}

void draw(){
  drawShape(0, 0);
  drawShape(100, 100);
  drawShape(200, 200);
  drawShape(300, 300);
  drawShape(400, 400);
}




