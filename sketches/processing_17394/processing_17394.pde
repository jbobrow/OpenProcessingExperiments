
class Car

{
  
  float x, y, w, h;
  float speed;
 
  /**
   *  Constructor for cars.
   *
   *  @param c The color of the car.
   *  @param x The x location of the center of the car.
   *  @param y The y location of the center of the car.
   *  @param w The width of the car.
   *  @param h The height of the car.
   *  @param s The speed of the car in pixels moved per frame.
   */
  Car(color c, float x,float y)
  {

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    
    
   // this.speed = s;
  
  }
  //  Draw the car on the sketch.
  void draw()
  {
    
    imageMode(CENTER);
    image(mini, this.x,this.y);
   
  }
  //  Move the car.
  //  Car location wraps when it reaches the right edge.
  
}


