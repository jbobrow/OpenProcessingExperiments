
ArrayList<Integer> objectX;
ArrayList<Integer> objectY;
ArrayList<Integer> objectSize;
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int locationX;
int locationY;
int velocity = 5;
float Rsize;
boolean w = false;
boolean s = false;
boolean a = false;
boolean d = false;
boolean shift = false;
int sec;
int time;
int deg = 20;
int speed = 5;
int objectAmount;
int x = width/2;
int y = height/2;
float radius = 30.0;
int sizeVar = 75;
float playerScore = 0;
String scorePrint = "Score: " + playerScore;
String Final = "Your score was: " + playerScore;
void setup(){
  size(800,800);
  x = width/2;
  y = height/2;
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  objectX = new ArrayList<Integer>();
  objectY = new ArrayList<Integer>();
  objectSize = new ArrayList<Integer>();
  fill(255,0,0);
  stroke(255,0,0);
  ellipse(x,y,radius,radius);
  xpos.add(x);
  ypos.add(y);
  objectAmount=8;
}

void draw(){
  background(0);
  if (objectX.size()<objectAmount){
    objects();
  }
  score();
  if (w==true) y-=speed;  
  if (s==true) y+=speed;
  if (d==true) x+=speed;
  if (a==true) x-=speed;
  if (shift==true){
    speed = 10;
  }
  else{
    speed = 3;
  }
  
  for (int i=0;i<objectX.size();i++){
    fill(0,0,255);
    stroke(0,0,255);
    ellipse(objectX.get(i),objectY.get(i),objectSize.get(i),objectSize.get(i));
    objectX.set(i,objectX.get(i)+velocity);
    if (objectX.get(i)>width){
      objectX.set(i,0-int(random(10,width)));
      objectY.set(i,int(random(10,width)));
      objectSize.set(i,int(random(10,75)));
    }
    
  }
  
  for (int i=0;i<xpos.size();i++){
    if (w==true) ypos.set(i,ypos.get(i)-speed);  
    if (s==true) ypos.set(i,ypos.get(i)+speed); 
    if (d==true) xpos.set(i,xpos.get(i)+speed);
    if (a==true) xpos.set(i,xpos.get(i)-speed);
    if (shift==true){
      speed = 6;
    }
  else{
    speed = 3;
  }
    fill(255,0,0);
    stroke(255,0,0);
    ellipse(xpos.get(i),ypos.get(i),radius,radius);
    
  }
  collide();
}

void keyPressed(){
  if (key == 'w' || key == 'W') w = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 'd' || key == 'D') d = true;
  if (keyCode == SHIFT) shift = true;
}

void keyReleased(){
  if (key == 'w' || key == 'W') w = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 'd' || key == 'D') d = false;
  if (keyCode == SHIFT) shift = false;
}

void score(){
  time = millis();
  scorePrint = "Score: " + int(playerScore);
  textSize(26);
  fill(0);
  text(scorePrint,0,26);
  fill(255);
  text(scorePrint,0,26);
  playerScore+=.1;
  if (playerScore%5==0){
    objectAmount += 1;
  }
  
}

void collide(){
  for (int i=0;i<objectX.size();i++){  
    if (dist(objectX.get(i),objectY.get(i),xpos.get(0),ypos.get(0))<radius){
      Final = "Your score was: " + int(playerScore);
      objectX = new ArrayList<Integer>();
      objectY = new ArrayList<Integer>();
      objectSize = new ArrayList<Integer>();
      textSize(60);
      fill(255);
      text(Final,0,height/2);
      noLoop();
      objects();
    }
  }
}

void objects(){
  for (int i=0;objectX.size()<8;i++){
    locationX = 0 - int(random(0,width));
    locationY = int(random(0,width));
    Rsize = int(random(10,sizeVar));
    objectX.add(locationX);
    objectY.add(locationY);
    objectSize.add(int(Rsize));
    
    
  }
    
}
  
