
float r;
float g;
float b;
float circleX;
float circleY;
float h;
float w;

void setup(){
  size(1000,700);
}

void draw(){
  background(255);
  for(int i = 0; i<10;i+=1){
    for(int j = 0; j<10; j+=1){
      changeSize(i,j);
      colour();
      drawCircle(i,j);
      
    }
  }
}

void changeSize(int i, int j){
  circleX=i;
  circleY=j;
  w = map(sin(dist(circleX,circleY,mouseX,mouseY)),-1,1,400,450);
  h = map(sin(dist(circleX,circleY,mouseX,mouseY)),-1,1,400,450);
}

void colour(){
  r=200-dist(circleX+w,circleY+h,mouseX,mouseY)%255/2;
  g=150-dist(circleX-w,circleY-h,mouseX,mouseY)%255/2;
  b=100+dist(circleX-w,circleY+h,mouseX,mouseY)%255/2;
}

void drawCircle(int i, int j){
  fill(r,g,b);
  ellipse(mouseX+20*i,mouseY-20*j,500-w,500-h);
}
