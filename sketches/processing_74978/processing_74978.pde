
void setup (){
  size (300, 300);
 
}

void draw (){
  background (255, 229, 231);
  noStroke ();
  fill (240, 197, 189);
  ellipse (height/2, width/2, mouseX, mouseY);
  
  fill(255);
  ellipse (height/2, width/2, mouseX, -150);
  
  fill (100, 63, 7);
  ellipse (height/2, width/2, mouseX-mouseY, mouseY-150);
  
  
  }
