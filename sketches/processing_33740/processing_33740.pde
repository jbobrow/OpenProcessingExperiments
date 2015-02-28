
class Ball {
  int x;
  int y;
  int vx;
  int vy;

  //Constructor
  Ball(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }

  void behavior() {
    ellipse(x, y, 100, 100);
    x = x + vx;
    y = y + vy;
    
    //Right wall
    if (x>=width) {
      vx = -vx;
    }
    //Bottom wall
    if (y>=height) {
      vy = -vy;
    }
    //Left wall
    if (x<=0) {
      vx = -vx;
    }
    //Top wall
    if (y<=0) {
      vy = -vy;
    }
  }
    /*
    void testing(){
     print(vx+" ");
     print(vy); 
    }
    */
}


