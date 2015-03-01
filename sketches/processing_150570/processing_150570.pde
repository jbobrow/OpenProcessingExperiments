
int moveY,moveX;

void setup (){
  moveY=0;
  moveX=0;
  size(400,600); //size of screen
}

void draw(){
  background (255);
  fill(350,0,350);
  rect (moveX,moveY,55,55);
  moveY++;
  moveX++;
  if(moveY >=height){
    moveY=0;
    if(moveX >=width){
      moveX=0;
    }
  }
}
  



