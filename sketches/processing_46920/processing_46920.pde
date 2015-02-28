
class Car
{
  final float CAR_WIDTH = 40;
  final float CAR_HEIGHT = 30;
  
  color clr;
  float x, y;
  float speed;
 
  Car() {}
  
  Car(color clr, float x, float y, float speed)
  {
    this.clr = clr;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  String toString()
  {
    return String.format("Color: %08x, Location: (%f, %f), Speed: %f",
                          this.clr, this.x, this.y, this.speed);
  }
  
  void draw()
  {
    fill(this.clr);
    noStroke();
    rect(this.x, this.y, CAR_WIDTH, CAR_HEIGHT);
  }
  
  void move()
  {
    this.x += this.speed;
    if (this.x >= width) this.x = 0;
  }
}

