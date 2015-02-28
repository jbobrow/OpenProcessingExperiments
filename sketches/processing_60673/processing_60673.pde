
 
void setup() {
  size(200, 200);
}
 
void draw() {
  background(155,255,235);
  
  if (mouseX < 100 && mouseY < 100) {
    fill(160,175,215);
    rect (0,0,100,100);
   }
  

  if (mouseX > 100 && mouseY < 100) {
    fill(255,245,150);
    rect (100,0,100,100);
   } 
  
     
  if (mouseX < 100 && mouseY > 100) {
    fill (255,152,180);
    rect (0,100,100,100);
   }
   
  if (mouseX > 100 && mouseY > 100) {
     fill (224,240,215);
     rect (100,100,100,100);
   }
 
  noStroke();
    
}

void mousePressed() {
 
  saveFrame("2_2.png");
  
}

