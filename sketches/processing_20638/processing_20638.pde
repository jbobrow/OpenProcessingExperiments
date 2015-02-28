
class Ghost {
  int xStart;
  int yStart;
  float x;
  float y;
  float u = 0;
  
  int startTime;
  int shiftTime = 2;
  
  float x1;
  float targetX;
  
  PImage ghostImg;
  
  Ghost(int x_pos, int y_pos) {
    xStart = x_pos;
    yStart = y_pos;
    
    imageMode(CENTER);
    ghostImg = loadImage("ghost.png");
    startTime = millis();
    
  }
  
  void update(){    
    pushMatrix();
    translate(xStart,yStart);
    image(ghostImg, 0 ,0);
    popMatrix();
  }
}

