
float ballX =20;
float ballY =20;
float dX =random(1,2);
float dY =random(1,2);
float paddleX;
float paddleY=10;

void setup(){
  size(500,500);
  paddleX = width -15;
}




void draw(){
  background(0);
 
 
  ellipse(ballX,ballY,20,20);
  
 rect(paddleX, paddleY, 10, 30);
  
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
paddleY= paddleY-30;
    } else if (keyCode == DOWN) {
   paddleY=paddleY+30;
    }
 
 
  }
  }
  
  
 








