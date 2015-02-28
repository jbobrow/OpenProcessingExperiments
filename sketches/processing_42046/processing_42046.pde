
void setup(){
  size(400,400);
  background(200);
   
}
 
 
void draw(){
  background(200);
  smooth();
  
   
  
 
   
  line(140,50,140,350);
  line(260,50,260,350);
  line(60,150,340,150);
  line(60,260,340,260);
  
 ellipse(80,310,50,50);
 ellipse(200,210,50,50);
 
  drawCross(80,80,40,5,5);
  drawCross(280,290,40,5,5);
  drawCross(280,80,40,5,5);
  drawCross(mouseX-20,mouseY-20,40,255,5);
  
   
}

 
void drawCross(float x, float y, float crossSize, int c, float w) {
  stroke(c);
  
  strokeWeight(w);
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}

                
                
