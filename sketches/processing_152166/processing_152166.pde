
flowers iPlayer ;
int boudMax;
int i;
boolean shiftLock;
boolean gameOver;

void setup(){
  size(480,720);
  noStroke();
  iPlayer = new flowers(5);
  boudMax=5;
  shiftLock=gameOver=false;
}

void draw(){
  background(#000000);
  if(!iPlayer.gameCheck()){
    iPlayer.ballDraw();
    iPlayer.draw();
    iPlayer.shift(shiftLock);
    iPlayer.countCheck();
  } else {
    fill(255);
    textAlign(CENTER,CENTER);
    text("Game Over",width/2,height/2);
    if(keyPressed){
      iPlayer.ballList.clear();
      delay(500);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode){
    case UP:
      iPlayer.yplus=-3;
      break;
    case DOWN:
      iPlayer.yplus=3;
      break;
    case RIGHT:
      iPlayer.xplus=3;
      break;
    case LEFT:
      iPlayer.xplus=-3;
      break;
    case SHIFT:
      shiftLock=true;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode){
    case UP:
      iPlayer.yplus=0;
      break;
    case DOWN:
      iPlayer.yplus=0;
      break;
    case RIGHT:
      iPlayer.xplus=0;
      break;
    case LEFT:
      iPlayer.xplus=0;
      break;
    case SHIFT:
      shiftLock=false;
      break;
    }
  }
}
class ball{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float direct;
  int boundNum;
  int atackCount;
  ball(float xpos , float ypos , float xspeed , float yspeed , float direct){
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=xspeed;
    this.yspeed=yspeed;
    this.direct=direct;
    this.boundNum=0;
    this.atackCount=0;
  }
  
  void draw(){
    fill(#ffffff);
    pushMatrix();
    translate(this.xpos,this.ypos);
    ellipse(0,0,10,10);
    popMatrix();
    this.update();
  }
  
  void update(){
    this.xpos+=this.xspeed*cos(this.direct);
    this.ypos+=this.yspeed*sin(this.direct);
    if(this.xpos>width || this.xpos<0){
      this.xspeed*=-1;
      this.boundNum++;
    }
    if(this.ypos>height || this.ypos<0){
      this.yspeed*=-1;
      this.boundNum++;
    }
  }
}
class balls{
  float xpos;
  float ypos;
  int xplus;
  int yplus;
  ArrayList<ball> ballList;
  int boundMax;
  balls(int boundMax){
    this.xpos = width/2;
    this.ypos = height/2;
    this.xplus = 0;
    this.yplus = 0;
    this.ballList = new ArrayList<ball>();
    this.boundMax = boundMax;
  }
  
  void draw(){
    fill(#11bbcc);
    pushMatrix();
    translate(this.xpos,this.ypos);
    ellipse(0,0,20,20);
    popMatrix();
    this.ypos+=yplus;
    this.xpos+=xplus;
  }
  
  void ballDraw(){
    for(i = 0 ; i < ballList.size() ; i++){
      this.ballList.get(i).draw();
      this.ballList.get(i).update();
      if(this.ballList.get(i).boundNum > boudMax){
        this.ballList.remove(i);
        i--;
      }
    }
  }
  
  void shift(boolean lock){
    if(lock){
      float direct = random(0,2*PI);
      this.ballList.add(new ball(this.xpos+20*cos(direct),this.ypos+20*sin(direct),random(1,5),random(1,5),direct));
    }
  }
  
  void countCheck(){
    for(i = 0 ; i < ballList.size() ; i++){
      if(this.ballList.get(i).xpos >= this.xpos-10 && this.ballList.get(i).xpos <= this.xpos+10){
        if(this.ballList.get(i).ypos >= this.ypos-10 && this.ballList.get(i).ypos <= this.ypos+10){
          this.ballList.get(i).atackCount++;
        }
      }
    }
  }
  
  boolean gameCheck(){
    for(i = 0 ; i < ballList.size() ; i++){
      if(this.ballList.get(i).atackCount >= 2){
        return true;
      }
    }
    return false;
  }
}
class flower{
  float xpos;
  float ypos;
  ArrayList<ball> balls;
  int boundMax;
  float setupTime;
  int shotNum;
  flower(float xpos, float ypos ,int boundMax){
    this.xpos = xpos;
    this.ypos = ypos;
    this.balls = new ArrayList<ball>();
    this.boundMax = boundMax;
    this.setupTime = millis();
    this.shotNum = 0;
  }
  
  void draw(){
    fill(#11bbcc);
    pushMatrix();
    translate(this.xpos,this.ypos);
    ellipse(0,0,10,10);
    popMatrix();
    if((millis()-this.setupTime) > 5000.0){
      float direct = random(0,2*PI);
      this.balls.add(new ball(this.xpos+20*cos(direct),this.ypos+20*sin(direct),random(1,5),random(1,5),direct));
      this.setupTime = millis();
      this.shotNum++;
    }
  }
  
  void ballDraw(){
    for(i = 0 ; i < balls.size() ; i++){
      this.balls.get(i).draw();
      this.balls.get(i).update();
      if(this.balls.get(i).boundNum > boudMax){
        this.balls.remove(i);
        i--;
      }
    }
  }
}
class flowers{
  float xpos;
  float ypos;
  int xplus;
  int yplus;
  ArrayList<flower> ballList;
  int boundMax;
  flowers(int boundMax){
    this.xpos = width/2;
    this.ypos = height/2;
    this.xplus = 0;
    this.yplus = 0;
    this.ballList = new ArrayList<flower>();
    this.boundMax = boundMax;
  }
  
  void draw(){
    fill(#11bbcc);
    pushMatrix();
    translate(this.xpos,this.ypos);
    ellipse(0,0,20,20);
    popMatrix();
    this.ypos+=yplus;
    this.xpos+=xplus;
    for(int i = 0 ; i < this.ballList.size() ; i++){
      ballList.get(i).draw();
      ballList.get(i).ballDraw();
      if(this.ballList.get(i).shotNum > boudMax){
        this.ballList.remove(i);
        i--;
      }
    }
  }
  
  void ballDraw(){
    for(i = 0 ; i < ballList.size() ; i++){
      this.ballList.get(i).draw();
    }
  }
  
  void shift(boolean lock){
    if(lock){
      this.ballList.add(new flower(this.xpos,this.ypos,this.boundMax));
    }
  }
  
  void countCheck(){
//    for(i = 0 ; i < ballList.size() ; i++){
//      if(this.ballList.get(i).xpos >= this.xpos-10 && this.ballList.get(i).xpos <= this.xpos+10){
//        if(this.ballList.get(i).ypos >= this.ypos-10 && this.ballList.get(i).ypos <= this.ypos+10){
//          this.ballList.get(i).atackCount++;
//        }
//      }
//    }
  }
  
  boolean gameCheck(){
//    for(i = 0 ; i < ballList.size() ; i++){
//      if(this.ballList.get(i).atackCount >= 2){
//        return true;
//      }
//    }
    return false;
  }
}


