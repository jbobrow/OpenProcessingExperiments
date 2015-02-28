
void setup (){
  size(400,400);
}

void draw(){
  background(200);
  drawRect(20,20,40,40, 0,5);
  drawRect(340,20,40,40,0,5);
  drawRect(20,340,40,40,0,5);
  drawRect(340,340,40,40,0,5);
  drawRect(mouseX-20,mouseY-20,40,40,0,5);
  
}


void drawRect(float x, float y,float rectSize,float rectSize2, int c, float w ){
  stroke (c);
  strokeWeight(w);
  rect (x,y,rectSize , rectSize2);
  rect (x+rectSize,y ,rectSize/2 , rectSize2/2);
  rect (x+rectSize/2,y+rectSize ,rectSize/2 , rectSize2/2);
  rect (x,y-20 ,rectSize/2 , rectSize2/2);
  rect (x-20,y+rectSize/2 ,rectSize/2 , rectSize2/2);
}
                
                
