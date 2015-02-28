
ArrayList<Ball> lists = new ArrayList<Ball>();

void setup(){
  size(700,400);
  smooth();
 //noFill();
  balls();
  
}

int xInc=250;
int yInc=100;
void draw(){
  
 // myBall.x++;
  background(255);
  for(Ball myBall: lists){
    myBall.drawBall();
    
  }
  
 // myBall.drawBall();
}
void balls() {
  for (int i = 0; i < 50; i++){
    Ball myBall = new Ball(xInc,yInc);  
    lists.add(myBall);
    xInc++;
    yInc++;
  }
  xInc+=100;
  yInc+=10;
  for (int i = 0; i < 100; i++){
    Ball myBall = new Ball(xInc,yInc);  
    lists.add(myBall);
    xInc++;
    yInc-=1;
  }
}

