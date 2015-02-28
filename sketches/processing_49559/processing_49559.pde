
class Food {



  float foodW;
  float foodH;



  //Constructor
  Food () {
    foodW = 20;
    foodH = 20;
  }

  void foodUpdate() {   
    foodX = random(20, width-20);
    foodY = random(50, height-20);
  }

  void foodDraw() {

    fill (255, 255, 255);
    //ellipseMode(CORNER);
    tint(255);
    image (lemon, foodX, foodY, foodW, foodH);
  }
}


