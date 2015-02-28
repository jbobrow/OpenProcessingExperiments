
class circle{
  int x;
  int y;
  int xSpeed = 1;
  int ySpeed = 1;
  
  circle(int tempX, int tempY){
    x = tempX;
    y = tempY;
  }
  
  void display(){
    ellipse(x,y,20,20);
  }  
  
  void move(){
    x = x + xSpeed;
    y = y + ySpeed;
  }
  
  void edge(){
    if (x-10 == 0) xSpeed = 1;
    if (x+10 == 500) xSpeed = -1;
    if (y-10 == 0) ySpeed = 1;
    if (y+10 == 500) ySpeed = -1;
  }
}

