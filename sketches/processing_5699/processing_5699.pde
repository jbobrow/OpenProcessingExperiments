
void setup(){
  size(200,200);
  noCursor();
}

void draw() 
{ 
  background(204); 
  line(mouseX, mouseY, pmouseX, pmouseY); 
  line(mouseX+5, mouseY+5, pmouseX+5, pmouseY+5); 
  line(mouseX, mouseY+5, pmouseX, pmouseY+5); 
  line(mouseX, mouseY+10, pmouseX, pmouseY+10); 
  line(mouseX+5, mouseY+10, pmouseX+5, pmouseY+10); 
  line(mouseX+10, mouseY+10, pmouseX+10, pmouseY+10); 
  line(mouseX, mouseY+15, pmouseX, pmouseY+15);
 line(mouseX+7, mouseY+15, pmouseX+7, pmouseY+15);  
  line(mouseX+10, mouseY+20, pmouseX+10, pmouseY+20); 
}

