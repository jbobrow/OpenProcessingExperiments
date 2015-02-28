
//help from jaboston.com/tutorials
int moveY, moveX, myX, myY;
void setup () {
  moveY = 0;
  moveX = 0;
  myX = (moveX);
  myY = (moveY);
  size(400,400);
  
}


void draw(){
   background(0);
  fill(moveX+250,0,50);
  ellipse(moveX,moveY,40,40);
  moveY++;
  moveX++;
  if(moveY+40 >= height) {
    moveY=myY+40;
    if(moveX+40>= width){
      moveX=myX+40;
    }
  }
  background(0);
  fill(moveY*(1/3),moveX,moveX*4);
  ellipse(moveX-20,moveY-20,40,40);
  moveY++;
  moveX++;
  if(moveY+40==height) {
    moveY=moveX;
    if(moveX+40==width){
      moveX=moveY;
    }
  }
   if(mousePressed== true){
    fill(moveY-50,moveX,moveY+500);
  } else {
    fill(moveY,1,moveX);
    rect(moveY,moveX,50,50);
    if(moveY>height+10){
      moveY=mouseY*(1/3);
      if(moveX>width+90)
      moveX=moveX*1/3;
    }
  }
}


