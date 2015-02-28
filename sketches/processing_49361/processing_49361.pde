
class Food {


  float foodW;
  float foodH;



  //Constructor
  Food () {
    foodW = 20;
    foodH = 20;
  }

  void foodUpdate() {   

    foodX = random(20,height-20);
    foodY = random(20,width-20);
  }

  void foodDraw(){
    fill (255, 255, 255);
    ellipseMode(CORNER);
    ellipse (foodX, foodY, foodW,foodH);
  }
}


