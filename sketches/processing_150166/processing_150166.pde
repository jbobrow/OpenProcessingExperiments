
void setup() {
    size(300,300);
    
}

void draw() {
  background(255);
  
  line(50,0,50,height-1);
  line(80,0,80,height-1);
  
  noFill();
  ellipse(mouseX,mouseY,51,51);
  line(mouseX-35,mouseY,mouseX-15,mouseY);
  line(mouseX+15,mouseY,mouseX+35,mouseY);
  line(mouseX,mouseY-35,mouseX,mouseY-15);
  line(mouseX,mouseY+15,mouseX,mouseY+35);
  
  
  fill(0,255,0);
  if(mouseX<50||mouseX>80)
  fill(255,0,0);
  
  rect(width-100,height-100,50,50);

}
