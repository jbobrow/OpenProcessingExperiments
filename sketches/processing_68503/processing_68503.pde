
class Pig {
  //position of each pig
  float x;
  float y;

  //width of each pig
  int w;
  int h;

  //speed of each pig
  float xVel;
  float yVel;

  //type of pig (to pick each pig's favorite construction material)
  //0 will be straw, 1 will be wood, 2 will be brick, 3 will be hippie
  int pigType;
  
//setting up each pig separately
//[there must be a better way to do this]

  void setupPig(int pigType) {
    //the pigs are all the same size
    w = 75;
    h = 75;
    
    //each pig will move at a random speed up to 1.5
    //(slow enough to click on)
    xVel = random(1.5);
    yVel = random(1.5);
    //randomly determined whether pig moves right/left or up/down at beginning
    if(random(50)<25){
      xVel *= -1;
      yVel *= -1;
    }
    
    //each pig will start somewhere based on its type,
    //more or less in order diagonally down
    x = 40 + (pigType * 100);
    y = 40 + (pigType * 100);
  }
  
  void drawPig(int pigType) {
    //drawing the straw pig
    if (pigType == 0) {
      image(strawPig, x, y, w, h);
      // fill(0, 0, 0, 50); <-- for testing clickable area
      // rect(x, y, 74, 74);
    }
    //drawing the wood pig
    if (pigType == 1) {
      image(woodPig, x, y, w, h);
    }
    //drawing the brick pig
    if (pigType == 2) {
      image(brickPig, x, y, w, h);
    }
    //drawing the hippie pig
    if (pigType == 3) {
      image(hippiePig, x, y, w, h);
    }
  }
}


