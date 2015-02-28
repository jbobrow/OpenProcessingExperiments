
float ballX=width/2;
float ballY=height/2;
float dX;
float dY;

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  ellipse(ballX,ballY,20,20);

  dX=mouseX-ballX;
  dY=mouseY-ballY;
  ballX=dX/30+ballX;
  ballY=dY/30+ballY;
  
}


