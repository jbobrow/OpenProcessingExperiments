
void setup() {
  
  size(1000, 1000);
  noStroke();
  smooth();   
  background(255);
  }

  int w =8;
  int h =8;
 
void draw() {
  
    translate(width/2,height/2);
    
    float r = random(255);
 
  for (int i = 1; i < 400; i++) {
    fill(r, mouseX, mouseY);
    rect (mouseX-i, mouseY+i, w, h);
    rect (mouseX+i, mouseY-i, w, h);
    rect (mouseX+i, mouseY+i, w, h);
    rect (mouseX-i, mouseY-i, w, h);
   
    if (mouseX>0){
      
      rotate(radians(100));   

    } 
  }
  
  
}
