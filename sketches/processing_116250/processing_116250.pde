
//globals
int leftY = 0;
int rightY = 0;
boolean goingDown = true;


void setup() {

  size(600,600);
  background(255);
}
void draw() { 
  int x1 = mouseX;
  int y1 = mouseY;
  //float offsetX = 0;
  //float ;
  //float ;
  int y2=leftY;
  int y3=rightY;
  fill(200,10);
  triangle(x1, y1, 0, y2, 600, y3);
  //offsetX = offsetX+PI/6;
  if( goingDown == true) {
    if(leftY != 600) {
      leftY++;
      rightY++;
    }
    else {  
      goingDown = false;    
    }
  }
  else {
  
    if(leftY != 0) {

      leftY--;
      rightY--;

    }
    
    else {
    
      goingDown = true;
    
    }
  
  }

}
