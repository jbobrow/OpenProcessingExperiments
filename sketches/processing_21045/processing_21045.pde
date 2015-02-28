
class cBrownian {
  
  int currentX, currentY;
  int lastX, lastY;
  float biggestStep;
  
  public cBrownian(){
    this((width/2),(height/2),2);
  }
  
  public cBrownian(int x, int y){
    this(x,y,2);
  }
  
  public cBrownian(int x, int y,float bS){
    currentX = lastX = x;
    currentY = lastY = y;
    biggestStep = bS;    
  }
  
  public void draw(){
    stroke(255,0,0);
    line(currentX,currentY,lastX,lastY);
    update();
  }
  
  private void update(){
    lastX = currentX;
    lastY = currentY;
    currentX += int(random(-biggestStep,biggestStep));
    currentY += int(random(-biggestStep,biggestStep));
    currentX = constrain(currentX, 0 , width);
    currentY = constrain(currentY, 0, height); 
  }
}

