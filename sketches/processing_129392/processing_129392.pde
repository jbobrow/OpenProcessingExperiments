
int y = 20;
int x = 20;
void setup(){
  size(600, 600);
  background(20,120,20);
}

void draw(){
  fill(255);
  while (y<240){
  rect(50, y, 85, 100, 10,10,10,10);
  y= y+ 20;
  }
  y= 20;
  while (y<220){
    rect(150,y,85,100, 10,10,10,10);
    y= y+ 20;
  }
  y=20;
  while (y<300){
  rect(300, y, 85, 100, 10,10,10,10);
  y= y+ 20;
  }
  while(x<360){
  fill(255, 10,10);
  rect(x, 450, 85, 100, 10,10,10,10);
  x = x+20;
  }
}
  
  


