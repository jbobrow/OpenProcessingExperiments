
class Cat {
float xPos;
float yPos;
float xSpeed;
  
  Cat(float xPos_, float yPos_, float xSpeed_) {
    xPos = xPos_;
    yPos = yPos_;
    xSpeed = xSpeed_;
  }
  
  void display() {
    fill(251,215,72);
    ellipse(xPos,yPos,30,20);
    ellipse(xPos+15,yPos,15,15);
    curve(xPos,yPos,xPos-20,yPos,xPos-30,yPos-15,xPos-50,yPos+20);
  }
  
  void move() {
    xPos = xPos + xSpeed;
    if (xPos > width) {
      xPos = 100;
    }
  }
  
  void mouse() {
     if (dist(xPos,yPos,mouseX,mouseY) < 15) {
       yPos -= 10;
     }
   }
} 


