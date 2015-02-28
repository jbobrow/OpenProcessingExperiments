
void setup() {
  size(400, 200);
  background(255);
  smooth();
}
 
int ballposX=18;
int ballposY=20;
int ballspeedX=5;
int ballspeedY=10;
int t;
 
void draw() {
 
  ballposX=ballposX+ballspeedX;
  if(ballposX>width){
   ballspeedX-=5;
  }

  
  if(ballposX<0){
  ballspeedX=5;
  }
  
  ballposY=ballposY+ballspeedY;
  if(ballposY>height){
   ballspeedY=ballspeedY-=5;
  }
  if(ballposY<0){
  ballspeedY=5;
  }
  
  
  stroke(300,200,0);
  strokeWeight(1);
  ellipse(ballposX,ballposY,t,t);
     t++;
    if (t > 10) {
      t = 0;
}

}
