
int numberOfBalls = 4;
Ball [] balls;
canvas_width = 300;
canvas_height = 300;

void setup(){
  background(10);
  size(canvas_width, canvas_height);
  smooth();
  
  balls = new Ball[numberOfBalls];
  for(int i =0; i < balls.length ; i++)
    balls[i] = new Ball();
}
 
void draw(){
  drawBackground();
  for(int i =0; i < balls.length ; i++){
    balls[i].drawBall();
    balls[i].movement();
    
    if((dist(mouseX,mouseY, balls[i].ballPosX, balls[i].ballPosY) < balls[i].bSize) && mousePressed){   
      balls[i].vX+=random(50);
      balls[i].vY+=random(-20,0);
    }
  }
  
  
}

void drawBackground(){
  background(10,0,50);
  noStroke();
  fill(255,255,0,70);
  ellipse(width/2, height/4, 30,30);
  fill(255,255,0);
  ellipse(width/2, height/4, 20,20);
  fill(255);
  ellipse(width/2 - 30, height/4 -20, 20,20);
  ellipse(width/2 + 30, height/4 -20, 20,20);
  fill(0);
  ellipse(width/2 - 33, height/4 -20, 10,10);
  ellipse(width/2 + 33, height/4 -20, 10,10);
  stroke(255,0,0);
  line(width/2-10,height/4,width/2+10,height/4);
  stroke(255);
  strokeWeight(2);
  line(width/2,height/4 +30 , width/2 -5,height/4 +35);
  line(width/2,height/4 +30 , width/2 +5,height/4 +35);
  for(int i = 0; i <9; i++){
    line(width/2, height/4 + (30*(i +1)), width/2, height/4 + (2*(i +1)) + (30*(i+1)) + 5);
  }
  fill(255);
  textSize(15);
  text("Click",width/2 - 18, (height) - 53);
  
  if(dist(mouseX,mouseY,width/2,height/4) <= 15){
    noStroke();
    fill(255,0,0);
    ellipse(width/2, height/4, 30,30);
    
    if(mousePressed){
      for(int i =0; i < balls.length ; i++){
        balls[i].vX+=random(40);
        balls[i].vY+=random(-50,0);
      }
    }
  }
  
 
}
 
class Ball{

  float bSize = 25;
  float r = bSize/2;
  float endPosY = 500-(bSize/2);
  float ballPosX;
  float ballPosY;
  float vY =.1;
  float gravity = .01;
  float weight = .02;
  float vX;
  float friction = .7;
  color ballColor;

  public Ball(){
    ballPosX = random(500);
    ballPosY = random(500);
    ballColor = color(random(255),random(255),random(255)); 
    vX = random(40);
    vY = random(-15,60);
  }
  
  public void drawBall(){
    noStroke();
    fill(ballColor);
    ellipse(ballPosX,ballPosY,bSize,bSize);
  }
  
  public void movement(){
    
   
  // Left/Right Motion
    if((ballPosX >= width-r) && (vX > 0)) {
      vX = -vX;
      vX = vX*(friction);
  //  bgColor = color(random(255),random(255),random(255));
    } else if ((ballPosX <= r) && (vX < 0)) {
      vX = -vX;
      vX = vX*(friction);
  //  bgColor = color(random(255),random(255),random(255));
    }
       
    ballPosY += vY;
    ballPosX += vX;
  }

}

