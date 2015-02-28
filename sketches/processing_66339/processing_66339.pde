
float ballX;
float ballY;
float speed;


void setup(){
  size(400, 400);
  noStroke();
  smooth();
  
  ballX=random(0, 385);
  ballY=random(0, 385);
  
  speed = 3;
}

void draw(){
  background(144,133,222);
  fill(248,239,98);
  ellipse(ballX, ballY, 30, 30);
  ballX += speed;
  
      
  if(ballX >= 385 || ballX <= 15) {
    speed*= -1;
  }
  
}

