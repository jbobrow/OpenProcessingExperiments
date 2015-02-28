
void setup() {
  
  size(1200, 1200);
  noStroke();
  smooth();   
  background(255);
  }

  int w = 10;
 int h = 10;
 
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
