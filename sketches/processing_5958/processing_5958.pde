
int x;
int y;

void setup(){
  size (800, 800);
}

void draw(){
  background (250);

  y = 0;

  while ( y < 800){
    x = 0;
    while ( x < 800){
      fill(mouseX, -mouseY, mouseY);
      rect(x, y, 25, 75);
      fill(100, 200, 50, 165);
      rect (x, y, 50, 50);
      fill(20, mouseY, mouseX, 127);
      ellipse (x + 75, y + 75, 150, 150);
      x = x + 100;
    }
    y = y + 100;
  }
}


