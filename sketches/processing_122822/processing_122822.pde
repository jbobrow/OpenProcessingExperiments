
void setup() {
  size(200, 200);
  mouseY = 100;
}

void draw() {
  background(255);
 
  stroke(0);
  ellipseMode(CENTER); 
  fill(61,165,60);
  ellipse(mouseX, mouseY-30, 100, 70);
  fill(255);
  ellipse(mouseX-20,mouseY-65,40,40);
  ellipse(mouseX+20, mouseY-65,40,40);
  fill(0);
  ellipse (mouseX-10, mouseY-60, 10,10);
  ellipse (mouseX+10, mouseY-60, 10,10);
  fill (240,189,235);
  stroke(240,189,235);
   ellipse (mouseX-35, mouseY-30, 12,12);
   ellipse (mouseX+35, mouseY-30,12,12);
  fill (0);
  stroke(0);
  ellipse( mouseX, mouseY-15,40,20);
 
 

 
}

