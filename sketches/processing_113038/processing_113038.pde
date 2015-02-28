
float ballX = 300;
float ballY = 300;
float xSpeed = -1;
float ySpeed = 1;

void setup  () {
  size(400,400);
  frameRate(60);
  background(0);
}

void draw() {
  ballY = ballY + ySpeed; 
  ballX = ballX + xSpeed; 
  strokeWeight(.5);
  line(ballX,ballY,400,0);
  line(ballX,ballY,0,400);
  line(ballX,ballY,0,0);
  line(ballX,ballY,400,400);
 

  
 if(ballY > 400) { //---------------------- #2 blue  (from bottom to left) 
   stroke(105,181,235);
   ySpeed = -1;
}

if(ballX < 0) { //---------------------- #3 coral (from left to top)
  stroke(246,90,88);
  xSpeed = 1;
}
if(ballY < 0) { //---------------------- #4 light blue(from top to right)
  stroke(155,237,237);
  ySpeed = 1;
}
 if(ballX > 400){ //---------------------- #5 orange
   stroke(237,198,155);
   xSpeed = -1;
 }

};
