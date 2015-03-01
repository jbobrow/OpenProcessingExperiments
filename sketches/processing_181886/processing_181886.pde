
/* @pjs preload="img.jpg"; */
int margin;
int ballCount;
ArrayList balls;
int phase;
float tempX,tempY,tempRad;
boolean searching;
int tickStop;
int tick;
PImage img;

void setup(){
  margin = 60;
  ballCount = round(random(5,12));
  tickStop = round(random(5,ballCount+2));
  tick = 0;
  phase = 1;
  frameRate(7);
  size(500,500);
  background(255);
  smooth();
  img = loadImage("img.jpg");
  tempRad = random(6,25);
  balls = new ArrayList();
  balls.add(new Ball(random(margin+tempRad, width-(margin+tempRad)),random(margin+tempRad,height-(margin+tempRad)),tempRad));
  Ball ball = (Ball) balls.get(0);
  ball.display();
}
 
void draw(){ 
  if(phase == 1){ //Ball Arrangement Phase
    boolean searching = true;
    while(searching){
      tempRad = random(10,30);
      tempX = random(margin+tempRad,width-(margin+tempRad));
      tempY = random(margin+tempRad,height-(margin+tempRad));
      for(int i = 0; i < balls.size(); i++){
        Ball ball = (Ball) balls.get(i);
        if(abs(tempX-ball.x) < 20 || abs(tempY-ball.y) < 20){
          break;
        } else if(i == balls.size()-1){
          balls.add(new Ball(tempX,tempY,tempRad));
          Ball newBall = (Ball) balls.get(balls.size()-1);
          newBall.display();
          searching = false;
        }
      }
    }
    if (balls.size() == ballCount){
      phase = 2;
    }
  }
  if(phase == 2){ //Line Prep Phase
    tick++;
    Ball ballA = (Ball) balls.get(round(random(0,balls.size()-1)));
    Ball ballB = (Ball) balls.get(round(random(0,balls.size()-1)));
    stroke(0,random(50,255));
    strokeWeight(round(random(1,5)));
    line(ballA.x,ballA.y,ballB.x,ballB.y);
    if (tick >+ tickStop){
      image(img,228,482);
      noLoop();
    }
  }
}

void mousePressed(){
  setup();
  loop();
}
class Ball {
  
  float x,y,rad;
  boolean picked;
  
  Ball(float x_,float y_,float rad_){
    x = x_;
    y = y_;
    rad = rad_;
    picked = false;
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(x,y,rad*2,rad*2);
  }
}


