
void setup(){
size(700,400);
noCursor();
smooth();
background(255);
}void draw() 
{ 
  fill(255,30);
  rect(0,0,width,height); 
  line(mouseX, mouseY, pmouseX, pmouseY); 
  line(mouseX-50, mouseY-50, pmouseX-50, pmouseY-50); 
  line(mouseX+50, mouseY+50, pmouseX+50, pmouseY+50); 
  line(mouseX-50, mouseY+50, pmouseX-50, pmouseY+50); 
  //line(mouseX+50, mouseY-50, pmouseX+50, pmouseY-50); 
 // line(mouseX-50, mouseY-50, pmouseX+50, pmouseY+50);
 //line(mouseX+50, mouseY+50, pmouseX-50, pmouseY-50);  
}

