
int ballposX=18;
int ballposY=20;
int ballspeedX=5;
int ballspeedY=10;
int t, northWall,southWall,eastWall,westWall;


void setup() {
  size(500, 400);
  background(255);
  smooth();
  eastWall=500;
  southWall=400;
  northWall=0;
  westWall=0;
}
  

  
void draw() {
 // background(255);

  ballposX=ballposX+ballspeedX;
  if(ballposX>eastWall){
   ballspeedX-=5;
  }
 
   
  if(ballposX<westWall){
  ballspeedX=5;
  }
   
  ballposY=ballposY+ballspeedY;
  if(ballposY>southWall){
   ballspeedY=ballspeedY-=5;
  }
  if(ballposY<northWall){
  ballspeedY=5;
  }
   
   
  //stroke(300,200,0);
  strokeWeight(1);
  ellipse(ballposX,ballposY,t,t);
     t++;
    if (t > 7) {
      t = 0;
}
 
}

void mousePressed() {
  
  
  if((ballposX<mouseX) &&(ballposY<mouseY)) { eastWall=mouseX; southWall=mouseY; }
  if((ballposX<mouseX) &&(ballposY>mouseY)) { eastWall=mouseX; northWall=mouseY; }  
  if((ballposX>mouseX) &&(ballposY<mouseY)) { westWall=mouseX; southWall=mouseY; }
  if((ballposX>mouseX) &&(ballposY>mouseY)) { westWall=mouseX; northWall=mouseY; }  
  line(mouseX, mouseY, mouseX, 400);
  line(mouseX, mouseY, mouseX, 0);
  line(mouseX, mouseY, 500, mouseY);
  line(mouseX, mouseY, 0, mouseY);
  
}
