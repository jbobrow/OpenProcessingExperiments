
float ballX = 350;
float ballY = 200;

void setup (){
 size(700,400); 
}

void draw(){
  
  background(255);
  
  ellipse(ballX, ballY, 55, 55);
  ballX +=1;
  
}

