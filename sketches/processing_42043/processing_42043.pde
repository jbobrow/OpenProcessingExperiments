
void setup(){
  size(400,400);
  background(200);
   
}
 
 
void draw(){
  background(200);
  ellipse(0,0,40,40);
  ellipse(0,400,40,40);
  
  drawCross(360,0,40,5,5);
  drawCross(360,360,40,5,5);
  
  ellipse(mouseX, mouseY, 40, 40);

   
}
 
 
void drawCross(float x, float y, float crossSize, int c, float w) {
  
  stroke(c);
  strokeWeight(2);
  
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}

                
