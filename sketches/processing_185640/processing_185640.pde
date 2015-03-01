
float r = 0.0;

void setup() {
  size(200,400);
  smooth();smooth();
  
}

void draw() {
background (255);

  translate(width/2,height/2);
  
 
  scale(r); 
  
 
  strokeWeight(0);
  fill (mouseX, 0, mouseY);
  rectMode(CENTER);
    rect(20,-10,15,15);
  rect(4,-2,10,10);
  rect(-10,3,5,5);

 
  r += 0.02;
  
 
  if (r > 20) {
    r = -20;
    
   }



  }
  
  
  


