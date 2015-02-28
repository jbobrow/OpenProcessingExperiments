
int moveY, moveX;

void setup() {
  moveY =0;
  moveX =0;
  size(400,400);
}

void animateRect(){
  background(0);
 fill(255,0,255);
 rect(moveX,moveY,40,40);
 moveY++;
 moveX++;
 if(moveY+40 >=height) {
   moveY=0;
 }
   if(moveX+40 >=width) {
     moveX=0;
   }
}

void printResults() {
  println("the x position is: " + moveX + "the Y position is: " + moveY);
}


void draw() {
 animateRect();
 printResults();
}


