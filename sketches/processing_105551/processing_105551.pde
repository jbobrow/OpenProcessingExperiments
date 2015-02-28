
int ballX,  ballY;
int speed, speed1;
int ballX2, ballY2;
int ballX3, ballY3;
int speed2,  speed3;
int speed4, speed5;
int value;


void setup (){
  size (500, 500);
  
  ballX = 200;
  ballY = 150;
  ballX2 = 100;
  ballY2 = 200;
  ballX3 = 300;
  ballY3 = 190;
  speed = 8;
  speed1= 6;
  speed2= 4;
  speed3= 3; 
  speed4= 2;
  speed5= 2;
  
}

    

void draw (){
  moveBall();
  moveBall();
   moveBall();
  moveBall();
}
  
   void moveBall (){
     background(200);
    
  if (ballX > 500 || ballX < 0){
    speed = speed * (-1);
  }
  if (ballY >500 || ballY < 0) {
    speed1 = speed1 * (-1);
    
  }
  if (ballX2 > 500 || ballX2 < 0){
    speed2 = speed2 * (-1);
  }
  if (ballY2 > 500 || ballY2 < 0) {
    speed3 = speed3 * (-1);
    
  }
  if (ballX3 > 500 || ballX3 < 0){
    speed4 = speed4 * (-1);
  }
  if (ballY3 > 500 || ballY3 < 0) {
    speed5 = speed5 * (-1);
    
  }
   
    ballX= ballX + speed;
    ballY= ballY + speed1;
    ballX2 = ballX2 +speed2;
    ballY2 = ballY2 +speed3;
    ballX3 = ballX3 + speed4;
    ballY3 = ballY3 + speed5;
    
    ellipse(ballX3, ballY3, 200, 200);
   
    ellipse(ballX3, ballY3, 200, 200);
    

    ellipse (ballX, ballY, 50, 50);
    ellipse (ballX2, ballY2, 20, 20);
    
    for (int i = 0; i<100; i++){
    fill(255, dist(mouseX/2, mouseY/2, i*2, 200), 20);
    rect (i*30, height/2, 20, 20);
    rect (i*30, 200, 20, 20);
    rect (i*30, 300, 20, 20);
    
    
    println (ballX2);
    
  } 
  }
  
  void mousePressed() {
  if (value == 255) {
    value = 0;
    } else {
      value = 255;
    }
}
