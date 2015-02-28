
void setup() {
 size(300,300);
 

 }
 


void draw() {
   background(0);
   fill(#FFFFFF);
   quad(150,75,225,150,150,225,75,150);
   fill(mouseX);
   
  quad(mouseX,mouseY,mouseX+75,mouseY+75,mouseX,mouseY+150,mouseX-75,mouseY+75);
}




