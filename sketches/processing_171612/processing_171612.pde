
PImage blinky;
PImage inky;
PImage pinky;
PImage clyde;
PImage pac;
int bX=100;
int bY=200;
int bV=20;
int iX=300;
int iY=200;
int iV=20;
int pX=100;
int pY=500;
int pV=20;
int cX=300;
int cY=500;
int cV=20;
int tabCount=0;

void setup(){
  size(500, 700);
  blinky=loadImage("blinky.png");
  inky=loadImage("inky.png");
  pinky=loadImage("pinky.png");
  clyde=loadImage("clyde.png");
}
void draw(){
  rect(0,0,500,700);
  image(blinky,bX,bY, width/4, height/4);
  image(inky,iX,iY);
  image(pinky,pX,pY, width/3, height/4);
  image(clyde,cX,cY, width/4, height/4);
  keyPressed();
  
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

 if((key=='q')&&(tabCount<4))
   tabCount+=1;
 else if((key=='q')&&(tabCount==4))
   tabCount=0;
 if(tabCount==1){
 if(key=='a'){
  bX-=bV; 
 }
 if(key=='d'){
  bX+=bV; 
 }
 if(key=='w'){
  bY-=bV; 
 }
 if(key=='s'){
  bY+=bV; 
 }
}

  if(tabCount==2){
 if(key=='a'){
  iX-=iV; 
 }
 if(key=='d'){
  iX+=iV; 
 }
 if(key=='w'){
  iY-=iV; 
 }
 if(key=='s'){
  iY+=iV; 
 }
 }
 
  if(tabCount==3){
 if(key=='a'){
  pX-=pV; 
 }
 if(key=='d'){
  pX+=pV; 
 }
 if(key=='w'){
  pY-=pV; 
 }
 if(key=='s'){
  pY+=pV; 
 }
 }
 
  if(tabCount==4){
 if(key=='a'){
  cX-=cV; 
 }
 if(key=='d'){
  cX+=cV; 
 }
 if(key=='w'){
  cY-=cV; 
 }
 if(key=='s'){
  cY+=cV; 
 }
 }
 
  if(tabCount==0){
 if(key=='a'){
  bX-=bV;
  iX-=iV;
  pX-=pV;
  cX-=cV;
 }
 if(key=='d'){
  bX+=bV;
  iX+=iV;
  pX+=pV;
  cX+=cV; 
 }
 if(key=='w'){
  bY-=bV;
  iY-=iV;
  pY-=pV;
  cY-=cV;
 }
 if(key=='s'){
  bY+=bV;
  iY+=iV;
  pY+=pV;
  cY+=cV;
 }
 }
  
}


