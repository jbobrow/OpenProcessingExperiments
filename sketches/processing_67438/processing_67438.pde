
class Food {

  float foodX;
  float foodY;
  
  float foodValue;
  float foodSize;
  
  float foodOpacity;
  
  int makeNewFood = 0;
  
  void moveFood(){
    if (makeNewFood < 0){
      foodX = random(1, width-1);
      foodY = random(1, height-1);
      foodValue = random(20, 50);
      foodSize = foodValue/4;
      makeNewFood = 50;
    }
  }
  
  void drawFood(){
    noStroke();
    foodOpacity = map(makeNewFood, 0, 50, 0, 100);
    fill(95, 100, 25, foodOpacity);
    ellipse(foodX, foodY, foodSize, foodSize);
    makeNewFood--;
  }
  
  







}

