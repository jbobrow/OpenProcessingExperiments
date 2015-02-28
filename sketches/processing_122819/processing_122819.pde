
void setup() {
  size(200, 200);

}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(0, 0, 0);
  rectMode(CENTER);
  rect(mouseX, mouseY+25, 50, 100);
  line(mouseX-50, mouseY, mouseX, mouseY+50); 
  line(mouseX, mouseY+50, mouseX+50, mouseY);
  fill(255);                
  ellipse(mouseX, mouseY-30, 60, 60);  
  fill(0);                   
  ellipse(mouseX-19, mouseY-30, 16, 32);   
  ellipse(mouseX+19, mouseY-30, 16, 32);
  fill(255, 255, 255);
  ellipse(mouseX-17, mouseY-30, 14, 30);
  ellipse(mouseX+18, mouseY-30, 14, 30);
  line(mouseX-10, mouseY-30, mouseX+10, mouseY-30);
  line(mouseX+20,mouseY+90,mouseX+20,mouseY+75);
  line( mouseX-20,mouseY+90,mouseX-20,mouseY+75);
  line( mouseX+20,mouseY+90,mouseX+30,mouseY+90);
  line( mouseX-20,mouseY+90,mouseX-30,mouseY+90);
}

