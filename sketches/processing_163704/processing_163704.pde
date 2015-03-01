
int ballSize = 50;

int x = 200;
int y = 200;
int speedX = 4;
int dirX = 1;
int speedY = 5;
int dirY = 1;
int screenWidth = 600;
String s = "Game Over!";
void setup(){
    size(screenWidth, screenWidth);
}

void draw(){
  background(128, 0, 255);
  fill(128, 255, 0);
  ellipse(x, y, ballSize, ballSize);
  x = x + dirX*speedX;
  y = y + dirY*speedY;
  if(x > screenWidth - ballSize/2 || x < ballSize/2){
    dirX = -dirX;
  }
  if(y > screenWidth - ballSize/2 || y < ballSize/2){
    dirY = -dirY;
  }
  if((mouseX > x -ballSize && mouseX < x +ballSize) && (y == screenWidth - 10)) {
  dirY = -dirY; 
  } 
  if(y == screenWidth - ballSize/2){
print (s);
  }
  rect(mouseX -ballSize, screenWidth - screenWidth/20 + ballSize/2, ballSize * 2, 10); 
}
  

