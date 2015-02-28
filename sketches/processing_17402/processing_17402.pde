
class Frog
{
  PImage imgFrog ;
  color col;
  int x, y, w, h;
  int speed;
  boolean hurt = false;
  int life = 0; 
  /**
   *  Constructor for frogs.
   *
   *  @param c The color of the frog.
   *  @param x The x location of the center of the frog.
   *  @param y The y location of the center of the frog.
   *  @param w The width of the frog.
   *  @param h The height of the frog.
   *  @param s The speed of the frog in pixels moved per frame.
   */
  Frog(int x, int y,String _png)
  {
    imgFrog = loadImage(_png);

    this.x = x;
    this.y = y;
    this.w = 20;
    this.h = 20;
    restore();
  }

  //  Draw the frog on the sketch.
  void draw()
  {
    image(imgFrog,this.x, this.y,this.w, this.h);
  }
  //Restore all de init values
  void restore() {
    this.life = 3;
  }


  //  Move the frog.
  //  Frog location wraps when it reaches the right edge.
  void move(int amountX, int amountY)
  {
    this.x += amountX;
    this.y += amountY;
    if (this.x > width) {
      this.x = 0;
    }
    if (this.x < 0) {
      this.x = width;
    }
    if (this.y > height) {
      this.y = 0;
    }
    if (this.y < 0) {
      this.y = height;
    }
  }
  void hit()
  {
    println("hittt");
    this.x = width/2;
    this.y = height/2;
  }
}


