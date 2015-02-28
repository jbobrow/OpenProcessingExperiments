
float ballX=0;
float ballY=0;
float dX;
float dY;

void setup(){
  size(500,500);
  ballX=width/2;
  ballY=height/2;
}

void draw(){
  background(0);
  ellipse(ballX, ballY, 20, 20);
  
  dX=mouseX-ballX;
  dY=mouseY-ballY;
  ballX=dX/2.0+ballX;
  ballY=dY/2.0+ballY;

}


