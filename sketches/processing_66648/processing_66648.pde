
int yPos = 300;
int yspe = 2; 
int xPos = 300;
int xspe = 10;

void setup(){
  size(500,500);
  frameRate(100);
  smooth();
  noStroke();
}
void draw(){
  fill(44, 255, 243, 10); 
  rect(0, 0, 500, 500);
  fill(44,232,255);
  for(int i = 0; i < 20; i ++){
    rect(0 + 60 * (i+1), yPos, 40, 40);
    rect(xPos, 0 + 60 * (i+1), 40, 40);
  }
  moveRects(5);  
}

void moveRects(int speed){
  if(yPos == 0 || yPos == 490){
    yspe = yspe*(-1); 
  }
  yPos = yPos + speed * yspe; 
  
  if(xPos == 100 || xPos == 490){
    xspe = xspe*(-1);
  }
  xPos = xPos + speed * yspe;
}

