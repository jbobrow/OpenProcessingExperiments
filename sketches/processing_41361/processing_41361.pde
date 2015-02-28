
class Air

{
  // Properties
  int airPosX;
  int airPosY;
  int airWidth;
  int airHeight;
  color airColor;
  int xSpeed=16;
  int ySpeed=16;


  // Constructor

  Air(int x, int y, int w, int h, color c, int s)

  {
    this.airPosX = x;
    this.airPosY = y;
    this.airWidth = w;
    this.airHeight = h;
    this.airColor = c;
    this.xSpeed =this.ySpeed =s;
  }

  // Methods

    void drawAir()
  {
    fill(this.airColor);
    ellipse( this.airPosX, this.airPosY, this.airWidth, this.airHeight);
  }
  void updatePosition()
  {

    if ((this.airPosX > width-this.airWidth)  || (this.airPosX < this.airWidth))
      {
        this.xSpeed = -this.xSpeed;
      }
    if ((this.airPosY > height-this.airHeight) || (this.airPosY < this.airHeight))
      {
        this.ySpeed = -this.ySpeed;
      }
   
    this.airPosX += this.xSpeed;
    this.airPosY += this.ySpeed;
  }
}


