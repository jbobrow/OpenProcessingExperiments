
int n=8;

void setup(){
 size(600,600);
 background(255);
 noStroke();
 smooth();
 noLoop();
}
void draw(){
  drawSquare(100,100,200,8);
  drawSquaree(500,500,200,8);
}
void drawSquare(int x,int y,int line, int num){
  float tt=126*num/4.0;
  fill(#dd7ca3,100);
  rectMode(CENTER);
  rect(x,y,line,line);
  if(num>1){
    num=num-1;
    drawSquare(x+50,y+10,line/2,num);
    drawSquare(x-10,y+50,line/2,num);

  }
}
void drawSquaree(int a, int b, int linee, int num){
float tt=126*num/4.0;
  fill(#57b6a2,100);
  rectMode(CENTER);
  rect(a,b,linee,linee);
  if(num>1){
    num=num-1;
    drawSquaree(a-10,b-50,linee/2,num);
    drawSquaree(a-50,b-10,linee/2,num);
  }
  }


