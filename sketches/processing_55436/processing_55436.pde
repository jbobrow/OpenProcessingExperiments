
class Handle {

  float x;
  float y;

  float rotation;
  float rad;

  int type;

  Handle(float _x, float _y, float _rotation, float _rad, int _type){
    // positions
    this.x = _x;
    this.y = _y;

    // other variables
    this.rotation = _rotation;
    this.rad = _rad;

    this.type = _type;
  }

  // collection of all functionalities
  void run() {  
    display();
    //increase();
  }

  void display() {
    ellipseMode(CENTER);
    ellipse(x, y, 1, 1);
  }

  void increase(float step) {
    rotation += step;
  }
  
  //======== Calculation ========//
  float[] pos(){
    return(calculatePoint(x, y, rad*2, rotation));
  }
  
  float[] calculatePoint(float x, float y, float r, float theta){
    // create a temperary container for all positions
    float px;
    float py;
    
    px = x + cos(theta)*r;
    py = y + sin(theta)*r;
    
    // create a temperary array to store all the point, then pass it back.
    float[] ellipsePoints = {px, py};
    return(ellipsePoints);
  }
}


