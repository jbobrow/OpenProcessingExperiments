
int n=8;

void setup(){
 size(800,800);
 background(255);
 noStroke();
 smooth();
 noLoop();
}
void draw(){
  drawSquare(400,400,300,8);
}
void drawSquare(int x,int y,int line, int num){
  float tt=126*num/4.0;
  fill(#dd7ca3,100);
  rectMode(CENTER);
  rect(x,y,line,line);
  if(num>1){
    num=num-1;
    drawSquare(x+50,y+50,line/2,num);
    drawSquare(x+50,y-50,line/2,num);
    drawSquare(x-50,y+50,line/2,num);
    drawSquare(x-50,y-50,line/2,num);

  }
}


