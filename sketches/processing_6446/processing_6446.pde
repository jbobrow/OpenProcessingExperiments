
HashSet flakes = new HashSet();

//Flake f = new Flake();

float BALLSIZE=200;
float FLAKESIZE=10;

float xBallSpeed, yBallSpeed;
float MOVE=1;
float CENTERX=125; 
float CENTERY=160;
float ballX=CENTERX,ballY=CENTERY;

float lastX=CENTERX,lastY=CENTERY;

void setup(){
  size(250,250);
  frameRate(60); 
  for(int i = 0; i < 40; i++){
    flakes.add(new Flake());
  }
}

void draw(){
  Iterator i;
  background(204);
  noStroke();

  moveBall();
  drawBallOutside();
  drawBaseOutside();

  i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    f.move();
    f.drawOutside(false);
  }

  i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    f.drawInside(false);
  }
  drawCastle();

  i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    f.drawOutside(true);
  }
  i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    f.drawInside(true);
  }
  drawBaseInside();

}

void drawCastle(){
  strokeWeight(4);
  stroke(0);
  noFill();

  castleWalls();
  
  fill(100);
  noStroke();
  castleWalls();
  strokeWeight(2);
  stroke(0);
 arc(ballX,ballY,40,60,-PI,0);
 fill(70,35,0);
  arc(ballX,ballY,40,60,-PI,0);

}
void castleWalls(){
  //main box
  rect(ballX - BALLSIZE/4,ballY-BALLSIZE/5,BALLSIZE/2,BALLSIZE/5);
towerWalls(ballX - BALLSIZE/4,ballY-BALLSIZE/3);
towerWalls(ballX  + BALLSIZE/8,ballY-BALLSIZE/3);
}
void towerWalls(float x, float y){
  float brickwidth = BALLSIZE/40;
  y+=brickwidth;
  rect(x,y,BALLSIZE/8,BALLSIZE/5-brickwidth);
  rect(x+brickwidth*0,y-brickwidth,brickwidth,10);
  rect(x+brickwidth*2,y-brickwidth,brickwidth,10);
  rect(x+brickwidth*4,y-brickwidth,brickwidth,10);
  
}

boolean onCastle(float x, float y){


  stroke(255,0,0);
  if(between(x,-BALLSIZE/4,-BALLSIZE/8)){
    //line(ballX,ballY,ballX+x,ballY+y);
    if(closeEnough(y, -BALLSIZE/3)){
      return true; 
    }
  }

  if(between(x,-BALLSIZE/8,BALLSIZE/8)){
    //line(ballX,ballY,ballX+x,ballY+y);
    if(closeEnough(y, -BALLSIZE/5)){
      return true; 
    }
  }

  if(between(x,BALLSIZE/8,BALLSIZE/4)){
    //line(ballX,ballY,ballX+x,ballY+y);
    if(closeEnough(y, -BALLSIZE/3)){
      return true; 
    }
  }

  //    line(ballX,ballY,ballX+BALLSIZE/8,ballY-BALLSIZE/3);
  //  line(ballX,ballY,ballX+BALLSIZE/4,ballY-BALLSIZE/3);

  return false; 
}
boolean closeEnough(float val, float to){
  if(abs(val - to) < 1){
    return true;
  } 
  return false;
}


boolean between(float val, float min, float max){
  if(val >= min && val <= max){
    return true;
  } 
  return false;
}


void drawBallOutside(){
  fill(200,200,248);
  strokeWeight(2);
  stroke(0);
  //blue background
  arc(ballX,ballY,BALLSIZE,BALLSIZE,-PI,0);
  fill(255);
  ///  arc(ballX,ballY,BALLSIZE,BALLSIZE,-PI,0); 
  noFill();
  strokeWeight(2);
  stroke(0);
  arc(ballX,ballY,BALLSIZE,BALLSIZE,0,-PI); 
  line(ballX-(BALLSIZE/2)-1,ballY,ballX+(BALLSIZE/2)-1,ballY);

}
void drawBaseOutside(){
stroke(0);
noFill();
  strokeWeight(3);
  rect(ballX-BALLSIZE/2,ballY-1,BALLSIZE,21);  
  
}

void drawBaseInside(){
  fill(255);
  noStroke();
  rect(ballX-BALLSIZE/2+1,ballY,BALLSIZE-2,20);  
  
}





void moveBall(){
  if(abs(ballX - CENTERX) > 10){
    if(ballX < CENTERX){
      xBallSpeed += MOVE; 
    } 
    else {
      xBallSpeed -= MOVE; 
    }
  }
  if(abs(ballY - CENTERY) > 10){
    if(ballY < CENTERY){
      yBallSpeed += MOVE; 
    } 
    else {
      yBallSpeed -= MOVE; 
    }
  }
  xBallSpeed *= .9;
  yBallSpeed *= .9;
  ballX+=xBallSpeed;
  ballY+=yBallSpeed;

  ballX = constrain(ballX,0,250);
  ballY = constrain(ballY,0,250);
}



void mouseMoved(){
  xBallSpeed = mouseX - lastX;
  yBallSpeed = mouseY - lastY;
  //println(xBallSpeed+" "+yBallSpeed+"::::"+lastX+" "+lastY);
  lastX = mouseX;
  lastY = mouseY;
  Iterator i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    f.kick();
  }

}

class Flake{
  float x,y; 
  float xSpeed,ySpeed;
  boolean isInFront = true;

  Flake(){
    x = random(-100,100);
    y = 0;
  } 
  void drawInside(boolean infront){
    if( (isInFront && ! infront ) || (infront && !isInFront)){
      return; 
    }
    noStroke();
    fill(255);
    ellipse(ballX+x,ballY+y,FLAKESIZE,FLAKESIZE); 
  }
  void drawOutside(boolean infront){
    if( (isInFront && ! infront ) || (infront && !isInFront)){
      return;
    }
    noFill();
    strokeWeight(3);
    stroke(0);
    ellipse(ballX+x,ballY+y,FLAKESIZE,FLAKESIZE); 
  }
  void kick(){
    xSpeed = -xBallSpeed*random(.5,1) ; 
    ySpeed = -yBallSpeed*random(1); 
  }


  boolean inBall(){
    if(sqrt(pow(x,2) + pow(y,2)) < (BALLSIZE-FLAKESIZE)/2){
      return true; 
    } 
    return false;
  }

  void move(){
    // xSpeed = -xBallSpeed;
    //  ySpeed = -yBallSpeed;
    x += xSpeed;
    y += ySpeed;
    if(!inBall()){
      if(x<0) {
        xSpeed = abs(xSpeed); 
        isInFront = true;
      }
      if(x>0) {
        xSpeed = -abs(xSpeed); 
        isInFront = false;
      }
      float angle = atan2(y,x);
      x = cos(angle) * ((BALLSIZE-FLAKESIZE)/2);
      y = sin(angle) * ((BALLSIZE-FLAKESIZE)/2);

    } 
    ySpeed += random(5,-2)/500;
    onCastle(x,y);
    if(y>=0 || onCastle(x,y)){
      ySpeed = 0; 
      xSpeed*=.5;
      if(! onCastle(x,y)) {
        y = 0; 
        // ySpeed = -.1;
      }   
    }

    xSpeed *= .99;
    ySpeed *= .9;



  }

}











