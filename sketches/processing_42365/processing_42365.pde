
int a=0;
void setup(){
  size(400,400);
  background(200);
   
}
 
 
void draw(){
  background(60,0,40);
  drawCross (20,20,10,60,10);
  drawCross (width-20,20,10,60,10);
  drawCross (20,height-20,10,60,10);
  drawCross (width-20,height-20,10,60,10);
  //ellipse (0,0,200,200);
  //ellipse (0,400,200,200);
  //ellipse (400,0,200,200);
  //ellipse (400,400,200,200);
float d =dist(mouseX, mouseY, 200,200);
  drawCross(mouseX,mouseY,d,255,5);
   
}
 
void drawCross(float x, float y, float crossSize, int c, float w) {
  stroke(c);
  strokeWeight(w);
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}

                
                                
