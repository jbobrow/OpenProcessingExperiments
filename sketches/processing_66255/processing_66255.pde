
 int ballX;
 int ballY;
 int state;
 
void setup(){
  background(255);
  size(500,600);
  ballX=75;
  ballY=75;
  state = 5;
}
 
 
void draw(){
  background(0);
  fill(255);
  rect(50,50,50,50);
  rect(450,50,50,50);
  rect(50,475,50,50);
  rect(450,475,50,50);
 
  ellipse(ballX,ballY,25,25);
 
  if(mousePressed && mouseX>50 && mouseX<100 && mouseY>50 && mouseY<100){
  state = 0;
  }
 
  if(state == 0){
    ballX = ballX + 10;
     if (ballX > 475){
       fill(0);
       rect(450,50,50,50);
       state = 1;
     }
  }
  else if (state == 1){
    ballX = ballX - 10;
    ballY = ballY + 10; 
      if (ballX < 75){
       fill(0);
       rect(50,450,50,50);
        state = 2;
      }
  }
  else if (state == 2){
    ballX = ballX + 10;
   
   
      if (ballX > 474 && ballY > 475){
        background (0);
      }
  }
}

