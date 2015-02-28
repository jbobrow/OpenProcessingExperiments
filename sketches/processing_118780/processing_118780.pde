
int nCircles = 100;
int circleWidth = 25;

int xCoords[] = new int[nCircles];
int yCoords[] = new int[nCircles];
boolean direction[] = new boolean[nCircles];

void setup(){
  size(600, 600);
  smooth();
  
  for(int i=0; i<nCircles-1; i++){
    xCoords[i] = int(random((300+circleWidth), (600-circleWidth)));
    yCoords[i] = int(random((300+circleWidth), (600-circleWidth)));
    direction[i] = false;
  }
  xCoords[nCircles-1] = int(random((200+circleWidth), (250-circleWidth)));
  yCoords[nCircles-1] = int(random((200+circleWidth), (250-circleWidth)));
}

void draw(){
  fill(255, 15);
  rect(0, 0, 600, 600);
  
  for(int i=0; i<nCircles; i++){
    if(yCoords[i]<50 && xCoords[i]<50){
      direction[i] = true;
    }
    if(yCoords[i]>550 && xCoords[i]>550){
      direction[i] = false;
    }
    if(direction[i]==false){
      xCoords[i]+=random(-5, +3);
      yCoords[i]+=random(-5, +3);
    }
    else{
      xCoords[i]+=random(-3, +7);
      yCoords[i]+=random(-3, +7);
    }
    if(i==nCircles-1){
      fill(#E1E51E);
    }
    else{
      fill(0);
    }
    ellipse(xCoords[i], yCoords[i], circleWidth, circleWidth);
    
    fill(random(255), random(255), random(255));
    ellipse(xCoords[i]-5, yCoords[i], (circleWidth/3), (circleWidth/3));
    ellipse(xCoords[i]+5, yCoords[i], (circleWidth/3), (circleWidth/3));
  }
}


