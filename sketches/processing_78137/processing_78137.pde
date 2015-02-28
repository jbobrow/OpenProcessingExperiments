
Snake snake;

void setup() {
  size(500,500);
  snake = new Snake(30);

}

void draw() {
  background(255);
  snake.update(mouseX,mouseY);
  snake.display();
}
class Point {
  int xpos;
  int ypos;

  Point() {
    xpos = 0;
    ypos = 0;
  }
  
  void set_pos(int x,int y){
    xpos = x;
    ypos = y;
  }
}
class Snake {
  int [] xpos = new int[50];
  int [] ypos = new int[50];
  Point[] points = new Point[50];
  float dia;

  Snake(float dia_) { 
    dia = dia_;
    for (int i = 0; i < points.length; i++) {
      points[i] = new Point();
    }
  }
 
  void display() {
    for (int i = 0; i < points.length; i++) {
      // Random colors
      fill(random(100, 255), random(100, 255), random(100, 255));
      ellipse(points[i].xpos,points[i].ypos, dia*(i/15.0), dia*(i/15.0));
    }
  }

  void update(int currentXpos, int currentYpos) {
    // Shift old positions 1 element down in the points array
    for (int i = 1; i < points.length; i++) {
      points[i-1].set_pos(points[i].xpos,points[i].ypos);   
    }
    // Update newest position
    points[points.length-1].set_pos(currentXpos,currentYpos);
  }
}



