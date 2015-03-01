
PImage blinky;
PImage inky;
PImage pinky;
PImage clyde;
PImage pac;
PImage over;
int bX=225;
int bY=400;
int bV=10;
int iX=275;
int iY=400;
int iV=10;
int pX=225;
int pY=450;
int pV=10;
int cX=275;
int cY=450;
int cV=10;
int paX=30;
int paY=30;
int paV=15;
int tabCount=1;
int sec=0;
int mil=0;
int ran;
int rand;
int rando;
boolean gameOver=false;

void setup(){
  size(500, 700);
  blinky=loadImage("blinky.png");
  inky=loadImage("inky.png");
  pinky=loadImage("pinky.png");
  clyde=loadImage("clyde.png");
  pac=loadImage("pacman.png");
  over=loadImage("GameoverSMB");
  imageMode(CENTER);
}
void draw(){
  textSize(32);
  fill(0,0,0);
  rect(0,0,500,700);
  image(pac,paX,paY, width/10, height/10);
  image(blinky,bX,bY, width/10, height/10);
  image(inky,iX,iY, width/10, height/10);
  image(pinky,pX,pY, width/9, height/10);
  image(clyde,cX,cY, width/10, height/10);
  keyPressed();
  stroke(0,0,255);
  rect(133,100,20,200);
  rect(133,466,20,140);
  rect(333,100,20,200);
  rect(333,466,20,140);
  ran=random(255);
  rand=random(255);
  rando=random(255);
  
  if(intersectsBox(paX,paY,133,20,100,200)){
    paV=0;
  }
  if(intersectsBox(paX,paY,133,20,466,140)){
    paV=0;
  }
  if(intersectsBox(paX,paY,333,20,100,200)){
    paV=0;
  }
  if(intersectsBox(paX,paY,333,20,466,140)){
    paV=0;
  }
  
  if(dist(paX,paY,bX,bY)<=20){
    paV=0;
    fill(ran,rand,rando);
    text("GAME", 200, 200);
    text("OVER", 200, 400);
    bX=paX;
    bY=paY;}
  if(dist(paX,paY,iX,iY)<=20){
    paV=0;
    fill(ran,rand,rando);
    text("GAME", 200, 200);
    text("OVER", 200, 400);
    iX=paX;
    iY=paY;}
  if(dist(paX,paY,pX,pY)<=20){
   paV=0;
    fill(ran,rand,rando);
    text("GAME", 200, 200);
    text("OVER", 200, 400);
    pX=paX;
    pY=paY;}
  if(dist(paX,paY,cX,cY)<=20){
   paV=0;
    fill(ran,rand,rando);
    text("GAME", 200, 200);
    text("OVER", 200, 400);
    cX=paX;
    cY=paY;}
   
  if(paX<0)
    paX=500;
  if(paX>500)
    paX=0;
  if(paY>700)
    paY=0;
  if(paY<0)
    paY=700;
  
  if(bX<0)
    bX=500;
  if(bX>500)
    bX=0;
  if(bY>700)
    bY=0;
  if(bY<0)
    bY=700;
    
  if(iX<0)
    iX=500;
  if(iX>500)
    iX=0;
  if(iY>700)
    iY=0;
  if(iY<0)
    iY=700;
    
   if(pX<0)
    pX=500;
  if(pX>500)
    pX=0;
  if(pY>700)
    pY=0;
  if(pY<0)
    pY=700;
    
  if(cX<0)
    cX=500;
  if(cX>500)
    cX=0;
  if(cY>700)
    cY=0;
  if(cY<0)
    cY=700;
    
}

void keyPressed(){
  
 if(key=='i')
   paY-=paV;
 if(key=='k')
   paY+=paV;
 if(key=='l')
   paX+=paV;
 if(key=='j')
   paX-=paV;

 if((key=='q')&&(tabCount<4))
   tabCount+=1;
 else if((key=='q')&&(tabCount==4))
   tabCount=1;
 if(tabCount==1){
 if(key=='a'){
  bV=5;
  bX-=bV; 
 }
 if(key=='d'){
   bV=5;
  bX+=bV; 
 }
 if(key=='w'){
   bV=5;
  bY-=bV; 
 }
 if(key=='s'){
   bV=5;
  bY+=bV; 
 }
}

  if(tabCount==2){
 if(key=='a'){
   iV=5;
  iX-=iV; 
 }
 if(key=='d'){
   iV=5;
  iX+=iV; 
 }
 if(key=='w'){
   iV=5;
  iY-=iV; 
 }
 if(key=='s'){
   iV=5;
  iY+=iV; 
 }
 }
 
  if(tabCount==3){
 if(key=='a'){
   pV=5;
  pX-=pV; 
 }
 if(key=='d'){
   pV=5;
  pX+=pV; 
 }
 if(key=='w'){
   pV=5;
  pY-=pV; 
 }
 if(key=='s'){
   pV=5;
  pY+=pV; 
 }
 }
 
  if(tabCount==4){
 if(key=='a'){
   cV=5;
  cX-=cV; 
 }
 if(key=='d'){
   cV=5;
  cX+=cV; 
 }
 if(key=='w'){
   cV=5;
  cY-=cV; 
 }
 if(key=='s'){
   cV=5;
  cY+=cV; 
 }
}
}

boolean intersectsBox(float x, float y, float boxX, float boxWidth, float boxY, float boxHeight){
  if(x > boxX && x < boxX + boxWidth){
   if(y > boxY && y < boxY + boxHeight){
    return true;
   } 
  }

  return false;
}



