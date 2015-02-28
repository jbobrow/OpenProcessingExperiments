

class Snakebody {
    
    String candyImgs []= {"diamond.png", "fries.png", "hamburger.png", 
                           "corndog.png", "icecream.png", "playboy.png", "whiskey.png", 
                           "baseball.png", "cigs.png", "cupcake.png","coke.png",};

    float posX;
    float posY;
    int randomInt;
    String imgName;
    PImage candyImg;
    
    PVector bodyPos;
    
  
  Snakebody(float bodyPosX, float bodyPosY){
    this.posX= bodyPosX;
    this.posY= bodyPosY;
    randomInt = int(random(11));
    imgName = candyImgs[randomInt];
    candyImg = loadImage(imgName);
    
  }
  
  void display() {
    image(candyImg, posX, posY);
  }
  
  void update() {
    
  }
  

}
  
  
  
  
  
  
  


