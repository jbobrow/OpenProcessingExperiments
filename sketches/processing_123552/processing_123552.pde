
//declare class
Ball[][] Bill;
//columns and rows
int cols = 20;
int rows = 10;

void setup() {
  size(400, 400);
  background(0);
  //adds the class into double array
  Bill = new Ball[cols][rows];
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      Bill[x][y] = new Ball(x*50, y*50, x+y);
    }
  }
  //this is pretty explanatory
  frameRate(80);
}
void draw() {
  //draws the class
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      Bill[x][y].display();
      Bill[x][y].oscillate();
    }
  }
}
class Ball {

  float x, y;
  float angle;

  Ball(float mx, float my, float tempAngle) {
    x = mx;
    y= my;
    angle= tempAngle;
  }
  void display() {
    //red coloring
    fill(255, 127+127*sin(angle), 127+127*sin(angle));
    //body
    stroke(10);
    ellipse(x, y, 70, 70);
    //face
    stroke(255);
    ellipse( x-10, y-12, 5, 5);
    ellipse( x+10, y-12, 5, 5);
    line(x+7, y+5, x-7, y+5);
  }
  void oscillate() {
    angle += 0.1;
  }
}

