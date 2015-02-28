
/*
  if (keyCode==UP) {  // UP
    if (red(get(cx, cy-1)) == 255) {
      y--;   
*/   

int xPos = 300;
int yPos = 300;
float xLength = 50;
float yLength = 50;

void setup(){
 size(600,600);
 background(0); 
}

void draw(){
  background(0);
  ellipse(xPos, yPos,xLength, yLength);
  if(keyCode==RIGHT){
    xPos = xPos + 1;
  }else if(keyCode==LEFT){
    xPos = xPos - 1;
  }else if(keyCode==UP){
    yPos = yPos - 1;
  }else if(keyCode==DOWN){
    yPos = yPos + 1;
  }
}
