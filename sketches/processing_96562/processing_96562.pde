
void setup() {
  size(800, 400);
  smooth();
  rectMode(CENTER);
  background(0);
}

void draw() {
}


void keyPressed() {
  background(0);
  MyShape obj = null;

  for (int x=25;x<width;x+=50) {
    int r = (int)random(3);
    if (r ==0) {
      obj = new MyCircle();
    }
    else if (r == 1) {
      obj = new MySquare();
    }
    else if (r==2) {
      obj = new MyTriangle();
    }

    obj.drawMe(x);
  }
}

class MyShape {
  int x=200;
  int y=200;
  public MyShape() {
  } 
  public void drawMe(int x) {
    println("supper class");
  }
}

class MyCircle extends MyShape {
  public MyCircle() {
  } 
  public void drawMe(int x) {
    println("sub class");
    ellipse(x, height/2, 40, 40);
  }
}

class MySquare extends MyShape {
  public MySquare() {
  } 
  public void drawMe(int x) {
    println("sub class");
    rect(x, height/2, 40, 40);
  }
}

class MyTriangle extends MyShape {
  public MyTriangle() {
  } 
  public void drawMe(int x) {
    println("sub class");
    triangle(x-20, height/2+20, x,height/2-20, x+20,height/2+20);
    //    triangle(200, 100, 300, 300, 100, 300);
  }
}
