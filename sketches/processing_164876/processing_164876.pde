
int n=8;

void setup(){
 size(700,700);
 background(255);
 noStroke();
 smooth();
 noLoop();
}
void draw(){
  translate(width/2,height/2);
  drawSquare(0,0,700,10);
}
void drawSquare(int x,int y,float line, int num){
  float tt=126*num/4.0;
  fill(#dd7ca3,50);
  rectMode(CENTER);
  rect(x,y,line,line);
  rotate(PI/6);
  if(num>1){
    num=num-1;
    drawSquare(0,0,line/1.4,num);
  }

}



