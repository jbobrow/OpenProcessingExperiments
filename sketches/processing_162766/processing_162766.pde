
void setup(){
  size(400,400);
}

void draw() {
  rect(mouseX,mouseY,50,50);
  line(mouseX,mouseY+25,mouseX+50,mouseY+25);
  line(mouseX+25,mouseY,mouseX+25,mouseY+50);
  
  rect(225,100,50,50);
  line(225,125,275,125);
  line(250,100,250,150);
 
  
  fill(255,200);
  rect(100,80,200,300);
  
  
}
