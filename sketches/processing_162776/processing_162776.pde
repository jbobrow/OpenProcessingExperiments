
int x = 175;
int y = 200;



void setup() {
  size(500, 500);
  rectMode(CENTER);
  fill(100);
  rect(250, 350, 250, 400);
 
}
void draw() {
  while (y<height) {
    drawWindow(x,y);
    drawWindow(x+75, y);
    drawWindow(x+150,y);
    
    y+=100;
  }
 
}

void drawWindow(int x, int y) {
  rectMode(CENTER);
  fill(150,0,100);
  rect(x, y, 50, 50);
  stroke(255);
  line(x, y-25, x, y+25);
  line(x-25, y, x+25, y);
}

