
void setup() { 
size(800, 800); 
background (100,50);
}  
 
void draw () {
   if(mousePressed){
  fill (mouseX, mouseY, 150, 255);
  ellipse (mouseX, mouseY, 50, 50);
   }
  }
  

