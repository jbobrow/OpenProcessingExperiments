
class Man {

  float x; //position in x
  float y; // position in y 
  float w; // width of the object 
  float h; // height of the object
  float a;
  int steps;
  boolean born;
  int flag; //flag set up to indicate stages

  Man() {


    x = 0; //initial set up
    y = 0; //initial set up
    w = 10; //set the width ourself
    h = 10; //set the height ourself
    a = radians(random(0,360)); //initial our own angle
    steps = 0; //initial our own step that move

    born = false;
    flag = 0; // set to 0 for wandering randomly
    /*0 means alone
     		1 means persuit
     		2 means courting*/
  }


  // create function
  void birth() {
    born = true;
    x = mouseX;
    y = mouseY;
  }

  void setFlat(int pf){
    flag = pf;
  }
  // display function
  void display() {
    // parent.noStroke();
    fill(204, 102, 0);
    rect(x, y , w, h);
  }

}

