
void setup(){
  size(400,400);
  rectMode(CENTER);
}

void draw(){
  background(255);
  
  drawingRects(width/2,height/2,200,20,6);
}

void drawingRects(float x,float y,float w,float h,int num){
  noStroke();
  fill(0);
  
  rect(x,y,w,h);
  rect(x-w/2,y,h,w);
  rect(x+w/2,y,h,w);
  
  if(num > 0){
    drawingRects(x-w/2,y-w/2,w/2,h/2,num-1);
    drawingRects(x+w/2,y-w/2,w/2,h/2,num-1);
    drawingRects(x-w/2,y+w/2,w/2,h/2,num-1);
    drawingRects(x+w/2,y+w/2,w/2,h/2,num-1);
  }
}


