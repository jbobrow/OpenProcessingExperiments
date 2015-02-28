
class Square {

  int xPos;
  int yPos;
  int rectSize;
  

  Square( int tempxPos, int tempyPos, int temprectSize) {

    xPos = tempxPos;
    yPos = tempyPos;
    rectSize = temprectSize;
  }

  void display() {
    fill(255, 32, 150);
    rectMode(CENTER);
    
    float tempDist = dist(mouseX,mouseY, xPos, yPos);
    
//    float xPos = map(tempDist, 0, width, 200, 300);
//    float yPos = map(tempDist, 0, height, 50, 300);
    
    float _Diagonal = dist(0,0,width,height);
    
    float rectMap = map(tempDist,0,_Diagonal,0,100);
    

    
    
    
    rect(xPos, yPos, rectMap, rectMap);
  }
}









