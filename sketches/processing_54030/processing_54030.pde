

/** This class is used to draw balloon when mouse is clicked on the grass land.**/
class Balloon {
  float x; 
  // the object's x-coordinate
  float y;
  // the object's y-coordinate
  float spdY;
  //The cloud's vertical moving speed.
  float speeddecrement;
  // used to decrease speed of balloon as it rises.
  float spdX;
  // Constructor
  Balloon (float x, float y, float spdX, float spdY, float speeddecrement) {
    this.x=x;
    this.y=y;
    this.spdY=spdY;
    this.speeddecrement=speeddecrement;
    this.spdX=spdX;
  }


  // used to update the location of balloon.  
  void update() {
    y= (y+spdY);//%(height-height/1.3);
    spdY= spdY-speeddecrement;
    x= (x+spdX)%width;
  }


  // A function set to draw balloons.
  void draw () {

    fill (51, 185, 184, 200);
    ellipse (x, y, width/18, width/15);
    stroke (0);
    fill (0);
    line (x, y+width/30, x, y+width/10);
  }
}


