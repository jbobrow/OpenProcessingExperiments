
void setup(){
  size(500,500);
  smooth();
   
}

void draw(){
  ellipse(mouseY, 250, 100, 100);
  ellipse(250, mouseY, 100,100); 
  line(mouseX-50, mouseY, mouseX+50, mouseY);
  line(mouseX, mouseY-50, mouseX, mouseY+50);
  
}

