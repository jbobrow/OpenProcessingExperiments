
float ballX = 350;
float ballY = 200;
int speed = 0;
int g = 1;


void setup (){
 size(700,400); 
}

void draw(){
  
  background(255);
  
  ellipse(ballX, ballY, 55, 55);
  ballY += speed;
  
  if (ballY < height-27){
    speed += g;
  }
  
  
}

