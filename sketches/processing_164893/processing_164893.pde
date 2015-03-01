
int n=8;
 
void setup(){
 size(500,500);
 background(190, 210, 90);
 noStroke();
 smooth();
 noLoop();
}
void draw(){
  drawSquare(200,200,300,8);
}
void drawSquare(int x,int y,int line, int num){
  float tt=120*num/2.0;
  fill(#dd7ca1,60);
  rectMode(CENTER);
  ellipse(x,y,line,line);
  if(num>1){
    num=num-1;
    drawSquare(x+30,y+30,line/4,num);
    drawSquare(x+60,y-60,line/2,num);
    drawSquare(x-80,y+80,line/2,num);
    drawSquare(x-50,y-50,line/2,num);
    drawSquare(x+100,y+100,line/4,num);
    
   
  
    
    
 
  }
}



