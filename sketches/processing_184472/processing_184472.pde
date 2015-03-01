
void setup(){
  
  background (200, 255, 255);
  size (300, 300);
  frameRate(90);
}

 void draw(){
   
   
   stroke(0);
   if (mousePressed == true){
   fill(mouseY, 255, mouseX);
   ellipse(pmouseX, pmouseY, 30, 30);
   println(mouseX, mouseY);
   
 
 }
 }
