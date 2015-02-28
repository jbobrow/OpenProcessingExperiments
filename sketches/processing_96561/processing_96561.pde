
void setup() {
  size(400, 400);
  smooth();
  rectMode(CENTER);
  background(0);
  noLoop();
}

void draw() {
  MyShape obj = new MyCircle();
  obj.drawMe();
}

class MyShape {
  int x=200;
  int y=200;
  public MyShape() {
  } 
  public void drawMe() {
    println("supper class");
    rect(200,200,200,200);
  }
}

class MyCircle extends MyShape{
  public MyCircle() {
  } 
  public void drawMe() {
    println("sub class");
    ellipse(200,200,200,200);
  }
}
