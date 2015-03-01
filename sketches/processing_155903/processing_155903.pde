
int centerX = 400;
int centerY = 400;

final int centerXLeftLimit = 200;
final int centerXRightLimit= 600;
final int centerYUpperLimit = 200;
final int centerYLowerLimit = 600;

final int distanceMultiplier = 25;
final int sizeMultiplier = 2;

int roundCount = 0;
boolean mouseOvered = false;

void setup(){
  frameRate(30);
  size(800, 800);
  fill(255, 255, 255);
}
  
void draw(){  
  roundCount++;
  float jitter = roundCount % 3;
  jitter /= 3;
  
  if(mouseOvered == false && (mouseX != 0 || mouseY != 0)){
    mouseOvered = true;
  }
  
  if(mouseOvered){
    if(mouseX != centerX){
      if(mouseX < centerX && centerX > centerXLeftLimit){
        centerX--;
      }else if(mouseX > centerX && centerX < centerXRightLimit){
        centerX++;
      }
    }
    if(mouseY != centerY){
      if(mouseY < centerY && centerY > centerYUpperLimit){
        centerY--;
      }else if(mouseY > centerY && centerY < centerYLowerLimit){
        centerY++;
      }
    }
  }
  
  if(mousePressed){   
    background(50); 
    for(int i=0; i<50; i++){
      ellipse(centerX + (i + jitter) * distanceMultiplier, centerY, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX + (i + jitter) * distanceMultiplier / 2, centerY + (i + jitter) * distanceMultiplier / 2, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX, centerY + (i + jitter) * distanceMultiplier, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX - (i + jitter) * distanceMultiplier / 2, centerY + (i + jitter) * distanceMultiplier / 2, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX - (i + jitter) * distanceMultiplier, centerY, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX - (i + jitter) * distanceMultiplier / 2, centerY - (i + jitter) * distanceMultiplier / 2, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX, centerY - (i + jitter) * distanceMultiplier, i * sizeMultiplier, i* sizeMultiplier);
      ellipse(centerX + (i + jitter) * distanceMultiplier / 2, centerY - (i + jitter) * distanceMultiplier / 2, i * sizeMultiplier, i* sizeMultiplier);
    }
  }else{
    background(0); 
    ellipse(centerX, centerY, sizeMultiplier * 50, sizeMultiplier * 50);
  }
}


