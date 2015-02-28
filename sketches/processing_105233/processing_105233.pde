
float ballX;
float ballY;

void setup(){
size(500,500);
background(255);
ballX=width/2.0;
ballY=height/2.0;

}

void draw(){
  background(255);
  ellipse(ballX,ballY,20,20);
  fill(0);

ballX=height/2.0;
ballY=ballY+1.0*10;
if(ballY>=height){
ballY=height-10;
}
}


