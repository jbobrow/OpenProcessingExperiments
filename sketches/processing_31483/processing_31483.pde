
void setup() {
 
  size(800,800);
  stroke(160,160,220,255);
  background(255);
  smooth();
   }
 
void draw() {
  
  if (mousePressed == false){
      int a; a =mouseX;        
      int b =  mouseY;  
      int c = a + b;
      
      triangle(0,0,0,800,a,b);
      triangle(800,0,800,800,a,b);
   }
  else if(mousePressed == true) {
       noFill();
  }
  
}

                
