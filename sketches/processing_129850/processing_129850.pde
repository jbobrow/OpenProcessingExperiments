
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
float xspeed = 10;
float yspeed = 10;
float x = 50;
float y = 55;

void setup() {
  radius = 20;
  size(1000,1000);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  rectMode(CENTER);
  size(1000,800);
  background(0);
  frameRate(30);
}
 
void draw() {
  background(0);
  fill(255,0,0);
  rect(500,500,900,900);
  noStroke();
  fill(100,100,100,100);
  for (int i = 0; i < xpos.size(); i++)
  {
    fill(100,100,100);
    ellipse(xpos.get(i),ypos.get(i),50,50);
    
  }
  freeball();
  wallbounce();
  checkcontact();
}
// I tried....
//class Timer {
// 
//  int savedTime;
//  int totalTime;
//  
//  Timer(int tempTotalTime) {
//    totalTime = tempTotalTime;
//  }
//  void start() {
//    savedTime = millis(); 
//  }
//  boolean isFinished() { 
//    int passedTime = millis()- savedTime;
//    if (passedTime > totalTime) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//  Timer timer;
//
//  void setup() {
//  size(200,200);
//  background(0);
//  timer = new Timer(5000);
//  timer.start();
//}
//
//  void draw() {
//  if (timer.isFinished()) {
//    background(random(255));
//    timer.start();
//  }
//} 
//}

void mousePressed(){
  if (xpos.size()<=5){
    xpos.add(mouseX);
    ypos.add(mouseY);
  }
  if (xpos.size()>5){
    xpos.remove(0);
    ypos.remove(0);
    xpos.add(mouseX);
    ypos.add(mouseY);
  }
    
}

void freeball(){
  fill(255,0,0);
  ellipse(x,y,50,50);
  x += xspeed;
  y+= yspeed;
  xspeed /= 1.00001;
  yspeed /= 1.00001;
}

void checkcontact(){
  for (int i = 0; i < xpos.size(); i++)
  {
  if((dist(x,y,xpos.get(i),ypos.get(i)))<=50){
    if (xspeed<1){
      xspeed *=-10;
      yspeed *=-10;
    }
    if (xspeed>10){
      xspeed = 10;
      yspeed = 10;
    }
    else{
      xspeed*=-(random(1.00,2.00));
      yspeed*=-(random(1.00,2.00));
    }
    if ((x>xpos.get(i))) {
      xspeed*=random(-0.9,-1.1);
      yspeed*=random(-0.9,-1.1);
    }
    if ((x<xpos.get(i))) {
      xspeed*=random(-0.9,-1.1);
      yspeed*=random(-0.9,-1.1);
    }
    if ((x>xpos.get(i))) {
      xspeed*=random(-0.9,-1.1);
      yspeed*=random(-0.9,-1.1);
    }
    if ((x<xpos.get(i))) {
      xspeed*=random(-0.9,-1.1);
      yspeed*=random(-0.9,-1.1);
    }
    }    
  }
}

void wallbounce(){
  if (x+xspeed > width-25){
    xspeed*=-1;
  }
  if (x+xspeed < 25){
    xspeed*=-1;
  }
  if (y+yspeed > height-25){
    yspeed*=-1;
  }
  if (y+yspeed < 25){
    yspeed*=-1;
  }
}
