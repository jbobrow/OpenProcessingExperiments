
Brush myBrush;

void setup() {
  size(500, 500);
  myBrush=new Brush(mouseX, mouseY);
}

void draw() {
  myBrush.follow();
  myBrush.display();
}

class Brush {
  float x;
  float y;
  float followSpeedX = 0;
  float followSpeedY = 0;

  Brush(float theX, float theY){
    x = theX;
    y = theY;
  }


  void follow() {
    float deltaX = mouseX - x;
    float deltaY = mouseY - y;
    
    if (deltaX < 0) followSpeedX--;
    if (deltaX > 0) followSpeedX++;
    if (deltaY < 0) followSpeedY--;
    if (deltaY > 0) followSpeedY++;
    
    followSpeedX = followSpeedX * 0.95;
    followSpeedY = followSpeedY * 0.95;
    
    x = x + followSpeedX;
    y = y + followSpeedY;
    
    // float followX = map(deltaX, 0, width, 0, followSpeed);
  
  }

  //appearence
  void display() {
    
    fill(255,10);
    rect(0,0,width,height);
    
    fill(100,30);
    ellipse (x, y, 10, 10);
  }
}




