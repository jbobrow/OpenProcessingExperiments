
 float x= 25;
 float y= 250;
 float w= 50;
 float h= 100;   
 float g= 0;
 



void setup() {
  size(500, 500);
  background(230);
 
}
  
  
  
  
void draw() {;
  
}

void drawCrossShape(float x, float y, float w, float h) { 
  
  
 
 smooth();
  stroke(g);
  fill(g);
  stroke(210);
  beginShape();
  
  vertex(mouseX, mouseY-w);
  vertex(mouseX+w, mouseY-h);
  vertex(mouseX+h, mouseY-w);
  vertex(mouseX+w, mouseY);
  vertex(mouseX+h, mouseY+w);
  vertex(mouseX+w, mouseY+h);
  vertex(mouseX, mouseY+w);
  vertex(mouseX-w, mouseY+h);
  vertex(mouseX-h, mouseY+w);
  vertex(mouseX-w, mouseY);
  vertex(mouseX-h, mouseY-w);
  vertex(mouseX-w, mouseY-h);
  
  endShape(CLOSE);
}

 

 


void mousePressed() {
  g= random(45);
 
  
 drawCrossShape(x, y, w, h);
   }
 
  
  
  


