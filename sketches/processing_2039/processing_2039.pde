
/*
float posX = 0;
 
 void setup(){
 size(500,500);
 
 }
 
 void draw(){
 background(0); 
 noFill();
 stroke(0,255,0);
 strokeWeight(3);
 posX +=1;
 posX = posX % width;
 line(posX,0,posX,width);
 
 }
 
 */

float posX = 500;
float posY = 0;
int vel=5;
float elliX = 100;

float elliY = 150;
int velX=3;
int velY=4;

void setup(){
  size(500,500);

}

void draw(){
  background(255,170,10); 
  noFill();
  stroke(46,252,168);
  strokeWeight(10);
  posY +=1;
  posY = posY % height;
  line(0,posY,width,posY);
  noFill();
  stroke(46,185,252);
  strokeWeight(10);
  posX =posX-1;
  posX = (posX + width) % width;
  line(posX,0,posX,width);

  noStroke();
  fill(255,10,231);
  int raggio = 60;

  if(elliX + raggio/2 > width || elliX - raggio/2 < 0) velX*=-1;


  if(elliY + raggio/2> height || elliY - raggio/2 < 0) velY*=-1;
  ellipse(elliX,elliY,raggio,raggio);

  elliX +=velX;
  elliY+=velY ;

  if(elliX >=width){
    elliX = elliX-1;
  }

}


