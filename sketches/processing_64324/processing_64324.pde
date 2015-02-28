
float a = 0;
float b = 0;
float co = 0;
 
void setup() {
  background(0);
  colorMode(125);
  size(600,600);
  smooth();
  strokeWeight(20);
   
 
 
   
}
 
void draw () {
  stroke(co, 80, 80, 20);
   
   
  
 if(mousePressed)  {
 ellipse (300,150, mouseY,mouseY);
     ellipse (300, 250, mouseX,mouseX);
      ellipse (300,350, mouseX,mouseX);
        ellipse (300,450, mouseY,mouseY);
   
   
      
   fill(0,50);
  stroke(235);
  noCursor ();
 
 }
 
   a = a + 0.02;
   b = b + 0.10;
    
   co = co + 1;
   if (co >100) {
     co = 0;
   }
 }


