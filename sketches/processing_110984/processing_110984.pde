
int counter;

int x,y;
int xBox,yBox,h,w;
boolean isCovered1,isCovered2,isCovered3,isCovered4;

void setup(){
  size(600,600);
  isCovered1=false;
  isCovered2=false;
  isCovered3=false;
  isCovered4=false;
  smooth();
  background(255);
}

void draw(){
  fill(255,255,255);
   noStroke();
  rectMode(CENTER);
  rect(width/2,height/2,200,200);
  x=mouseX;
  y=mouseY;
 
  
  
  if (boxOver1(x,y,width/2,height/2,200,200)==true){
  fill(255,0,0);
  rect(width/2+50,height/2-50,100,100);
  }
  else{
    fill(255,255,255);
    rect(width/2+50,height/2-50,100,100);
  }
  
  if (boxOver2(x,y,width/2,height/2,200,200)==true){
  fill(0,10,255);
  rect(width/2-50,height/2-50,100,100);
  }
  else{
    fill(255,255,255);
    rect(width/2-50,height/2-50,100,100);
  }
  
  if (boxOver3(x,y,width/2,height/2,200,200)==true){
  fill(0,255,40);
  rect(width/2-50,height/2+50,100,100);
  }
  else{
    fill(255,255,255);
    rect(width/2-50,height/2+50,100,100);
  }
  
  if (boxOver4(x,y,width/2,height/2,200,200)==true){
  fill(255,247,0);
  rect(width/2+50,height/2+50,100,100);
  }
  else{
    fill(255,255,255);
    rect(width/2+50,height/2+50,100,100);
  }
  
  
  noFill();
  stroke(0);
   rectMode(CENTER);
  rect(width/2,height/2,200,200);
 
}

boolean boxOver1(int xPos,int yPos,int xBox,int yBox,int h,int w){
  if(xPos>xBox && xPos<(xBox+w/2) && yPos<yBox && yPos>(yBox-h/2)){
    isCovered1=true;
  }
  else{
    isCovered1=false;
  }
  return isCovered1;
}

boolean boxOver2(int xPos,int yPos,int xBox,int yBox,int h,int w){
  if(xPos<xBox && xPos>(xBox-w/2) && yPos<yBox && yPos>(yBox-h/2)){
    isCovered2=true;
  }
  else{
    isCovered2=false;
  }
  return isCovered2;
}

boolean boxOver3(int xPos,int yPos,int xBox,int yBox,int h,int w){
  if(xPos<xBox && xPos>(xBox-w/2) && yPos>yBox && yPos<(yBox+h/2)){
    isCovered3=true;
  }
  else{
    isCovered3=false;
  }
  return isCovered3;
}
  
  
  boolean boxOver4(int xPos,int yPos,int xBox,int yBox,int h,int w){
  if(xPos>xBox && xPos<(xBox+w/2) && yPos>yBox && yPos<(yBox+h/2)){
    isCovered4=true;
  }
  else{
    isCovered4=false;
  }
  return isCovered4;
}
