
//Ship follows finger through explosions
ArrayList <Explosion> explosions;

float exSize = 1;
float timer = 2;
float timerSub = 0.05;
float grow = 1;
float maxGrow;
float rX;
float rY;
float tempX = 100;
float tempY = 100;
boolean lose;
int score = 0;

void setup(){
  size(960,540);
  explosions = new ArrayList <Explosion>();
  noCursor();
}

void draw(){
  rectMode(CENTER);
  background(0);
  fill(255);
  rect(mouseX,mouseY,20,10);
  //Explosion creation
  if (timer <= 0){
    maxGrow = random(100,500);
    grow = random(0.5,2.5);
    rX = random(width);
    rY = random(height);
    explosions.add(new Explosion(rX,rY,exSize,maxGrow,grow));
    score += 1;
    timer = 2;
  }else{
    timer -= timerSub;
  }
  //Explosions Reactions
  for (int i = 0; i < explosions.size(); i++){
    Explosion p = explosions.get(i);
    p.place();
    p.boom();
    
    if (p.isDead()){
      explosions.remove(i);
    }
      
    if (p.collide()){
      text("Dead",900,80);
      lose = true;
    }
  }
   if (lose == true){
    fill(255);
    rect(height/2,width/2,9600,5400);
    fill(0);
    textSize(60);
    text("You Lose",350,250);
    textSize(30);
    text("Click to restart",370,300);
    text("Your Score:" + " " + score, 380, 350);
    timerSub = 0;
    //Clear the map
    for (int i = 0; i < explosions.size(); i++){
      explosions.remove(i);
    }
   }
  //Text for testing purposes
  fill(255);
  textSize(11);
  String timerS = String.format("%.2f", timer);
  String maxGrowS = String.format("%.0f", maxGrow);
  String growS = String.format("%.1f", grow);
  text("Timer:" + " " + timerS,870,20);
  text("Max Size:" + " " + maxGrowS,870,40);
  text("Rate:" + " " + growS,870,60);
}
void mousePressed(){
  /*Testing
  maxGrow = random(100,500);
  grow = random(0.5,2.5);
  rX = random(width);
  rY = random(height);
  explosions.add(new Explosion(rX,rY,size,maxGrow,grow));
  */
  lose = false;
  textSize(11);
  timerSub = 0.05;
}

class Explosion{
  float eX;
  float eY;
  float eSize;
  float eMax;
  float lifespan;
  float growSpeed;
  
  Explosion(float _eX, float _eY, float _eSize, float _max, float _growSpeed){
    eX = _eX;
    eY = _eY;
    eSize = _eSize;
    eMax = _max;
    lifespan = 255;
    growSpeed = _growSpeed;
  }
  
  void place(){
    fill(255,0,0,lifespan);
    noStroke();
    ellipse(eX,eY,eSize,eSize);
    fill(255);
    text(eMax,eX,eY);
  }
  
  void boom(){
    eSize += growSpeed;
    //lifespan -=(255/max);
  }
  
  boolean isDead(){
    if (eSize >= eMax){
      return true;
    }else{
      return false;
    }
  }
  
  boolean collide(){
    float dx = eX - mouseX;
    float dy = eY - mouseY;
    float distance = sqrt(dx*dx + dy*dy);
    float minDist = (eSize/2) + 10;
    if (distance <= minDist){
      return true;
    }else{
      return false;
    }
  }
}


