
void setup() {
  size(300, 300);
  background(0);
  noStroke();
  smooth();
}  

 void draw() {
 }
 
 void mouseDragged(){
   if (mouseButton == LEFT){
     
     strokeWeight(5);
     stroke(248, 239, 4);
     line (mouseX, mouseY, pmouseX, pmouseY);
   }
   
   if (mouseButton == RIGHT){
     noStroke();
     fill(255);
     ellipse(mouseX, mouseY, 10, 10);
   }
 }


