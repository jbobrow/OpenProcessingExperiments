
void setup(){
  size(400,400);
  background(200);
  smooth();
    
}
  
  
void draw(){
  background(200,30,50);
  ellipse(40,0,40,40);
  ellipse(0,380,40,40);
  
  ellipse(400,2,40,40);
  ellipse(400,360,40,40); 
 
  
  fill(250);
  noStroke(); 
  ellipse(mouseX-5, mouseY-5, 40, 40);
 
    
}
  
  
void drawCross(float x, float y, float crossSize, int c, float w) {
   
  stroke(c);
  strokeWeight(2);
   
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}

