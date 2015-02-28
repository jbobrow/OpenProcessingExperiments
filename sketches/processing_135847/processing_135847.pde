
void setup(){
size(500,500);
smooth();

}
void draw() 
{   
  background(255,231,186,75); 
  stroke(255);
  strokeWeight(5);
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
  
  noStroke();
  fill(220,20,60,50);
  ellipse(pmouseX, height/2, pmouseY/2+10, pmouseY/2+10,20,20);
  fill(72,118,255,50);
  ellipse(pmouseY, width/2, pmouseX/2+10, pmouseX/2+10,20,20);
  

}
