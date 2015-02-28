
class Munch {
  
  float foodWidth;
  float foodHeight;

  Munch () {
    foodWidth = 20;
    foodHeight = 20;
  }
 
  void munchUpdate() {  
 
    foodX = random(20,height-20);
    foodY = random(20,width-20);
  }
 
  void munchDraw(){
    fill (155, 0, 155);
    rectMode(CENTER);
    rect (foodX, foodY, foodWidth, foodHeight);
  }
}

