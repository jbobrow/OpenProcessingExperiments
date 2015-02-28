
//Minor Castro Guzman
//Universidad Veritas
//Proccessing
//Maestria en Diseno de Interaccion

//
//List of All Balls
ArrayList<ball> balls = new ArrayList<ball>();

//Assignment of number of balls to be created.
int nBolas = (int)round(random(30,100));

//default of colors and transparency.
//may not be used at the end.
int red = (int)random(0,255);
int green = (int)random(0,255);
int blue = (int)random(0,255);
int trans = (int)random(0,200);

//this is the limit for the distance.
int limit = 100;

void setup(){
  size(1100,700);
  smooth();  
  for(int i=0;i<nBolas;i++){
    balls.add(new ball());
  }

}

void draw(){
  
  background(240);
  //this the process to paint the balls
  //it will move, paint and verify the borders
  for(int i = 0;i < balls.size();i++){
    ball ball = balls.get(i);
    ball.move();
    ball.paint();
    ball.borders();  
    //review of the distances between balls
    //still a bug since it checks the ball and itself.
    for(int x = 0; x < balls.size();x++)
    {
      ball tmpBall = balls.get(x);
      //float distance = sqrt(sq(ball.ballX-tmpBall.ballX)+sq(ball.ballY-tmpBall.ballY));
      float distance = dist(ball.ballX,ball.ballY,tmpBall.ballX,tmpBall.ballY);
      
      if(distance < limit){
        fill(150);
        strokeWeight(0.5);
        stroke(1,50);
        line(ball.ballX,ball.ballY,tmpBall.ballX,tmpBall.ballY);
      }
    }
  }
}

//class for the ball and all attributes.
class ball {
  
  float ballX;
  float ballY;
  float speedX;
  float speedY;
  float ballSize;
  int red;
  int green;
  int blue;
  int trans;
  //constructor
  ball(){
    ballX = random(30, width-30);
    ballY =random(30, height-30); 
    speedX = random(-1, 1);
    speedY = random(-1, 1);
    ballSize = random(15,40);
    red=round(random(0,255));
    green = (int)random(0,255);
    blue = (int)random(0,255);
    trans = (int)random(0,200);
    
  }
  //simple method to move the ball
  void move(){
    ballX += speedX;
    ballY += speedY; 
  }
  //write in the screen
  //used the ellipse mode radius
  void paint(){
    noStroke();
    
    fill(red,green,blue,trans);
    ellipseMode(RADIUS);
    ellipse(ballX,ballY,ballSize,ballSize);
  }
  
  void rePaint(){
    noStroke();
    
    fill(red,green,blue,trans);
    ellipseMode(RADIUS);
    ellipse(ballX,ballY,ballSize,ballSize);
    
    
  }
  
  
  //review the limit of the ball vs the walls.
  void borders()
  {
    if (ballX < (ballSize)){
       speedX = speedX * -1;
       ballX = ballSize;
       red=round(random(0,255));
       green = (int)random(0,255);
       blue = (int)random(0,255);
       trans = (int)random(0,200);
    }
    if (ballX > (width - (ballSize))){
        speedX = speedX * -1;
        ballX = width - (ballSize);
        red=round(random(0,255));
        green = (int)random(0,255);
        blue = (int)random(0,255);
        trans = (int)random(0,200);
    }
    if (ballY < (ballSize)){
        speedY = speedY * -1;
        ballY = (ballSize);
        red=round(random(0,255));
        green = (int)random(0,255);
        blue = (int)random(0,255);
        trans = (int)random(0,200);
    }
    if (ballY >= (height -(ballSize))){
        speedY = speedY * -1;
        ballY = height -(ballSize);
        red=round(random(0,255));
        green = (int)random(0,255);
        blue = (int)random(0,255);
        trans = (int)random(0,200);
    }
  }
}

//some fun when mouse pressed or when 
void mousePressed(){
 
  for(int i = 0;i < balls.size();i++){
    ball ball = balls.get(i);
    ball.red=round(random(0,255));
    ball.green = (int)random(0,255);
    ball.blue = (int)random(0,255);
    ball.trans = (int)random(0,200);
  }

}

void keyPressed(){
  balls.add(new ball());
  
}


