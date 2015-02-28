
int posX;
int posY;
int x=100;
int y=100;
float distance;

void setup(){
  size(500,500);
}

void draw(){
  distance=dist(x,y,posX,posY);
  background(0);
  if(mousePressed==true){
    posX=mouseX-(x/2);
    posY=mouseY-(y/2);
  }
  if(mouseX>posX && mouseX<posX+x && mouseY>posY && mouseY<posY+y){
    fill(195,160,227);
  }
  else{
    fill(114,214,93);
  }
  rect(posX,posY,x,y);
}


