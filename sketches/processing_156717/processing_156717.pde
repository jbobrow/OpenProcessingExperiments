
float ballX =20;
float ballY =20;
float dX =random(1,2);
float dY =random(1,2);
float pX;
float pY=10;
float pH;

void setup(){
  size(500,500);
  pX = width -15;
}




void draw(){
  background(0);
 
 
  ellipse(ballX,ballY,20,20);
  
 rect(pX, pY, 10, pH);
  
  if (ballX>width){
    dX= -dX;
  }
  if (ballX<0){
    dX= -dX;
  }
  if (ballY>height){
    dY =-dY;
  }
  if (ballY<0){
    dY =-dY;
  }
  
   ballX =ballX + dX;
  ballY =ballY +dY;
}


  void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
pY= pY-pH;
    } else if (keyCode == DOWN) {
   pY=Y+pH;
    }
 
 
  }
  }
  
  
 








