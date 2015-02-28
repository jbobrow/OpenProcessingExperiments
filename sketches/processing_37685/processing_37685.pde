
int moveX, moveY;

void setup(){
  moveY=0;
  moveX=0;
  size(400,400);
  
}

void draw(){
  background (0);
  fill(255,210,110);
  rect(moveY, moveX, 40,40);
  moveY++; //moveY is equal to moveY+1
  moveX++; //as above
  if(moveY+40 >= height){ //variable saying that once the top edge of the square reaches the bottom, it will return to zero to keep the animation going.
    moveY=0;
    if(moveX+40 >= width){ //nested variable saying that once X is greater than the width, it must return to zero to keep the animation going.
      moveX=0;
    }
  }

}

