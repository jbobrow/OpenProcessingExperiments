
//bouncing rings in an array of one class!
//jmsaavedra 2010

boolean runStop = true;
float ballSize = 1;

Ball[] balls = new Ball[100];

void setup(){  
  size(500,500);
  smooth();
  
  for (int i=0; i<100; i++){
    balls[i] = new Ball(random(400),random(400));
  }
}

void draw(){
  
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  
  for (int i=0; i<balls.length; i++){
    balls[i].update();
    balls[i].checkSides();
    balls[i].display();
  }
}

class Ball {
  color ballColor = color(255,255,255);
 
  float ball_x;
  float ball_y;
  float speed_x = 1;
  float speed_y = 1;  
  
  Ball(float x, float y){
    ball_x = x;
    ball_y = y;
  }
  
  void update(){
    
    ball_x = ball_x + speed_x;
    ball_y = ball_y + speed_y;
  
  }
  
 void checkSides(){
      //check for hitting of walls
    if (ball_x > width-ballSize/2-5){
      ball_x = width-ballSize/2-5 - 1;
      speed_x = speed_x * -1;
      speed_x = speed_x + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));
    }
    else if(ball_x < ballSize/2+5){
      ball_x = ballSize/2+5 + 1;
      speed_x = speed_x * -1;
      speed_x = speed_x + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));  
    }    
      
    if (ball_y > height-ballSize/2-5){
      ball_y = height-ballSize/2-5 - 1;
      speed_y = speed_y * -1;
      speed_y = speed_y + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));
    }
    else if(ball_y < ballSize/2+5){
      ball_y = ballSize/2+5 + 1;
      speed_y = speed_y * -1;
      speed_y = speed_y + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));      
    }
  }
  
  /* --how to pull info OUT of our class
  float showX(){
    return(ball_x);
  }
  float showY(){
    return(ball_y);
  }*/
  
  void display(){
    stroke(ballColor);
    strokeWeight(5);
    noFill();
    ellipse(ball_x,ball_y, ballSize,ballSize);  
  }
}

