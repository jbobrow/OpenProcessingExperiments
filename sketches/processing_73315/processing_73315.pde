
int sides = 6;
int middleX = 200;
int middleY = 250;
float radiuz = 60;
float deg = 0;

void setup(){
  size(500,500);
  stroke(0);
  strokeWeight(3);
  noLoop();
}

void draw(){
  point(middleX, middleY);
  
  float degreeDif = (2*PI)/sides;

  float prevX = middleX + cos(deg)*radiuz;
  float prevY =  middleY + sin(deg)*radiuz;
  float origX = prevX;
  float origY = prevY;
  deg += degreeDif;

  for(int i = 0; i < sides-1; i++){
    line(middleX + cos(deg)*radiuz, middleY + sin(deg)*radiuz, prevX, prevY);
    prevX = middleX + cos(deg)*radiuz;
    prevY = middleY + sin(deg)*radiuz;
    deg += degreeDif;
  }
  line(prevX,prevY,origX, origY);
}
