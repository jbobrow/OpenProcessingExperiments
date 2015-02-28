
/*
  NOTES: 
  Changed head of snake to arraylist of snake parts
  Created drawSnake method
  Updated keyPressed 
  */
int GRIDSIZE = 20;
ArrayList<SnakePart> snake = new ArrayList<SnakePart>();

void setup() {
  size(400, 400);
  snake.add(new SnakePart(0, 0));
}

void draw() {
  drawGrid();
  drawSnake();
}

void drawSnake(){
    for(int i = 0; i < snake.size();i++){
    SnakePart sp = snake.get(i);
    sp.display();
  }
}

void drawGrid() {
  background(50);
  stroke(255);
  for (int x =0; x < width; x+=GRIDSIZE) {
    line(x, 0, x, height);
  }
  for (int y =0; y < height; y+=GRIDSIZE) {
    line(0, y, width, y);
  }
}


void keyPressed() {
  SnakePart head = snake.get(0);
  if (key == 'a' || key == 'A')head.x -= GRIDSIZE;
  if (key == 'd' || key == 'D')head.x += GRIDSIZE;
  if (key == 'w' || key == 'W')head.y -= GRIDSIZE;
  if (key == 's' || key == 'S')head.y += GRIDSIZE;
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
    ellipse(x,y,GRIDSIZE,GRIDSIZE);   
  }
}


