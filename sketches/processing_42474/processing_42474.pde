


void setup() {
  size(400, 400);
  
  noStroke();
}


void draw() {
  fill(#FFCBCD);
  rect(0,0,width,height);

  fill(#FFFFCB);
  rect(0, 0, 100, 100);
  rect(300, 0, 100, 100);
  rect(0, 300, 100, 100);
  rect(300, 300, 100, 100);
  
  noCursor();
  fill(#FFFFCB);
  rect(mouseX-50,mouseY-50,100,100);
  
} 


void drawCross(float x, float y, float crossSize, int c, float w) {
   
  stroke(c);
 
   
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}






