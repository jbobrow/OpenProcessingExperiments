
SnakePart head;

void setup() {
  size(400, 400);
  head =  new SnakePart(0, 0);
}

void draw() {
  drawGrid();
  head.display();
}


void drawGrid() {
  background(50);
  stroke(255);
  for (int x =0; x < width; x+=20) {
    line(x, 0, x, height);
  }
  for (int y =0; y < height; y+=20) {
    line(0, y, width, y);
  }
}


void keyPressed() {
  if (key == 'a' || key == 'A')head.x -= 20;
  if (key == 'd' || key == 'D')head.x += 20;
  if (key == 'w' || key == 'W')head.y -= 20;
  if (key == 's' || key == 'S')head.y += 20;
}






class SnakePart{
  
  int x,y;
  
  SnakePart(int newX, int newY){
    x = newX;
    y = newY;
  }
  
  void display(){
    fill(255);
    ellipseMode(CORNER);
    ellipse(x,y,20,20);   
  }
}


