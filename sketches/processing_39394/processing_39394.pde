
int rX;
int rY;
int directionRX;
int directionRY;
int gX;
int gY;
int directionGX;
int directionGY;
int bX;
int bY;
int directionBX;
int directionBY;

void setup(){
  size(600,600);
  smooth();
  background(0);
  rX = 300;
  rY = 1;
  directionRX = 1;
  directionRY = -2;
  
  gX = 150;
  gY = 1;
  directionGX = -6;
  directionGY = 4;
  
  bX = 500;
  bY = 1;
  directionBX = -3;
  directionBY = 6;
}

void draw(){
  //background(0);
 
 //redball 
 rX += directionRX;
 rY += directionRY;

 fill(255,random(255),random(255));
 ellipse(rX,rY,50,50);
 if(rY>=height){
   directionRY = -4;
 }
 if(rX>=width){
   directionRX = -3;
 }
 if(rY<=0){
   directionRY = +5;
 }
 if(rX<=0){
   directionRX = +4;
 }

  //greenball
 gX += directionGX;
 gY += directionGY;

 fill(random(255),255,random(255),100);
 ellipse(gX,gY,50,50);
 if(gY>=height){
   directionGY = -4;
 }
 if(gX>=width){
   directionGX = -7;
 }
 if(gY<=0){
   directionGY = +5;
 }
 if(gX<=0){
   directionGX = +8;
 }
 
 //blueball
 bX += directionBX;
 bY += directionBY;

 fill(random(255),random(255),255,100);
 ellipse(bX,bY,50,50);
 if(bY>=height){
   directionBY = -7;
 }
 if(bX>=width){
   directionBX = -3;
 }
 if(bY<=0){
   directionBY = +9;
 }
 if(bX<=0){
   directionBX = +4;
 }
}


