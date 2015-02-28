
class Lochness {

  float x;
  float y;
  //use a random number to determine which sequence to loop through when the lochness appears

  Lochness (float tempx, float tempy) {
    x = tempx;
    y = tempy;
  }
  
  void shiftPosition () {
    y = random(300,height);
    x= random(width);
  }
    

  void display () {
    fill(0);
    noStroke();
    ellipse(x,y,50,50);
  }
}


