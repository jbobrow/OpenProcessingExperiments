
//keep ups
int Lives=3; // setting how many lives player starts with
int ballX=1; // initializing ball position
int ballY=1;
int ballXspeed=2; //initializing ball x and y speeds
int ballYspeed=2;

void setup (){
  size(700,700);
 
}

void draw () {
 background(255); // setting up the back ground an design
 smooth();
 fill(139,69,19);
 rect(350,600,700,200);
 
  
 rectMode (CENTER);              //creating the ping pong paddle
 rect(mouseX,mouseY,100,5);
 fill(205,133,63);
 rect(mouseX-30,mouseY-5,40,2);
 rect(mouseX-30,mouseY+3,40,2);
 
 
  fill(0,0,255); //placung the lives on screen
  textSize(30);
  text ("Lives ="+Lives, width - 700,30); //lives on screen

  ellipseMode(CENTER); //creating the ball
   fill(255);
   stroke(0);
   ellipse(ballX,ballY,10,10);
   
    ballX=ballX+ballXspeed;   //initialzing the ball x and y speed
    ballY=ballY+ballYspeed;
    
    if (ballX>=700){              //limiting the edges of the scrren to keep the ball inside
   ballXspeed= ballXspeed*-1;
   }
    if (ballY>=500){             //each time the ball hits the ground a life reduces
    ballY=1;
      Lives=Lives-1;
     }
    if (ballX<=0){
      ballXspeed=ballXspeed*-1;
    }
    if (ballY <=0) {
      ballYspeed=ballYspeed*-1;
}
if (ballX==mouseX||ballY==mouseY){  //interaction with the paddle
  ballYspeed=ballYspeed*-1;  
}
 if (Lives<0){                  //creation of the game over screen when lives equal zero
    fill(0,0,255);
    textSize (50);
    text ("GAME OVER", width/2 - 150,height/2);
    noLoop();
    }

}


