
class Rectangle {

  //properties

  int rectPosX;
  int rectPosY;
  int rectWidth;
  int rectHeight;
  color rectColor;
  int xSpeed;


  //constructor

  Rectangle( int x, int y, int w, int h, color c, int s) {

    this.rectPosX = x;
    this.rectPosY = y;
    this.rectWidth = w;
    this.rectHeight = h;
    this.rectColor = c;
    this.xSpeed = s;
  }

  void drawRectangle() {
    fill(this.rectColor);
    rect( this.rectPosX, this.rectPosY, this.rectWidth, this.rectHeight);
  }


 
    
    void updatePosition() {
    if ((this.rectPosX >width)
      || (this.rectPosX <0)) {
      this.xSpeed = -this.xSpeed;
    }



    this.rectPosX += this.xSpeed;
  }
}


