
class Bar {

  // global var

  float x = 0;
  float y = 0;



  // constructor

  Bar(float _x, float _y) {
    x = _x;
    y = _y;
  }

  // functions

  void run() {
    display();
  }

  //--------display
  void display() {

    stroke(255);
    strokeWeight(2);
    fill(55, 55, 55, 25);
    rectMode(CENTER);
    rect(width/2, height-350, width, 100);
    
    stroke(200);
    strokeWeight(1);
    fill(255, 50, 9, 125);
    rect(x, y, 5, 100);
  }


}


