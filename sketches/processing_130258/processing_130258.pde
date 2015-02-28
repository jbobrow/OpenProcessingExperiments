
int numBalls = 500;
int numPreds = 30;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
float rand=0;
float dir=0;
int countb=0;
int countp=0;
int killcount=0;
int sgn(float f) {
  if (f > 0) return 1;
  if (f < 0) return -1;
  return 0;
} 

Animal[] prey = new Animal[numBalls];
Animal[] preds = new Animal[numPreds];

void setup() {
  size(640, 360);
    for (int i = 0; i < numPreds; i++) {
    preds[i] = new Animal(false, random(width), random(height), 10, i, preds);
  }
  for (int i = 0; i < numBalls; i++) {
    prey[i] = new Animal(true, random(width), random(height), 10, i, prey);
  }
  noStroke();
}

void draw() {
    background(75);
    
  for (int i = 0; i < numBalls; i++) {
    prey[i].move();
    prey[i].display(); 
    if(i<numPreds){
    fill(255,0,0);
    preds[i].move();
    preds[i].display();
    }
    for(int j=0;j<numPreds;j++){
    if(sqrt(sq(prey[i].x-preds[j].x)+sq(prey[i].y-preds[j].y))<20){
    if(sqrt(sq(prey[i].x-preds[j].x)+sq(prey[i].y-preds[j].y))<10){
      Animal temp;
      temp=prey[numBalls-1];
      prey[numBalls-1]=prey[i];
      prey[i]=temp;
      shorten(prey);
      numBalls=numBalls-1;
      killcount=killcount+1;
      killcount=killcount%5;
    }
    if((prey[i].x-preds[j].x<=0)&(prey[i].y-preds[j].y<=0)){
    prey[i].xdirection=prey[i].xdirection-.3;
    prey[i].ydirection=prey[i].ydirection-.3;
  }
    if((prey[i].x-preds[j].x>0)&(prey[i].y-preds[j].y<=0)){
     prey[i].xdirection=prey[i].xdirection;
    prey[i].ydirection=prey[i].ydirection-.3;
  }
    if((prey[i].x-preds[j].x<=0)&(prey[i].y-preds[j].y>0)){
     prey[i].xdirection=prey[i].xdirection-.3;
     prey[i].ydirection=prey[i].ydirection;
    }
    if((prey[i].x-preds[j].x>0)&(prey[i].y-preds[j].y>0)){
     prey[i].xdirection=prey[i].xdirection;
     prey[i].ydirection=prey[i].ydirection;
  }

    } 
    fill(255, 204);
    }
  }
  }

class Animal{
 
  float x,y;
  float xdirection=0;
  float ydirection=0;
  float diameter;
  float vx = 0;
  float vy = 0;
  Boolean Type;
  int id;
  Animal[] others;
 
  Animal(boolean type, float xin, float yin, float din, int idin, Animal[] oin) {
    x= xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    Type=type;
  } 
  
  void move() {
  rand=random(0,8);
  dir=floor(rand);
  countb=countb+1;
  countp=countp+1;
  countp=countp%100;
  if(Type==false&(countp<90)){
  x = x + (xdirection);
  y = y + (ydirection);
  }
  else{
  countb=countb%4;
  x = x + (xdirection);
  y = y + (ydirection);
  if(countb!=0){
  xdirection=0;
  ydirection=0;
  if(dir==0){
    xdirection=xdirection-.3;
    ydirection=ydirection+.3;
  }
    if(dir==1){
    xdirection=xdirection;
    ydirection=ydirection+.3;
  }
    if(dir==2){
    xdirection=xdirection+.3;
    ydirection=ydirection+.3;
    }
    if(dir==3){
    xdirection=xdirection+.3;
    ydirection=ydirection;
  }
    if(dir==4){
    xdirection=xdirection+.3;
    ydirection=ydirection-.3;
  }
    if(dir==5){
    xdirection=xdirection;
    ydirection=ydirection-.3;
  }
    if(dir==6){
    xdirection=xdirection-.3;
    ydirection=ydirection-.3;
  }
    if(dir==7){
    xdirection=xdirection-.3;
    ydirection=ydirection;
  }
  }
  }


    if (x + diameter/2 > width) {
      x = width - diameter/2;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}



