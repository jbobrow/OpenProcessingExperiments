
class Player{
  
  Star currentStar;
  float xPos;
  float yPos;
  float playerSize = 30;
  
  float speed = 2;
  
  float _x;
  float _y;
  
  Player(){
    
    currentStar = (Star)starArray.get(0);
    
  }
  
  void display(){
    xPos = currentStar.xPos;
    yPos = currentStar.yPos;
    
    
    
    noFill();
    //stroke(0, 255, 0, 50);
    strokeWeight(1);
    
    _x += (xPos - _x)/speed;
    _y += (yPos - _y)/speed;
    
    ellipse(_x, _y, playerSize, playerSize);
    line(_x-10, _y, _x-20, _y);
    line(_x+10, _y, _x+20, _y);
    line(_x, _y-10, _x, _y - 20);
    line(_x, _y+10, _x, _y + 20);
    
    
  }
  
  void transfer(int _starIdx){
     currentStar.isOn = false;
     currentStar.speedBonus = 0;
     currentStar = (Star)starArray.get(_starIdx);
     currentStar.isOn = true;
     currentStar.speedBonus = 2;// / starIdx;

    
  }
  
}

