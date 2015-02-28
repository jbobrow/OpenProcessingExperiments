
class Square{
  
  float x;
  float y;
  float speed = 1;
  float squareSize = 5;
  float rot = PI;
  
  Square() {  
  };
  
  
  
  void crawl(){
    x = x + random (-speed, speed);
    y = y + random (-speed, speed);
    
    translate(mouseX,mouseY); 
    rotate (rot + 100);
    
    //draw the squares
    fill (random(255),random(255),random(255),80);
    noStroke();
    rect (x,y, squareSize, squareSize);
    
    rot = rot + speed;
    
  };
  
  
};




