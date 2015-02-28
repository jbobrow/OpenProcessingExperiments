
void setup() {
  size(600, 600);
   background(255, 0, 90);
 smooth();
 stroke(0,127,250,255);
 noFill();
  
}
  
void draw () {
  fill(127, 0, 90, 10);
  stroke(255, 0, 0, 127);
  ellipse(300, 300, mouseX, mouseY);
  ellipse(50, 50, mouseX, mouseY);
  ellipse(50, 550, mouseX, mouseY);
  ellipse(550, 50, mouseX, mouseY);
  ellipse(550, 550, mouseX, mouseY);
 
  ellipse(300, 300, mouseY, mouseX);
  ellipse(50, 50, mouseY, mouseX);
  ellipse(50, 550, mouseY, mouseX);
  ellipse(550, 50, mouseY, mouseX);
  ellipse(550, 550, mouseY, mouseX);
  
 fill(0,2);
 rect(0,0, width, height);
 noFill();
 
 stroke(mouseX, 0, mouseY/5);
 noFill();
 drawCircle(width/2,height/2, 400);
 }
 
 void drawCircle(float x, float y, float radius) {
   ellipse(x, y, mouseX/2, radius);
   if(radius > 2) {
     drawCircle(x + radius/2, y, radius/2);
     drawCircle(x - radius/2, y, radius/2);
   }
 
 
}

