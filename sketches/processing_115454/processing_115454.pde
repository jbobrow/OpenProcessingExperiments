
/**
  This processing sketch is a recreation of the classic Bond
  gun barrel sequence.
  
  NOTE: The sketch can be reset by pressing 'r' but only after
  the entire screen is red.
*/

int ballX, ballY;
int ballSize = 94;

int ry =-360; //Hidden rectangle y-position

float x;
float y;
float easing = 0.05;

boolean ballOver = false;
boolean circleOver = false;

long lastTime = 0;
color b = color(255,0,0,255);

void reset(){
  ry = -360;
  noStroke();
  fill(b);
  rect(0,ry,640,360);
  
  fill(0,145);
  rect(0, 0, width, height);
  fill(255);
  
  ellipse(x, ballY, ballSize, ballSize);
  
  stroke(0);
  line(310, 160, 330, 160);
  
  noFill();
  beginShape();
  vertex(310,160);
  vertex(315,155);
  vertex(325,155);
  vertex(330,160);
  endShape();
  
  ellipseMode(CENTER);
  ellipse(320,170,20,20);//Head
  line(320, 180,320, 200);//Torso
  line(320,190,310,190);//Left Arm
  line(320,190,330,190);//Right Arm
  line(320,200,310,220);//Left Leg
  line(320,200,330,220);//Right Leg
}

void setup(){
  size(640,360);
  
  ballX = (width/2)+(ballSize/2);
  ballY = height/2;
}

void draw(){
  fill(b);
  noStroke();
  rect(0,ry,640,360);
  //The following if statement is for the blood screen
  if(circleOver && mousePressed && ry !=0){
    ry+=3;
  }
  
  if(ry == 0){
    if(keyPressed){
      if(key == 'r'){
        reset();
      }
    }
  }
  
  fill(0,145);
  rect(0, 0, width, height);
  fill(255);
  
  update(mouseX, mouseY);
  
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = targetX - x;
  float dy = targetY - y;
  if(abs(dx)>1){
    x += dx*easing;
  }
  /**
  Y-Axis easing code.
  if(abs(dy)>1){
    y += dy*easing;
  }
  */
  ellipse(x, ballY, ballSize, ballSize);
  
  if(!circleOver && ry > -140){
    stroke(b);
  }
  else{
    stroke(0);
  }
  
  line(310, 160, 330, 160);
  
  noFill();
  beginShape();
  vertex(310,160);
  vertex(315,155);
  vertex(325,155);
  vertex(330,160);
  endShape();
  
  ellipseMode(CENTER);
  ellipse(320,170,20,20);//Head
  line(320, 180,320, 200);//Torso
  line(320,190,310,190);//Left Arm
  line(320,190,330,190);//Right Arm
  line(320,200,310,220);//Left Leg
  line(320,200,330,220);//Right Leg
}

void update(int x, int y){
  if(overBall(ballX, ballY, ballSize)){
    ballOver = true;
  }
  else{
    ballOver = false;
  }
  
  if(overBall(width/2,height/2,ballSize)){
    circleOver = true;
  }
  else{
    circleOver = false;
  }
}

boolean overBall(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


