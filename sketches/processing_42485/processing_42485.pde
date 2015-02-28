
void setup() { 
  size(500, 500);
  background(0, 0, 0);
  smooth();
  }
  void draw() {
   
   //background(0);
   noStroke();
   fill(200, 50);
        
  if(mousePressed){
      stroke(255);
      
   }else{
   
      stroke(4); 
  }
    
  fill( 240, 240, 240);
  rect (mouseX, mouseY, 500, 500);
  rect (0, 0, mouseX, mouseY);
  }
 
