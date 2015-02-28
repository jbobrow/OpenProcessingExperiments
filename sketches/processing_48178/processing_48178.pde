
int r = 1;

void setup() {
  size(300, 300);
  background(255);
  noStroke();
  smooth();
} 
 
 void draw() {
 }
  
 void mouseDragged(){
   if (mouseButton == LEFT){
      
     strokeWeight(4);
     stroke(200, 200, 0);
     line (mouseX, mouseY, pmouseX, pmouseY);
   }
    
   if (mouseButton == RIGHT){
     noStroke();
     fill(0);
     ellipse(mouseX, mouseY, r, r);
     r=r +1;
   }
 }


